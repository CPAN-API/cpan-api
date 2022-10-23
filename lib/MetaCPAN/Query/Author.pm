package MetaCPAN::Query::Author;

use MetaCPAN::Moose;

use MetaCPAN::Util qw( single_valued_arrayref_to_scalar );
use Ref::Util      qw( is_arrayref );

with 'MetaCPAN::Query::Role::Common';

sub by_ids {
    my ( $self, $ids ) = @_;

    map {uc} @{$ids};

    my $body = {
        query => {
            constant_score => {
                filter => { ids => { values => $ids } }
            }
        },
        size => scalar @{$ids},
    };

    my $authors = $self->es->search(
        index => $self->index_name,
        type  => 'author',
        body  => $body,
    );

    my @authors = map {
        single_valued_arrayref_to_scalar( $_->{_source} );
        $_->{_source}
    } @{ $authors->{hits}{hits} };

    return {
        authors => \@authors,
        took    => $authors->{took},
        total   => $authors->{hits}{total},
    };
}

sub by_user {
    my ( $self, $users ) = @_;
    $users = [$users] unless is_arrayref($users);

    my $authors = $self->es->search(
        index => $self->index_name,
        type  => 'author',
        body  => {
            query => { terms => { user => $users } },
            size  => 500,
        }
    );

    my @authors = map {
        single_valued_arrayref_to_scalar( $_->{_source} );
        $_->{_source}
    } @{ $authors->{hits}{hits} };

    return {
        authors => \@authors,
        took    => $authors->{took},
        total   => $authors->{hits}{total},
    };
}

sub search {
    my ( $self, $query, $from ) = @_;

    my $body = {
        query => {
            bool => {
                should => [
                    {
                        match => {
                            'name.analyzed' =>
                                { query => $query, operator => 'and' }
                        }
                    },
                    {
                        match => {
                            'asciiname.analyzed' =>
                                { query => $query, operator => 'and' }
                        }
                    },
                    { match => { 'pauseid'    => uc($query) } },
                    { match => { 'profile.id' => lc($query) } },
                ]
            }
        },
        size => 10,
        from => $from || 0,
    };

    my $ret = $self->es->search(
        index => $self->index_name,
        type  => 'author',
        body  => $body,
    );

    my @authors = map {
        single_valued_arrayref_to_scalar( $_->{_source} );
        +{ %{ $_->{_source} }, id => $_->{_id} }
    } @{ $ret->{hits}{hits} };

    return +{
        authors => \@authors,
        took    => $ret->{took},
        total   => $ret->{hits}{total},
    };
}

sub prefix_search {
    my ( $self, $query, $opts ) = @_;
    my $size = $opts->{size} // 500;
    my $from = $opts->{from} // 0;

    my $body = {
        query => {
            prefix => {
                pauseid => $query,
            },
        },
        size => $size,
        from => $from,
    };

    my $ret = $self->es->search(
        index => $self->index_name,
        type  => 'author',
        body  => $body,
    );

    my @authors = map {
        single_valued_arrayref_to_scalar( $_->{_source} );
        +{ %{ $_->{_source} }, id => $_->{_id} }
    } @{ $ret->{hits}{hits} };

    return +{
        authors => \@authors,
        took    => $ret->{took},
        total   => $ret->{hits}{total},
    };
}

__PACKAGE__->meta->make_immutable;
1;
