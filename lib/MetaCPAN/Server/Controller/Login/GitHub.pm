package MetaCPAN::Server::Controller::Login::GitHub;

use Moose;

use Cpanel::JSON::XS      qw( decode_json );
use HTTP::Request::Common qw( GET POST );
use LWP::UserAgent        ();

BEGIN { extends 'MetaCPAN::Server::Controller::Login' }

has [qw(consumer_key consumer_secret)] => (
    is       => 'ro',
    required => 1,
);

sub index : Path Args(0) {
    my ( $self, $c ) = @_;
    if ( my $code = $c->req->params->{code} ) {
        my $ua  = LWP::UserAgent->new;
        my $res = $ua->request(
            POST 'https://github.com/login/oauth/access_token',
            [
                client_id     => $self->consumer_key,
                redirect_uri  => $c->uri_for( $self->action_for('index') ),
                client_secret => $self->consumer_secret,
                code          => $code,
            ]
        );
        $c->controller('OAuth2')->redirect( $c, error => $1 )
            if ( $res->content =~ /^error=(.*)$/ );
        ( my $token = $res->content ) =~ s/^access_token=//;
        $c->controller('OAuth2')->redirect( $c, error => 'token' )
            unless ($token);
        $token =~ s/&.*$//;
        my $extra_res = $ua->request(
            GET 'https://api.github.com/user',
            authorization => "token $token"
        );
        my $extra = eval { decode_json( $extra_res->content ) } || {};
        $self->update_user( $c, github => $extra->{id}, $extra );
    }
    else {
        $c->res->redirect(
            'https://github.com/login/oauth/authorize?client_id='
                . $self->consumer_key );
    }
}

1;
