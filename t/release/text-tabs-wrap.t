use strict;
use warnings;

use MetaCPAN::TestHelpers;
use Test::More;

test_distribution(
    'Text-Tabs+Wrap',
    {
        bugs => {
            rt => {
                source =>
                    'https://rt.cpan.org/Public/Dist/Display.html?Name=Text-Tabs%2BWrap',
                new      => 2,
                open     => 0,
                stalled  => 0,
                patched  => 0,
                resolved => 15,
                rejected => 1,
                active   => 2,
                closed   => 16,
            },
        }
    },
    'rt url is uri escaped',
);

test_release(
    {
        name => 'Text-Tabs+Wrap-2013.0523',

        distribution => 'Text-Tabs+Wrap',

        author     => 'LOCAL',
        authorized => 1,
        first      => 1,
        version    => '2013.0523',

        # No modules.
        status => 'cpan',

        provides => [],
    }
);

done_testing;
