package MetaCPAN::Script::Latest;

use strict;
use warnings;

use Log::Contextual qw( :log );
use Moose;
use CPAN::DistnameInfo          ();
use DateTime::Format::ISO8601   ();
use MetaCPAN::ESConfig          qw( es_doc_path );
use MetaCPAN::Types::TypeTiny   qw( Bool Str );
use MetaCPAN::Util              qw( true false );
use Parse::CPAN::Packages::Fast ();

with 'MetaCPAN::Role::Script', 'MooseX::Getopt';

has dry_run => (
    is      => 'ro',
    isa     => Bool,
    default => 0,
);

has distribution => (
    is  => 'ro',
    isa => Str,
);

has packages => (
    is      => 'ro',
    lazy    => 1,
    builder => '_build_packages',
    traits  => ['NoGetopt'],
);

has force => (
    is      => 'ro',
    isa     => Bool,
    default => 0,
);

sub _build_packages {
    return Parse::CPAN::Packages::Fast->new(
        shift->cpan->child(qw(modules 02packages.details.txt.gz))
            ->stringify );
}

sub _queue_latest {
    my $self = shift;
    my $dist = shift || $self->distribution;

    log_info { "queueing " . $dist };
    $self->_add_to_queue(
        index_latest =>
            [ ( $self->force ? '--force' : () ), '--distribution', $dist ],
        { attempts => 3 }
    );
}

sub run {
    my $self = shift;

    if ( $self->dry_run ) {
        log_info {'Dry run: updates will not be written to ES'};
    }

    my $p = $self->packages;
    $self->es->indices->refresh;

    # If a distribution name is passed get all the package names
    # from 02packages that match that distribution so we can limit
    # the ES query to just those modules.
    my @filter;
    if ( my $distribution = $self->distribution ) {
        foreach my $package ( $p->packages ) {
            my $dist = $p->package($package)->distribution->dist;
            push( @filter, $package )
                if ( $dist && $dist eq $distribution );
        }
        log_info { "$distribution consists of " . @filter . ' modules' };
    }

    return if ( !@filter && $self->distribution );

    # if we are just queueing a single distribution
    if ( $self->queue and $self->distribution ) {
        $self->_queue_latest();
        return;
    }

    my %upgrade;
    my %downgrade;
    my %queued_distributions;

    my $total       = @filter;
    my $found_total = 0;

    my @module_filters;
    if (@filter) {
        while (@filter) {
            my @modules = splice @filter, 0, 500;

            push @module_filters,
                [
                { term  => { 'module.indexed' => true } },
                { terms => { "module.name"    => \@modules } },
                ];
        }
    }
    else {
        push @module_filters,
            [
            { term   => { 'module.indexed' => true } },
            { exists => { field            => "module.name" } },
            ];
    }
    for my $filter (@module_filters) {

        # This query will be used to produce a (scrolled) list of
        # 'file' type records where the module.name matches the
        # distribution name and which are released &
        # indexed (the 'leading' module)
        my $query = {
            bool => {
                must => [
                    {
                        nested => {
                            path  => 'module',
                            query => { bool => { must => $filter } }
                        }
                    },
                    { term => { 'maturity' => 'released' } },
                ],
                must_not => [
                    { term => { status       => 'backpan' } },
                    { term => { distribution => 'perl' } }
                ]
            }
        };

        log_debug {
            'Searching for ' . @$filter . ' of ' . $total . ' modules'
        }
        if @module_filters > 1;

        my $scroll = $self->es->scroll_helper( {
            es_doc_path('file'),
            size => 100,
            body => {
                query   => $query,
                _source => [
                    qw(author date distribution download_url module.name release status)
                ],
                sort => '_doc',
            },
        } );

        $found_total += $scroll->total;

        log_debug { 'Found ' . $scroll->total . ' modules' };
        log_debug { 'Found ' . $found_total . 'total modules' }
        if @$filter != $total and $filter == $module_filters[-1];

        my $i = 0;

        # For each file...
        while ( my $file = $scroll->next ) {
            $i++;
            log_debug { "$i of " . $scroll->total } unless ( $i % 100 );
            my $file_data = $file->{_source};

       # Convert module name into Parse::CPAN::Packages::Fast::Package object.
            my @modules = grep {defined}
                map {
                eval { $p->package( $_->{name} ) }
                } @{ $file_data->{module} };

            $file_data->{date}
                = DateTime::Format::ISO8601->parse_datetime(
                $file_data->{date} );

            # For each of the packages in this file...
            foreach my $module (@modules) {

           # Get P:C:P:F:Distribution (CPAN::DistnameInfo) object for package.
                my $dist = $module->distribution;

                if ( $self->queue ) {
                    my $d = $dist->dist;
                    $self->_queue_latest($d)
                        unless exists $queued_distributions{$d};
                    $queued_distributions{$d} = 1;
                    next;
                }

               # If 02packages has the same author/release for this package...

                # NOTE: CPAN::DistnameInfo doesn't parse some weird uploads
                # (like /\.pm\.gz$/) so distvname might not be present.
                # I assume cpanid always will be.
                if (   defined( $dist->distvname )
                    && $dist->distvname eq $file_data->{release}
                    && $dist->cpanid eq $file_data->{author} )
                {
                    my $upgrade = $upgrade{ $file_data->{distribution} };

                    # If multiple versions of a dist appear in 02packages
                    # only mark the most recent upload as latest.
                    next
                        if $upgrade && $upgrade->{date} > $file_data->{date};
                    $upgrade{ $file_data->{distribution} } = $file_data;
                }
                elsif ( $file_data->{status} eq 'latest' ) {
                    $downgrade{ $file_data->{release} } = $file_data;
                }
            }
        }
    }

    my $bulk = $self->es->bulk_helper( es_doc_path('file') );

    my %to_purge;

    while ( my ( $dist, $file_data ) = each %upgrade ) {

        # Don't reindex if already marked as latest.
        # This just means that it hasn't changed (query includes 'latest').
        next if ( !$self->force and $file_data->{status} eq 'latest' );

        $to_purge{ $file_data->{download_url} } = 1;

        $self->reindex( $bulk, $file_data, 'latest' );
    }

    while ( my ( $release, $file_data ) = each %downgrade ) {

        # Don't downgrade if this release version is also marked as latest.
        # This could happen if a module is moved to a new dist
        # but the old dist remains (with other packages).
        # This could also include bug fixes in our indexer, PAUSE, etc.
        next
            if ( !$self->force
            && $upgrade{ $file_data->{distribution} }
            && $upgrade{ $file_data->{distribution} }->{release} eq
            $file_data->{release} );

        $to_purge{ $file_data->{download_url} } = 1;

        $self->reindex( $bulk, $file_data, 'cpan' );
    }
    $bulk->flush;
    $self->es->indices->refresh;

    # Call Fastly to purge
    $self->purge_cpan_distnameinfos( [
        map CPAN::DistnameInfo->new($_), keys %to_purge ] );
}

