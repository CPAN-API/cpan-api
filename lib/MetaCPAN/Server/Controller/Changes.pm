package MetaCPAN::Server::Controller::Changes;
use Moose;
BEGIN { extends 'MetaCPAN::Server::Controller' }
with 'MetaCPAN::Server::Role::JSONP';

# TODO: __PACKAGE__->config(relationships => ?)

sub index : Chained('/') : PathPart('changes') : CaptureArgs(0) {
}

sub get : Chained('index') : PathPart('') : Args(2) {
    my ( $self, $c, $author, $release ) = @_;

    # find the most likely file
    # TODO: should we do this when the release is indexed
    # and store the result as { 'changes_file' => $name }

    my @candidates = qw(
        CHANGES Changes ChangeLog Changelog CHANGELOG NEWS
    );

    my $file = eval {
        my $files = $c->model('CPAN::File')->inflate(0)->filter({
            and => [
                { term => { release   => $release } },
                { term => { author    => $author } },
                { term => { level     => 0 } },
                { term => { directory => \0 } },
                {   or => [
                        map { { term => { 'file.name' => $_ } } }
                            @candidates
                    ]
                }
            ]
        })
        ->size(scalar @candidates)
        ->sort( [ { name => 'asc' } ] )->first->{_source};
    } or $c->detach('/not_found');

    my $source = $c->model('Source')->path( @$file{qw(author release path)} )
        or $c->detach('/not_found');
    $file->{content} = eval { local $/; $source->openr->getline };
    $c->stash( $file );
}

sub find : Chained('index') : PathPart('') : Args(1) {
    my ( $self, $c, $name ) = @_;
    my $release = eval {
        $c->model('CPAN::Release')->inflate(0)->find($name)->{_source};
    } or $c->detach('/not_found');

    $c->forward( 'get', [ @$release{qw( author name )} ]);
}

1;
