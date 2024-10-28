package MetaCPAN::Server::Controller::Package;

use Moose;
use namespace::autoclean;

BEGIN { extends 'MetaCPAN::Server::Controller' }

with 'MetaCPAN::Server::Role::JSONP';

# https://fastapi.metacpan.org/v1/package/modules/Moose
sub modules : Path('modules') : Args(1) {
    my ( $self, $c, $dist ) = @_;

    my $last = $c->model('ESModel')->doc('release')->find($dist);
    $c->detach( '/not_found', ["Cannot find last release for $dist"] )
        unless $last;
    $c->stash_or_detach(
        $self->model($c)->get_modules( $dist, $last->{version} ) );
}

__PACKAGE__->meta->make_immutable;
1;