# Update the status for the release and all the files.
sub reindex {
    my ( $self, $bulk, $source, $status ) = @_;

    # Update the status on the release.
    my $releases = $self->es->search( {
        es_doc_path('release'),
        body => {
            query => {
                bool => {
                    must => [
                        { term => { author => $source->{author} } },
                        { term => { name   => $source->{release} } },
                    ],
                },
            },
        },
        _source => false,
    } );
    my $release = $releases->{hits}{hits}[0]{_id};

    log_info {
        $status eq 'latest' ? 'Upgrading ' : 'Downgrading ',
            'release ', $source->{release}, "($release)";
    };

    if ( !$self->dry_run ) {
        $self->es->update( {
            es_doc_path('release'),
            id   => $release,
            body => {
                doc => {
                    status => $status,
                },
            },
        } );
    }

    # Get all the files for the release.
    my $scroll = $self->es->scroll_helper(
        es_doc_path('file'),
        size => 100,
        body => {
            query => {
                bool => {
                    must => [
                        { term => { 'release' => $source->{release} } },
                        { term => { 'author'  => $source->{author} } },
                    ],
                },
            },
            _source => [ 'status', 'file' ],
            sort    => '_doc',
        },
    );

    while ( my $row = $scroll->next ) {
        my $source = $row->{_source};
        log_trace {
            $status eq 'latest' ? 'Upgrading ' : 'Downgrading ',
                'file ', $source->{name} || q[];
        };

        # Use bulk update to overwrite the status for X files at a time.
        $bulk->update( { id => $row->{_id}, doc => { status => $status } } )
            unless $self->dry_run;
    }

}

__PACKAGE__->meta->make_immutable;
1;

__END__

=head1 SYNOPSIS

 # bin/metacpan latest

 # bin/metacpan latest --dry_run

=head1 DESCRIPTION

After importing releases from cpan, this script will set the status
to latest on the most recent release, its files and dependencies.
It also makes sure that there is only one latest release per distribution.
