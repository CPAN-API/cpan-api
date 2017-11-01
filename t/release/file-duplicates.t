use strict;
use warnings;

use Cpanel::JSON::XS ();
use MetaCPAN::Server::Test;
use MetaCPAN::TestHelpers;
use Test::More;

test_release(
    'BORISNAT/File-Duplicates-1.000',
    {
        first       => 1,
        main_module => 'File::Duplicates',
        modules     => {
            'lib/File/Duplicates.pm' => [
                {
                    name             => 'File::Duplicates',
                    version          => '0.991',
                    version_numified => '0.991',
                    authorized       => Cpanel::JSON::XS::true(),
                    indexed          => Cpanel::JSON::XS::true(),
                    associated_pod   => undef,
                }
            ],
            'lib/File/lib/File/Duplicates.pm' => [
                {
                    name             => 'File::lib::File::Duplicates',
                    version          => '0.992',
                    version_numified => '0.992',
                    authorized       => Cpanel::JSON::XS::true(),
                    indexed          => Cpanel::JSON::XS::true(),
                    associated_pod   => undef,
                }
            ],
            'lib/Dupe.pm' => [
                {
                    name             => 'Dupe',
                    version          => '0.993',
                    version_numified => '0.993',
                    authorized       => Cpanel::JSON::XS::true(),
                    indexed          => 0,
                    associated_pod   => undef,
                }
            ],
            'DupeX/Dupe.pm' => [
                {
                    name             => 'DupeX::Dupe',
                    version          => '0.994',
                    version_numified => '0.994',
                    authorized       => Cpanel::JSON::XS::true(),
                    indexed          => Cpanel::JSON::XS::true(),
                    associated_pod   => undef,
                },
                {
                    name             => 'DupeX::Dupe::X',
                    version          => '0.995',
                    version_numified => '0.995',
                    authorized       => Cpanel::JSON::XS::true(),
                    indexed          => Cpanel::JSON::XS::true(),
                    associated_pod   => undef,
                }
            ],
        },
        extra_tests => sub {
            my $self  = shift;
            my $files = $self->files;

            my %dup = (
                'lib/File/Duplicates.pm' => 4,
                'Dupe.pm'                => 3,
            );

            while ( my ( $path, $count ) = each %dup ) {
                is( scalar( grep { $_->path =~ m{\Q$path\E$} } @$files ),
                    $count, "multiple files match $path" );
            }
        },
    }
);

done_testing;
