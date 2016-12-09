use strict;
use warnings;

use Cpanel::JSON::XS qw( decode_json );
use MetaCPAN::Server::Test;
use MetaCPAN::TestServer;
use Test::More;

my $server = MetaCPAN::TestServer->new;
$server->index_permissions;

test_psgi app, sub {
    my $cb = shift;

    my $module_name = 'CPAN::Test::Dummy::Perl5::VersionBump::Undef';
    ok( my $res = $cb->( GET "/permission/$module_name" ),
        "GET $module_name" );
    is( $res->code, 200, '200 OK' );

    is_deeply(
        decode_json( $res->content ),
        {
            co_maintainers => ['FOOBAR'],
            module_name    => $module_name,
            owner          => 'MIYAGAWA',
        },
        'Owned by MIYAGAWA'
    );
};

done_testing;
