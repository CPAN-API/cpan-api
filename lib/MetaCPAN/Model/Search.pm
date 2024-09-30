package MetaCPAN::Model::Search;

use MetaCPAN::Moose;

use Const::Fast               qw( const );
use Hash::Merge               qw( merge );
use List::Util                qw( min uniq );
use Log::Contextual           qw( :log :dlog );
use MetaCPAN::Types::TypeTiny qw( Object Str );
use MetaCPAN::Util qw( single_valued_arrayref_to_scalar true false );
use MooseX::StrictConstructor;

has es => (
    is       => 'ro',
    isa      => Object,
    handles  => { _run_query => 'search', },
    required => 1,
);

has index => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

const my $RESULTS_PER_RUN => 200;
const my @ROGUE_DISTRIBUTIONS => qw(
    Acme-DependOnEverything
    Bundle-Everything
    kurila
    perl-5.005_02+apache1.3.3+modperl
    perlbench
    perl_debug
    perl_mlb
    pod2texi
    spodcxx
);

sub search_for_first_result {
    my ( $self, $search_term ) = @_;
    my $es_query   = $self->build_query($search_term);
    my $es_results = $self->run_query( file => $es_query );

    my $data = $es_results->{hits}{hits}[0];
    single_valued_arrayref_to_scalar( $data->{fields} );
    return $data->{fields};
}

=head2 search_web

  search_web( $search_term, $from, $page_size, $collapsed );

- search_term:
   - can be unqualified string e.g. 'paging'
   - can be author e.g: 'author:LLAP'
   - can be module e.g.: 'module:Data::Pageset'
   - can be distribution e.g.: 'dist:Data-Pageset'

- from: where in result set to start, int

- page_size: number of results per page, int

- collapsed: whether to merge results by dist or not

=cut

