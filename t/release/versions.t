use strict;
use warnings;
use lib 't/lib';

use MetaCPAN::Server::Test qw( model );
use Test::More;

my $model = model();

my %modules = (
    'Versions::Our'                 => '1.45',
    'Versions::PkgNameVersion'      => '1.67',
    'Versions::PkgNameVersionBlock' => '1.89',
    'Versions::PkgVar'              => '1.23',
);

while ( my ( $module, $version ) = each %modules ) {

    ok( my $file = $model->doc('file')->find($module), "find $module" )
        or next;

    ( my $path = "lib/$module.pm" ) =~ s/::/\//;
    is( $file->path, $path, 'expected path' );

    # Check module version (different than dist version).
    is( $file->module->[0]->version, $version, 'version parsed from file' );

}

done_testing;
