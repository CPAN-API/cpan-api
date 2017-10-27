package MetaCPAN::Server::Controller::Author;

use strict;
use warnings;

use Moose;
use MetaCPAN::Util qw( single_valued_arrayref_to_scalar );

BEGIN { extends 'MetaCPAN::Server::Controller' }

with 'MetaCPAN::Server::Role::JSONP';

__PACKAGE__->config(
    relationships => {
        release => {
            type    => ['Release'],
            self    => 'pauseid',
            foreign => 'author',
        },
        favorite => {
            type    => ['Favorite'],
            self    => 'user',
            foreign => 'user',
        }
    }
);

# https://fastapi.metacpan.org/v1/author/LLAP
sub get : Path('') : Args(1) {
    my ( $self, $c, $id ) = @_;
    $c->add_author_key($id);
    $c->cdn_max_age('1y');
    my $file = $self->model($c)->raw->get($id);
    $c->stash_or_detach(
        $c->model('CPAN::Release')->author_status( $id, $file ) );
}

# /author/search?q=QUERY
sub qsearch : Path('search') : Args(0) {
    my ( $self, $c ) = @_;
    $c->stash_or_detach(
        $self->model($c)->search( @{ $c->req->params }{qw( q from )} ) );
}

# /author/by_ids?id=PAUSE_ID1&id=PAUSE_ID2...
sub by_ids : Path('by_ids') : Args(0) {
    my ( $self, $c ) = @_;
    $c->stash_or_detach( $self->model($c)->by_ids( $c->read_param('id') ) );
}

# /author/by_user/USER_ID
sub by_user : Path('by_user') : Args(1) {
    my ( $self, $c, $user ) = @_;
    $c->stash_or_detach( $self->model($c)->by_user($user) );
}

# /author/by_user?user=USER_ID1&user=USER_ID2...
sub by_users : Path('by_user') : Args(0) {
    my ( $self, $c ) = @_;
    $c->stash_or_detach(
        $self->model($c)->by_user( $c->read_param('user') ) );
}

1;