sub search_web {
    my ( $self, $search_term, $from, $page_size, $collapsed,
        $max_collapsed_hits )
        = @_;
    $page_size //= 20;
    $from      //= 0;

    $search_term =~ s{([+=><!&|\(\)\{\}[\]\^"~*?\\/])}{\\$1}g;

    # munge the search_term
    # these would be nicer if we had variable-length lookbehinds...
    # Allow q = 'author:LLAP' or 'module:Data::Page' or 'dist:'
    # We are mapping to correct ES fields here - relied on by metacpan-web
    # tests.
    #
    # The exceptions below are used specifically by the front end search.
    $search_term    #
        =~ s{(^|\s)author:([a-zA-Z]+)(?=\s|$)}{$1author:\U$2\E}g;
    $search_term
        =~ s/(^|\s)dist(ribution)?:([\w-]+)(?=\s|$)/$1distribution:$3/g;
    $search_term
        =~ s/(^|\s)module:(\w[\w:]*)(?=\s|$)/$1module.name.analyzed:$2/g;

    my $results
        = $collapsed // $search_term !~ /(distribution|module\.name\S*):/
        ? $self->_search_collapsed( $search_term, $from, $page_size,
        $max_collapsed_hits )
        : $self->_search_expanded( $search_term, $from, $page_size );

    return $results;
}

sub _search_expanded {
    my ( $self, $search_term, $from, $page_size ) = @_;

    # Used for distribution and module searches, the limit is included in
    # the query and ES does the right thing (because we are not collapsing
    # results by distribution).
    my $es_query = $self->build_query(
        $search_term,
        {
            size => $page_size,
            from => $from
        }
    );

    my $es_results = $self->run_query( file => $es_query );

    # Extract results from es
    my $results = $self->_extract_results($es_results);

    $results = [
        map { {
            hits         => [$_],
            distribution => $_->{distribution},
            total        => 1,
        } } @$results
    ];

    my $return = {
        results   => $results,
        total     => $es_results->{hits}->{total},
        took      => $es_results->{took},
        collapsed => false,
    };
    return $return;
}

sub _search_collapsed {
    my ( $self, $search_term, $from, $page_size, $max_collapsed_hits ) = @_;

    $max_collapsed_hits ||= 5;

    my $total_size = $from + $page_size;

    my $es_query_opts = {
        size   => 0,
        fields => [ qw(
        ) ],
    };

    my $es_query = $self->build_query( $search_term, $es_query_opts );
    my $fields   = delete $es_query->{fields};
    my $source   = delete $es_query->{_source};

    $es_query->{aggregations} = {
        by_dist => {
            terms => {
                size  => $total_size,
                field => 'distribution',
                order => {
                    max_score => 'desc',
                },
            },
            aggregations => {
                top_files => {
                    top_hits => {
                        fields  => $fields,
                        _source => $source,
                        size    => $max_collapsed_hits,
                    },
                },
                max_score => {
                    max => {
                        lang   => "expression",
                        script => "_score",
                    },
                },
            },
        },
        total_dists => {
            cardinality => {
                field => 'distribution',
            },
        },
    };

    my $es_results = $self->run_query( file => $es_query );

    my $output = {
        results   => [],
        total     => $es_results->{aggregations}{total_dists}{value},
        took      => $es_results->{took},
        collapsed => true,
    };

    my $last = min( $total_size - 1,
        $#{ $es_results->{aggregations}{by_dist}{buckets} } );
    my @dists = @{ $es_results->{aggregations}{by_dist}{buckets} }
        [ $from .. $last ];

    @{ $output->{results} } = map {
        +{
            hits         => $self->_extract_results( $_->{top_files} ),
            distribution => $_->{key},
            total        => $_->{doc_count},
        };
    } @dists;

    return $output;
}

sub build_query {
    my ( $self, $search_term, $params ) = @_;
    $params //= {};
    ( my $clean = $search_term ) =~ s/::/ /g;

    my $query = {
        bool => {
            filter => [
                { term => { status     => 'latest' } },
                { term => { authorized => true } },
                { term => { indexed    => true } },
                {
                    bool => {
                        should => [
                            {
                                bool => {
                                    must => [
                                        {
                                            exists =>
                                                { field => 'module.name' }
                                        },
                                        {
                                            term =>
                                                { 'module.indexed' => true }
                                        }
                                    ],
                                }
                            },
                            { exists => { field => 'documentation' } },
                        ],
                    }
                },
            ],
            must_not =>
                [ { terms => { distribution => \@ROGUE_DISTRIBUTIONS } }, ],
            must => [
                {
                    bool => {
                        should => [

                            # exact matches result in a huge boost
                            {
                                term => {
                                    'documentation' => {
                                        value => $search_term,
                                        boost => 20,
                                    }
                                }
                            },
                            {
                                term => {
                                    'module.name' => {
                                        value => $search_term,
                                        boost => 20,
                                    }
                                }
                            },

            # take the maximum score from the module name and the abstract/pod
                            {
                                dis_max => {
                                    queries => [
                                        {
                                            query_string => {
                                                fields => [
                                                    qw(documentation.analyzed^2 module.name.analyzed^2 distribution.analyzed),
                                                    qw(documentation.camelcase module.name.camelcase distribution.camelcase)
                                                ],
                                                query            => $clean,
                                                boost            => 3,
                                                default_operator => 'AND',
                                                allow_leading_wildcard =>
                                                    false,
                                                use_dis_max => true,

                                            }
                                        },
                                        {
                                            query_string => {
                                                fields => [
                                                    qw(abstract.analyzed pod.analyzed)
                                                ],
                                                query            => $clean,
                                                default_operator => 'AND',
                                                allow_leading_wildcard =>
                                                    false,
                                                use_dis_max => true,
                                            },
                                        },
                                    ],
                                }
                            },
                        ],
                    }
                },
            ],
        },
    };

    $query = {
        function_score => {
            script_score => {

                # prefer shorter module names
                script => {
                    lang   => 'expression',
                    inline =>
                        "_score - (doc['documentation_length'].value == 0 ? 26 : doc['documentation_length'].value)/400",
                },
            },
            query => {
                boosting => {
                    negative_boost => 0.5,
                    positive       => $query,
                    negative       => {
                        bool => {
                            should => [
                                {
                                    term => { 'mime' => 'text/x-script.perl' }
                                },
                                { term => { 'deprecated' => true } },
                            ],
                        },
                    },
                },
            },
        },
    };

    my $search = merge(
        $params,
        {
            query   => $query,
            _source => [ "module", ],
            fields  => [ qw(
                abstract.analyzed
                author
                authorized
                date
                description
                dist_fav_count
                distribution
                documentation
                id
                indexed
                path
                pod_lines
                release
                status
            ) ],
        }
    );

    # Ensure our requested fields are unique so that Elasticsearch doesn't
    # return us the same value multiple times in an unexpected arrayref.
    $search->{fields} = [ uniq @{ $search->{fields} || [] } ];

    return $search;
}

sub run_query {
    my ( $self, $type, $es_query ) = @_;
    return $self->_run_query(
        index       => $self->index,
        type        => $type,
        body        => $es_query,
        search_type => 'dfs_query_then_fetch',
    );
}

sub _extract_results {
    my ( $self, $es_results ) = @_;

    return [
        map {
            my $res = $_;
            single_valued_arrayref_to_scalar( $res->{fields} );
            +{
                abstract  => delete $res->{fields}->{'abstract.analyzed'},
                favorites => delete $res->{fields}->{dist_fav_count},
                %{ $res->{fields} },
                %{ $res->{_source} },
                score => $res->{_score},
            }
        } @{ $es_results->{hits}{hits} }
    ];
}

1;

