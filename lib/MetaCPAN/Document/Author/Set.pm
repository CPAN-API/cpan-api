package MetaCPAN::Document::Author::Set;

use Moose;

use MetaCPAN::Query::Author ();

extends 'ElasticSearchX::Model::Document::Set';

has query_author => (
    is      => 'ro',
    isa     => 'MetaCPAN::Query::Author',
    lazy    => 1,
    builder => '_build_query_author',
    handles => [qw< by_ids by_user search prefix_search >],
);

sub _build_query_author {
    my $self = shift;
    return MetaCPAN::Query::Author->new( es => $self->es );
}

__PACKAGE__->meta->make_immutable;
1;
