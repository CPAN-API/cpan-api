package MetaCPAN::Role::Script;

use strict;
use warnings;

use ElasticSearchX::Model::Document::Types qw(:all);
use FindBin;
use Git::Helpers qw( checkout_root );
use Log::Contextual qw( :log :dlog );
use MetaCPAN::Model;
use MetaCPAN::Types qw(:all);
use Moose::Role;
use Carp ();

has 'cpan' => (
    is      => 'ro',
    isa     => Dir,
    lazy    => 1,
    builder => '_build_cpan',
    coerce  => 1,
    documentation =>
        'Location of a local CPAN mirror, looks for $ENV{MINICPAN} and ~/CPAN',
);

has die_on_error => (
    is            => 'ro',
    isa           => Bool,
    default       => 0,
    documentation => 'Die on errors instead of simply logging',
);

has es => (
    isa           => ES,
    is            => 'ro',
    required      => 1,
    coerce        => 1,
    documentation => 'Elasticsearch http connection string',
);

has model => (
    is      => 'ro',
    lazy    => 1,
    builder => '_build_model',
    traits  => ['NoGetopt'],
);

has index => (
    reader        => '_index',
    is            => 'ro',
    isa           => Str,
    default       => 'cpan',
    documentation => 'Index to use, defaults to "cpan"',
);

has port => (
    isa           => Int,
    is            => 'ro',
    required      => 1,
    documentation => 'Port for the proxy, defaults to 5000',
);

has home => (
    is      => 'ro',
    isa     => Dir,
    lazy    => 1,
    coerce  => 1,
    default => sub { checkout_root() },
);

with 'MetaCPAN::Role::Fastly', 'MetaCPAN::Role::HasConfig',
    'MetaCPAN::Role::Logger';

sub handle_error {
    my ( $self, $error ) = @_;

    # Always log.
    log_fatal {$error};

    # Die if configured (for the test suite).
    Carp::croak $error if $self->die_on_error;
}

sub index {
    my $self = shift;
    return $self->model->index( $self->_index );
}

sub _build_model {
    my $self = shift;

    # es provided by ElasticSearchX::Model::Role
    return MetaCPAN::Model->new( es => $self->es );
}

sub _build_cpan {
    my $self = shift;
    my @dirs = (
        $ENV{MINICPAN},    '/home/metacpan/CPAN',
        "$ENV{HOME}/CPAN", "$ENV{HOME}/minicpan",
    );
    foreach my $dir ( grep {defined} @dirs ) {
        return $dir if -d $dir;
    }
    die
        "Couldn't find a local cpan mirror. Please specify --cpan or set MINICPAN";

}

sub remote {
    shift->es->nodes->info->[0];
}

sub run { }
before run => sub {
    my $self = shift;

    $self->set_logger_once;

    #Dlog_debug {"Connected to $_"} $self->remote;
};

1;

__END__

=pod

=head1 SYNOPSIS

Roles which should be available to all modules

=cut
