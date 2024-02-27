package MetaCPAN::Types::TypeTiny;

use strict;
use warnings;

use Type::Library -base, -declare => ( qw(
    ArrayRefPromote

    PerlMongers
    Blog
    Stat
    Tests
    RTIssueStatus
    GitHubIssueStatus
    BugSummary
    RiverSummary
    Resources

    Logger
    HashRefCPANMeta
) );
use Type::Utils qw( as coerce declare extends from via );

BEGIN {
    extends qw(
        Types::Standard Types::Path::Tiny Types::URI Types::Common::String
    );
}

declare ArrayRefPromote, as ArrayRef;
coerce ArrayRefPromote, from Value, via { [$_] };

declare PerlMongers,
    as ArrayRef [ Dict [ url => Optional [Str], name => NonEmptySimpleStr ] ];
coerce PerlMongers, from HashRef, via { [$_] };

declare Blog,
    as ArrayRef [ Dict [ url => NonEmptySimpleStr, feed => Optional [Str] ] ];
coerce Blog, from HashRef, via { [$_] };

declare Stat,
    as Dict [
    mode  => Int,
    size  => Int,
    mtime => Int
    ];

declare Tests,
    as Dict [ fail => Int, na => Int, pass => Int, unknown => Int ];

declare RTIssueStatus,
    as Dict [
    (
        map { $_ => Optional [Int] }
            qw( active closed new open patched rejected resolved stalled )
    ),
    source => Str
    ];

declare GitHubIssueStatus,
    as Dict [
    ( map { $_ => Optional [Int] } qw( active closed open ) ),
    source => Str,
    ];

declare BugSummary,
    as Dict [
    rt     => Optional [RTIssueStatus],
    github => Optional [GitHubIssueStatus],
    ];

declare RiverSummary,
    as Dict [ ( map { $_ => Optional [Int] } qw(total immediate bucket) ), ];

declare Resources,
    as Dict [
    license    => Optional [ ArrayRef [Str] ],
    homepage   => Optional [Str],
    bugtracker =>
        Optional [ Dict [ web => Optional [Str], mailto => Optional [Str] ] ],
    repository => Optional [
        Dict [
            url  => Optional [Str],
            web  => Optional [Str],
            type => Optional [Str]
        ]
    ]
    ];
coerce Resources, from HashRef, via {
    my $r         = $_;
    my $resources = {};
    for my $field (qw(license homepage bugtracker repository)) {
        my $val = $r->{$field};
        if ( !defined $val ) {
            next;
        }
        elsif ( !ref $val ) {
        }
        elsif ( ref $val eq 'HASH' ) {
            $val = {%$val};
            delete @{$val}{ grep /^x_/, keys %$val };
        }
        $resources->{$field} = $val;
    }
    return $resources;
};

declare Logger, as InstanceOf ['Log::Log4perl::Logger'];
coerce Logger, from ArrayRef, via {
    return MetaCPAN::Role::Logger::_build_logger($_);
};

declare HashRefCPANMeta, as HashRef;
coerce HashRefCPANMeta, from InstanceOf ['CPAN::Meta'], via {
    my $struct = eval { $_->as_struct( { version => 2 } ); };
    return $struct ? $struct : $_->as_struct;
};

# optionally add Getopt option type (adapted from MooseX::Types:Path::Class)
if ( eval { require MooseX::Getopt; 1 } ) {
    for my $type ( Path, AbsPath ) {
        MooseX::Getopt::OptionTypeMap->add_option_type_to_map( $type, '=s' );
    }
}

1;
