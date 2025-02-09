{
    components => 
    {
        schemas =>
        {
            # NOTE: schemas -> api_errors
            api_errors =>
            {
                description => q{Definition of standard errors returned by MetaCPAN API},
                properties =>
                {
                    code =>
                    {
                        description => q{A 3 digits code representing the error.},
                        maxLength => 3,
                        type => 'string',
                    },
                    message =>
                    {
                        description => q{The error message designed for human consumption with more details about the error.},
                        maxLength => 20000,
                        type => 'string',
                    },
                    param =>
                    {
                        description => q{If the error is parameter-specific, the parameter related to the error.},
                        maxLength => 2048,
                        type => 'string',
                    },
                },
                required => [
                    'code',
                ],
                title => 'APIErrors',
                type => 'object',
            },
            # NOTE: schemas -> author_mapping
            author_mapping =>
            {
                description => q{This is the object representing the availble fields for the [author object](https://explorer.metacpan.org/?url=/author/_mapping).},
                properties => 
                {
                    schema =>
                    {
                        '$ref' => "#/components/schemas/profile",
                    }
                },
                title => 'AuthorMapping',
                type => 'object',
            },
            # NOTE: schemas -> changes
            changes =>
            {
                description => q{This is the object representing a MetaCPAN [module changes file](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#get-searches)},
                properties =>
                {
                    author =>
                    {
                        type => 'string',
                    },
                    authorized =>
                    {
                        type => 'boolean',
                    },
                    binary =>
                    {
                        type => 'boolean',
                    },
                    category =>
                    {
                        type => 'string',
                    },
                    content =>
                    {
                        type => 'string',
                    },
                    date =>
                    {
                        type => 'string',
                        format => 'date-time',
                    },
                    deprecated =>
                    {
                        type => 'boolean',
                    },
                    directory =>
                    {
                        type => 'boolean',
                    },
                    dist_fav_count =>
                    {
                        type => 'integer',
                    },
                    distribution =>
                    {
                        type => 'string',
                    },
                    download_url =>
                    {
                        type => 'string',
                    },
                    id =>
                    {
                        type => 'string',
                    },
                    indexed =>
                    {
                        type => 'boolean',
                    },
                    level =>
                    {
                        type => 'integer',
                    },
                    maturity =>
                    {
                        type => 'string',
                    },
                    mime =>
                    {
                        type => 'string',
                    },
                    module =>
                    {
                        items => 
                        {
                            type => 'string',
                        },
                        type => 'array',
                    },
                    name =>
                    {
                        type => 'string',
                    },
                    path =>
                    {
                        type => 'string',
                    },
                    pod =>
                    {
                        type => 'string',
                    },
                    release =>
                    {
                        type => 'string',
                    },
                    sloc =>
                    {
                        type => 'integer',
                    },
                    slop =>
                    {
                        type => 'integer',
                    },
                    'stat' =>
                    {
                        properties =>
                        {
                            mode =>
                            {
                                type => 'integer',
                            },
                            mtime => 
                            {
                                type => 'integer',
                            },
                            size => 
                            {
                                type => 'integer',
                            }
                        },
                    },
                    status =>
                    {
                        type => 'string',
                    },
                    version =>
                    {
                        description => 'Package version string',
                        type => 'string',
                    },
                    version_numified =>
                    {
                        type => 'number',
                        format => 'float',
                    }
                },
                title => 'Changes',
                type => 'object',
            },
            # NOTE: schemas -> cover
            cover =>
            {
                description => q{This is the object representing a MetaCPAN [module coverage](http://cpancover.com/)},
                properties =>
                {
                    criteria => 
                    {
                        description => 'CPAN Cover results',
                        properties =>
                        {
                            branch =>
                            {
                                description => 'Percentage of branch code coverage',
                                type => 'number',
                            },
                            condition =>
                            {
                                description => 'Percentage of condition code coverage',
                                type => 'number',
                            },
                            statement =>
                            {
                                description => 'Percentage of statement code coverage',
                                type => 'number',
                            },
                            subroutine =>
                            {
                                description => 'Percentage of subroutine code coverage',
                                type => 'number',
                            },
                            total =>
                            {
                                description => 'Percentage of total code coverage',
                                type => 'number',
                            }
                        },
                    },
                    distribution =>
                    {
                        description => 'Name of the distribution',
                        type => 'string',
                    },
                    release =>
                    {
                        description => 'Package name with version',
                        type => 'string',
                    },
                    url =>
                    {
                        description => 'URL for cpancover report',
                        type => 'string',
                    },
                    version =>
                    {
                        description => 'Package version string',
                        type => 'string',
                    },
                },
                title => 'Cover',
                type => 'object',
            },
            # NOTE: schemas -> distribution
            distribution =>
            {
                description => q{This is the object representing a MetaCPAN [author distribution](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#distributiondistribution)},
                properties =>
                {
                    bugs => 
                    {
                        properties =>
                        {
                            github =>
                            {
                                properties =>
                                {
                                    active => { type => 'integer' },
                                    closed => { type => 'integer' },
                                    'open' => { type => 'integer' },
                                    source =>
                                    {
                                        maxLength => 2048,
                                        type => 'string',
                                    },
                                },
                            },
                            rt =>
                            {
                                properties =>
                                {
                                    '<html>' => { type => 'number' },
                                    active => { type => 'integer' },
                                    closed => { type => 'integer' },
                                    new => { type => 'integer' },
                                    'open' => { type => 'integer' },
                                    patched => { type => 'integer' },
                                    rejected => { type => 'integer' },
                                    resolved => { type => 'integer' },
                                    source =>
                                    {
                                        maxLength => 2048,
                                        type => 'string',
                                    },
                                    stalled => { type => 'integer' },
                                },
                            },
                        },
                    },
                    external_package => 
                    {
                        properties =>
                        {
                            cygwin =>
                            {
                                maxLength => 2048,
                                type => 'string',
                            },
                            debian =>
                            {
                                maxLength => 2048,
                                type => 'string',
                            },
                            fedora =>
                            {
                                maxLength => 2048,
                                type => 'string',
                            },
                        },
                    },
                    name => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    river => 
                    {
                        properties =>
                        {
                            bucket => { type => 'integer' },
                            bus_factor => { type => 'integer' },
                            immediate => { type => 'integer' },
                            total => { type => 'integer' },
                        },
                    },
                },
                title => 'Distribution',
                type => 'object',
            },
            # NOTE: schemas -> distribution_mapping
            distribution_mapping =>
            {
                description => q{This is the object representing the availble fields for the [distribution object](https://explorer.metacpan.org/?url=/distribution/_mapping).},
                properties => 
                {
                    schema =>
                    {
                        '$ref' => "#/components/schemas/distribution",
                    }
                },
                title => 'DistributionMapping',
                type => 'object',
            },
            # NOTE: schemas -> distributions
            distributions =>
            {
                description => q{This is the object representing a list of distributions.},
                properties =>
                {
                    distributions => 
                    {
                        additionalProperties =>
                        {
                            type => 'object',
                            properties =>
                            {
                                avg =>
                                {
                                    format => 'float',
                                    type => 'number',
                                },
                                count =>
                                {
                                    type => 'integer',
                                },
                                max =>
                                {
                                    format => 'float',
                                    type => 'number',
                                },
                                min =>
                                {
                                    format => 'float',
                                    type => 'number',
                                },
                                sum =>
                                {
                                    format => 'float',
                                    type => 'number',
                                },
                            },
                        },
                        type => 'object',
                        description => 'This contains dynamic properties named after the perl distribution name, such as "Moose"',
                    },
                    took =>
                    {
                        type => 'integer',
                    },
                    total =>
                    {
                        type => 'integer',
                    },
                },
                title => 'Distributions',
                type => 'object',
            },
            # NOTE: schemas -> download_url
            download_url =>
            {
                description => q{This is the object representing a MetaCPAN [distribution download URL](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#download_urlmodule)},
                properties =>
                {
                    checksum_md5 =>
                    {
                        type => 'string',
                    },
                    checksum_sha256 =>
                    {
                        type => 'string',
                    },
                    date =>
                    {
                        description => 'An ISO 8601 datetime',
                        type => 'string',
                        format => 'date-time',
                    },
                    download_url =>
                    {
                        type => 'string',
                    },
                    release =>
                    {
                        type => 'string',
                    },
                    status =>
                    {
                        type => 'string',
                    },
                    version =>
                    {
                        type => 'string',
                    },
                },
                title => 'DownloadURL',
                type => 'object',
            },
            # NOTE: schemas -> error
            error =>
            {
                description => "An error response from the MetaCPAN API",
                properties =>
                {
                    error =>
                    {
                        '$ref' => '#/components/schemas/api_errors'
                    }
                },
                required => [
                    'error'
                ],
                title => 'Error',
                type => 'object',
            },
            # NOTE: schemas -> favorite
            favorite =>
            {
                description => q{This is the object representing favorites},
                properties =>
                {
                    author => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    date => 
                    {
                        description => 'ISO8601 date format',
                        type => 'string',
                        format => 'date-time',
                    },
                    distribution => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    id => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    release => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    user => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                },
                title => 'Favorite',
                type => 'object',
            },
            # NOTE: schemas -> favorites
            favorites =>
            {
                description => q{This is the object representing a user favorites},
                properties =>
                {
                    favorites =>
                    {
                        items =>
                        {
                            '$ref' => '#/components/schemas/favorite',
                        },
                        type => 'array',
                    },
                    took => 
                    {
                        type => 'integer',
                    },
                    total => 
                    {
                        type => 'integer',
                    },
                },
                title => 'Favorites',
                type => 'object',
            },
            # NOTE: schemas -> favorite_mapping
            favorite_mapping =>
            {
                description => q{This is the object representing the availble fields for the [favorite object](https://explorer.metacpan.org/?url=/favorite/_mapping).},
                properties => 
                {
                    schema =>
                    {
                        '$ref' => "#/components/schemas/favorite",
                    }
                },
                title => 'FavoriteMapping',
                type => 'object',
            },
            # NOTE: schemas -> file
            file =>
            {
                description => q{This is the object representing a file},
                properties =>
                {
                    abstract => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    author => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    authorized => { type => 'boolean' },
                    binary => { type => 'boolean' },
                    date =>
                    {
                        description => 'ISO8601 date format',
                        type => 'string',
                        format => 'date-time',
                    },
                    deprecated => { type => 'boolean' },
                    description => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    dir => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    directory => { type => 'boolean' },
                    dist_fav_count => { type => 'integer' },
                    distribution => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    documentation => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    download_url => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    id => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    indexed => { type => 'boolean' },
                    level => { type => 'integer' },
                    maturity => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    mime => 
                    {
                        example => 'text/x-script.perl-module',
                        maxLength => 2048,
                        type => 'string',
                    },
                    # See <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Document/File.pm#L150>
                    module => 
                    {
                        items =>
                        {
                            '$ref' => '#/components/schemas/module',
                        },
                        type => 'array',
                    },
                    name => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    path => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    pod => 
                    {
                        type => 'string',
                    },
                    pod_lines => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    release => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    sloc => { type => 'integer' },
                    slop => { type => 'integer' },
                    stat => 
                    {
                        properties =>
                        {
                            gid => { type => 'number' },
                            mode => { type => 'integer' },
                            mtime => { type => 'integer' },
                            size => { type => 'integer' },
                            uid => { type => 'number' },
                        },
                    },
                    status => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    # TODO Clueless as to what that could be. Find out
                    suggest => {},
                    version => { type => 'string' },
                    version_numified => { type => 'number' },
                },
                title => 'File',
                type => 'object',
            },
            # NOTE: schemas -> file_snapshot
            file_snapshot =>
            {
                description => q{This is the object representing a file snapshot},
                properties =>
                {
                    author => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    category => { type => 'string' },
                    distribution => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    documentation => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    name => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    path => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    pod_lines => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    release => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    status => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                },
                title => 'FileSnapshot',
                type => 'object',
            },
            # NOTE: schemas -> file_preview
            file_preview =>
            {
                description => q{This represents a file preview used in endpoint `/file/dir`},
                properties =>
                {
                    directory => { type => 'boolean' },
                    documentation => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    mime => 
                    {
                        example => 'text/x-script.perl-module',
                        maxLength => 2048,
                        type => 'string',
                    },
                    name => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    path => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    slop => { type => 'integer' },
                    'stat.mime' => { type => 'integer' },
                    'stat.size' => { type => 'integer' },
                },
                title => 'FilePreview',
                type => 'object',
            },
            # NOTE: schemas -> file_mapping
            file_mapping =>
            {
                description => q{This is the object representing the availble fields for the [file object](https://explorer.metacpan.org/?url=/module/_mapping).},
                properties => 
                {
                    schema =>
                    {
                        '$ref' => "#/components/schemas/file",
                    }
                },
                title => 'FileMapping',
                type => 'object',
            },
            # NOTE: schemas -> files
            files =>
            {
                description => q{This is the object representing a list of files},
                properties =>
                {
                    files =>
                    {
                        items =>
                        {
                            '$ref' => '#/components/schemas/file',
                        },
                        type => 'array',
                    },
                    took => 
                    {
                        type => 'integer',
                    },
                    total => 
                    {
                        type => 'integer',
                    },
                },
                title => 'Files',
                type => 'object',
            },
            # NOTE: schemas -> files_categories
            files_categories =>
            {
                description => q{This is the object representing a list of files by categories},
                properties =>
                {
                    categories =>
                    {
                        properties =>
                        {
                            changelog =>
                            {
                                items => 
                                {
                                    '$ref' => '#/components/schemas/file_snapshot',
                                },
                                type => 'array',
                            },
                            contributing =>
                            {
                                items => 
                                {
                                    '$ref' => '#/components/schemas/file_snapshot',
                                },
                                type => 'array',
                            },
                            dist =>
                            {
                                items => 
                                {
                                    '$ref' => '#/components/schemas/file_snapshot',
                                },
                                type => 'array',
                            },
                            license =>
                            {
                                items => 
                                {
                                    '$ref' => '#/components/schemas/file_snapshot',
                                },
                                type => 'array',
                            },
                            other =>
                            {
                                items => 
                                {
                                    '$ref' => '#/components/schemas/file_snapshot',
                                },
                                type => 'array',
                            },
                        },
                        type => 'object',
                    },
                    took => 
                    {
                        type => 'integer',
                    },
                    total => 
                    {
                        type => 'integer',
                    },
                },
                title => 'FilesCategories',
                type => 'object',
            },
            # NOTE: schemas -> files_interesting
            files_interesting =>
            {
                description => q{This is the object representing a list of files},
                properties =>
                {
                    files =>
                    {
                        items =>
                        {
                            '$ref' => '#/components/schemas/file_snapshot',
                        },
                        type => 'array',
                    },
                    took => 
                    {
                        type => 'integer',
                    },
                    total => 
                    {
                        type => 'integer',
                    },
                },
                title => 'FilesInteresting',
                type => 'object',
            },
            # NOTE: schemas -> metadata
            metadata =>
            {
                properties =>
                {
                    abstract =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    author =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    dynamic_config =>
                    {
                        type => 'boolean',
                    },
                    generated_by =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    license => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    meta_spec => 
                    {
                        properties =>
                        {
                            url =>
                            {
                                maxLength => 2048,
                                type => 'string',
                            },
                            version =>
                            {
                                type => 'integer',
                            }
                        },
                    },
                    name =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                    no_index =>
                    {
                        properties =>
                        {
                            directory =>
                            {
                                maxLength => 2048,
                                type => 'string'
                            },
                            package =>
                            {
                                maxLength => 2048,
                                type => 'string'
                            }
                        }
                    },
                    prereqs =>
                    {
                        properties =>
                        {
                            build =>
                            {
                                properties =>
                                {
                                    requires =>
                                    {
                                        additionalProperties =>
                                        {
                                            description => "Key-value pairs of module names with their version number",
                                            type => 'string',
                                        },
                                    }
                                }
                            },
                            configure =>
                            {
                                properties =>
                                {
                                    requires =>
                                    {
                                        additionalProperties =>
                                        {
                                            description => "Key-value pairs of module names with their version number",
                                            type => 'string',
                                        },
                                    }
                                }
                            },
                            runtime =>
                            {
                                properties =>
                                {
                                    requires =>
                                    {
                                        additionalProperties =>
                                        {
                                            description => "Key-value pairs of module names with their version number",
                                            type => 'string',
                                        },
                                    }
                                }
                            },
                            test =>
                            {
                                properties =>
                                {
                                    requires =>
                                    {
                                        additionalProperties =>
                                        {
                                            description => "Key-value pairs of module names with their version number",
                                            type => 'string',
                                        },
                                    }
                                }
                            }
                        }
                    },
                    release_status =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                    resources =>
                    {
                        properties => 
                        {
                            bugtracker =>
                            {
                                properties =>
                                {
                                    web =>
                                    {
                                        maxLength => 2048,
                                        type => 'string'
                                    },
                                    type =>
                                    {
                                        maxLength => 2048,
                                        type => 'string'
                                    }
                                }
                            },
                            repository =>
                            {
                                properties =>
                                {
                                    web =>
                                    {
                                        maxLength => 2048,
                                        type => 'string'
                                    },
                                    type =>
                                    {
                                        maxLength => 2048,
                                        type => 'string'
                                    }
                                }
                            },
                            homepage =>
                            {
                                type => 'string'
                            },
                            license =>
                            {
                                type => 'string'
                            }
                        },
                        type => 'object'
                    },
                    version =>
                    {
                        type => 'string'
                    }
                },
                title => 'Metadata',
                type => 'object',
            },
            # NOTE: schemas -> mirror
            mirror =>
            {
                description => q{This is the object representing a mirror},
                properties =>
                {
                    aka_name =>
                    {
                        type => 'string',
                    },
                    A_or_CNAME =>
                    {
                        type => 'string',
                    },
                    ccode =>
                    {
                        description => 'A 2-characters ISO 3166 country code',
                        maxLength => 2,
                        type => 'string',
                    },
                    city =>
                    {
                        type => 'string',
                    },
                    contact =>
                    {
                        items => 
                        {
                            properties =>
                            {
                                contact_site =>
                                {
                                    type => 'string',
                                },
                                contact_user =>
                                {
                                    type => 'string',
                                },
                            },
                            type => 'object'
                        },
                        type => 'array',
                    },
                    continent =>
                    {
                        type => 'string',
                    },
                    country =>
                    {
                        type => 'string',
                    },
                    distance =>
                    {
                        type => 'string',
                    },
                    distance =>
                    {
                        type => 'string',
                    },
                    dnsrr =>
                    {
                        type => 'string',
                    },
                    ftp =>
                    {
                        type => 'string',
                    },
                    freq =>
                    {
                        type => 'string',
                    },
                    http =>
                    {
                        type => 'string',
                    },
                    inceptdate =>
                    {
                        type => 'string',
                        format => 'date-time',
                    },
                    location =>
                    {
                        items =>
                        {
                            type => 'string',
                        },
                        type => 'array',
                    },
                    name =>
                    {
                        type => 'string',
                    },
                    note =>
                    {
                        type => 'string',
                    },
                    org =>
                    {
                        type => 'string',
                    },
                    region =>
                    {
                        type => 'string',
                    },
                    reitredate =>
                    {
                        type => 'string',
                        format => 'date-time',
                    },
                    rsync =>
                    {
                        type => 'string',
                    },
                    src =>
                    {
                        type => 'string',
                    },
                    tz =>
                    {
                        type => 'string',
                    },
                },
                title => 'Mirror',
                type => 'object',
            },
            # NOTE: schemas -> mirrors
            mirrors =>
            {
                description => q{This is the object representing a list of mirrors},
                properties =>
                {
                    mirrors => 
                    {
                        items =>
                        {
                            '$ref' => '#/components/schemas/mirror',
                        },
                        type => 'array',
                    },
                    total =>
                    {
                        type => 'integer',
                    },
                    took =>
                    {
                        type => 'integer',
                    },
                },
                title => 'Mirrors',
                type => 'object',
            },
            # NOTE: schemas -> module
            module =>
            {
                description => q{This is the object representing a module},
                properties =>
                {
                    abstract => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    # NOTE: This property is not found in file object
                    associated_pod => { type => 'string' },
                    author => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    authorized => { type => 'boolean' },
                    binary => { type => 'boolean' },
                    date =>
                    {
                        description => 'ISO8601 date format',
                        type => 'string',
                        format => 'date-time',
                    },
                    deprecated => { type => 'boolean' },
                    description => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    dir => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    directory => { type => 'boolean' },
                    dist_fav_count => { type => 'integer' },
                    distribution => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    documentation => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    download_url => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    id => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    indexed => { type => 'boolean' },
                    level => { type => 'integer' },
                    maturity => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    mime => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    # See <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Document/File.pm#L150>
                    module => 
                    {
                        '$ref' => '#/components/schemas/module',
                    },
                    name => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    path => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    pod => 
                    {
                        type => 'string',
                    },
                    pod_lines => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    release => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    sloc => { type => 'integer' },
                    slop => { type => 'integer' },
                    stat => 
                    {
                        properties =>
                        {
                            gid => { type => 'number' },
                            mode => { type => 'integer' },
                            mtime => { type => 'integer' },
                            size => { type => 'integer' },
                            uid => { type => 'number' },
                        },
                    },
                    status => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    # TODO Clueless as to what that could be. Find out
                    suggest => {},
                    version => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    version_numified => { type => 'number' },
                },
                title => 'Module',
                type => 'object',
            },
            # NOTE: schemas -> module_mapping
            module_mapping =>
            {
                description => q{This is the object representing the availble fields for the [module object](https://explorer.metacpan.org/?url=/module/_mapping).},
                properties => 
                {
                    schema =>
                    {
                        '$ref' => "#/components/schemas/module",
                    }
                },
                title => 'ModuleMapping',
                type => 'object',
            },
            # NOTE: schemas -> package
            package =>
            {
                description => q{This is the object representing a MetaCPAN [module package](https://github.com/metacpan/metacpan-api/blob/master/lib/MetaCPAN/Document/Package.pm)},
                properties =>
                {
                    author => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    dist_version => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    distribution => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    file => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    module_name => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    version => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                },
                title => 'Package',
                type => 'object',
            },
            # NOTE: schemas -> permission
            permission =>
            {
                description => q{This is the object representing a MetaCPAN [module permission](https://github.com/metacpan/metacpan-api/blob/master/lib/MetaCPAN/Document/Permission.pm)},
                properties =>
                {
                    co_maintainers => 
                    {
                        items =>
                        {
                            maxLength => 2048,
                            type => 'string',
                        },
                        type => 'array',
                    },
                    module_name => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    owner => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                },
                title => 'Permission',
                type => 'object',
            },
            # NOTE: schemas -> favorites
            permissions =>
            {
                description => q{This is the object representing a user permissions},
                properties =>
                {
                    permissions =>
                    {
                        items =>
                        {
                            properties =>
                            {
                                co_maintainers =>
                                {
                                    items =>
                                    {
                                        description => "List of co-maintainer's pause ID",
                                        maxLength => 2048,
                                        type => 'string',
                                    },
                                    type => 'array',
                                },
                                module_name =>
                                {
                                    example => 'Bundle::DBI',
                                    maxLength => 2048,
                                    type => 'string',
                                },
                                owner =>
                                {
                                    description => "This is the owner's pause ID",
                                    example => 'TIMB',
                                    maxLength => 2048,
                                    type => 'string',
                                },
                            },
                            type => 'object',
                        },
                        type => 'array',
                    },
                    took => 
                    {
                        type => 'integer',
                    },
                    total => 
                    {
                        type => 'integer',
                    },
                },
                title => 'Permissions',
                type => 'object',
            },
            # NOTE: schemas -> profile
            profile =>
            {
                description => q{This is the object representing a MetaCPAN [author profile](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#authorauthor)},
                properties =>
                {
                    asciiname => 
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    blog => 
                    {
                        properties =>
                        {
                            feed => 
                            {
                                maxLength => 2048,
                                type => 'string'
                            },
                            url => 
                            {
                                maxLength => 2048,
                                type => 'string'
                            },
                        },
                    },
                    city => 
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                    country => 
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                    donation => 
                    {
                        items =>
                        {
                            anyOf => [
                            {
                                properties =>
                                {
                                    id => 
                                    {
                                        maxLength => 2048,
                                        type => 'string'
                                    },
                                    name =>
                                    {
                                        maxLength => 2048,
                                        type => 'string'
                                    },
                                },
                            }],
                        },
                        type => 'array',
                    },
                    email => 
                    {
                        items =>
                        {
                            maxLength => 2048,
                            type => 'string',
                        },
                        type => 'array',
                    },
                    gravatar_url => 
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                    is_pause_custodial_account => { type => 'boolean' },
                    # NOTE: although 'links' is present in data returned, it is undocumented
                    links =>
                    {
                        description => "An hash of key-URI pairs",
                        properties =>
                        {
                            backpan_directory => { type => 'string' },
                            cpan_directory => { type => 'string' },
                            cpantesters_matrix => { type => 'string' },
                            cpantesters_reports => { type => 'string' },
                            cpants => { type => 'string' },
                            metacpan_explorer => { type => 'string' },
                            repology => { type => 'string' },
                        },
                    },
                    # NOTE: location -> [ 52.847098, -8.98849 ]
                    location => 
                    {
                        items => 
                        {
                            type => 'number',
                            format => 'float',
                        },
                        type => 'array',
                    },
                    name => 
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                    pauseid => 
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                    perlmongers => 
                    {
                        properties => 
                        {
                            name =>
                            {
                                maxLength => 2048,
                                type => 'string'
                            },
                            url =>
                            {
                                maxLength => 2048,
                                type => 'string'
                            },
                        },
                    },
                    profile => 
                    {
                        items =>
                        {
                            properties =>
                            {
                                id =>
                                {
                                    maxLength => 2048,
                                    type => 'string'
                                },
                                name =>
                                {
                                    maxLength => 2048,
                                    type => 'string'
                                },
                            },
                            type => 'object',
                        },
                        type => 'array',
                    },
                    # NOTE: 'release_count' is present in data returned by the REST API, but is undocumented
                    release_count =>
                    {
                        properties =>
                        {
                            'backpan-only' => { type => 'integer' },
                            cpan => { type => 'integer' },
                            latest => { type => 'integer' },
                        },
                    },
                    region => 
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                    updated => 
                    {
                        type => 'string',
                        format => 'date-time',
                    },
                    user => 
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                    website => 
                    {
                        items =>
                        {
                            maxLength => 2048,
                            type => 'string',
                        },
                        type => 'array',
                    },
                },
                title => 'Profile',
                type => 'object',
            },
            # NOTE: schemas -> rating
            rating =>
            {
                description => q{This is the object representing a rating)},
                properties =>
                {
                    author => 
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                    date => 
                    {
                        description => 'ISO8601 datetime',
                        type => 'string',
                        format => 'date-time',
                    },
                    # See <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Document/Rating.pm#L12>
                    details => 
                    {
                        properties =>
                        {
                            description =>
                            {
                                maxLength => 2048,
                                type => 'string',
                            },
                        },
                    },
                    distribution => 
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                    helpful => 
                    {
                        items =>
                        {
                            properties =>
                            {
                                user =>
                                {
                                    maxLength => 2048,
                                    type => 'string'
                                },
                                value => { type => 'boolean' },
                            },
                            type => 'object',
                        },
                        type => 'array',
                    },
                    rating => { type => 'number' },
                    release => 
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                    user => 
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                },
                title => 'Rating',
                type => 'object',
            },
            # NOTE: schemas -> rating_mapping
            rating_mapping =>
            {
                description => q{This is the object representing the availble fields for the [rating object](https://explorer.metacpan.org/?url=/rating/_mapping).},
                properties => 
                {
                    schema =>
                    {
                        '$ref' => "#/components/schemas/rating",
                    }
                },
                title => 'RatingMapping',
                type => 'object',
            },
            # NOTE: schemas -> release
            release =>
            {
                description => q{This is the object representing a release)},
                properties =>
                {
                    abstract => 
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                    archive => 
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                    author => 
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                    authorized => { type => 'boolean' },
                    changes_file => 
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                    checksum_md5 => 
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                    checksum_sha256 => 
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                    date => 
                    {
                        description => 'ISO8601 datetime',
                        type => 'string',
                        format => 'date-time',
                    },
                    dependency => 
                    {
                        items => 
                        {
                            type => 'object',
                            properties =>
                            {
                                module =>
                                {
                                    maxLength => 2048,
                                    type => 'string'
                                },
                                phase =>
                                {
                                    maxLength => 2048,
                                    type => 'string'
                                },
                                relationship =>
                                {
                                    maxLength => 2048,
                                    type => 'string'
                                },
                                version =>
                                {
                                    maxLength => 2048,
                                    type => 'string'
                                },
                            },
                        },
                        type => 'array',
                    },
                    deprecated => { type => 'boolean' },
                    distribution => 
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                    download_url => 
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                    first => { type => 'boolean' },
                    id => 
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                    license => 
                    {
                        items => 
                        {
                            # e.g.: perl_5
                            maxLength => 2048,
                            type => 'string',
                        },
                        type => 'array',
                    },
                    main_module => 
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                    maturity => 
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                    metadata =>
                    {
                        '$ref' => '#/components/schemas/metadata',
                    },
                    name => 
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                    provides => 
                    {
                        items =>
                        {
                            maxLength => 2048,
                            type => 'string'
                        },
                        type => 'array'
                    },
                    # See <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Types/TypeTiny.pm#L74>
                    resources => 
                    {
                        properties =>
                        {
                            bugtracker =>
                            {
                                properties =>
                                {
                                    mailto =>
                                    {
                                        maxLength => 2048,
                                        type => 'string'
                                    },
                                    web =>
                                    {
                                        maxLength => 2048,
                                        type => 'string'
                                    },
                                },
                            },
                            homepage =>
                            {
                                maxLength => 2048,
                                type => 'string'
                            },
                            license =>
                            {
                                items =>
                                {
                                    maxLength => 2048,
                                    type => 'string',
                                },
                                type => 'array',
                            },
                            repository =>
                            {
                                properties =>
                                {
                                    type =>
                                    {
                                        maxLength => 2048,
                                        type => 'string'
                                    },
                                    url =>
                                    {
                                        maxLength => 2048,
                                        type => 'string'
                                    },
                                    web =>
                                    {
                                        maxLength => 2048,
                                        type => 'string'
                                    },
                                },
                            },
                        },
                    },
                    stat => 
                    {
                        properties =>
                        {
                            gid => { type => 'number' },
                            mode => { type => 'integer' },
                            mtime => { type => 'integer' },
                            size => { type => 'integer' },
                            uid => { type => 'number' },
                        },
                    },
                    status => 
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                    tests => 
                    {
                        properties =>
                        {
                            fail => { type => 'integer' },
                            na => { type => 'integer' },
                            pass => { type => 'integer' },
                            unknown => { type => 'integer' },
                        },
                    },
                    version => 
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                    version_numified => { type => 'number' },
                },
                title => 'Release',
                type => 'object',
            },
            # NOTE: schemas -> release_recents
            release_recents =>
            {
                description => q{This is the object representing a list of recent releases},
                properties =>
                {
                    releases =>
                    {
                        items =>
                        {
                            properties =>
                            {
                                abstract =>
                                {
                                    type => 'string',
                                },
                                author =>
                                {
                                    type => 'string',
                                },
                                date =>
                                {
                                    type => 'string',
                                    format => 'date-time',
                                },
                                distribution =>
                                {
                                    type => 'string',
                                },
                                name =>
                                {
                                    type => 'string',
                                },
                                status =>
                                {
                                    type => 'string',
                                },
                            },
                            type => 'object',
                        },
                        type => 'array',
                    },
                    total => 
                    {
                        type => 'integer',
                    },
                    took => 
                    {
                        type => 'integer',
                    },
                },
                title => 'ReleaseRecents',
                type => 'object',
            },
            # NOTE: schemas -> release_mapping
            release_mapping =>
            {
                description => q{This is the object representing the availble fields for the [release object](https://explorer.metacpan.org/?url=/release/_mapping).},
                properties => 
                {
                    schema =>
                    {
                        '$ref' => "#/components/schemas/release",
                    }
                },
                title => 'ReleaseMapping',
                type => 'object',
            },
            # NOTE: schemas -> releases
            releases =>
            {
                description => q{This is the object representing a list of releases},
                properties =>
                {
                    releases =>
                    {
                        items =>
                        {
                            '$ref' => '#/components/schemas/release',
                        },
                        type => 'array',
                    },
                    took => 
                    {
                        type => 'integer',
                    },
                    total => 
                    {
                        type => 'integer',
                    },
                },
                title => 'Releases',
                type => 'object',
            },
            # NOTE: schemas -> result_set
            result_set =>
            {
                description => q{This is the object representing a search result set)},
                properties =>
                {
                    hits => 
                    {
                        properties =>
                        {
                            hits => 
                            {
                                items => 
                                {
                                    properties =>
                                    {
                                        _id => { type => 'string' },
                                        _index => 
                                        {
                                            description => "For example: cpan_v1_01",
                                            type => "string",
                                        },
                                        _score => { type => 'number' },
                                        _source => 
                                        {
                                            oneOf => [
                                                { '$ref' => '#/components/schemas/profile' },
                                                { '$ref' => '#/components/schemas/distribution' },
                                                { '$ref' => '#/components/schemas/favorite' },
                                                { '$ref' => '#/components/schemas/file' },
                                                { '$ref' => '#/components/schemas/rating' },
                                                { '$ref' => '#/components/schemas/release' },
                                            ],
                                        },
                                        _type => 
                                        {
                                            enum => [qw( author distribution favorite file rating release )],
                                            type => 'string',
                                        },
                                    },
                                    type => 'object',
                                },
                                type => 'array',
                            },
                            total => { type => 'integer' },
                            max_score => { type => 'number' },
                        },
                    },
                    _shards => 
                    {
                        properties =>
                        {
                            total =>  { type => 'integer' },
                            successful => { type => 'integer' },
                            failed => { type => 'integer' },
                        },
                    },
                    took => { type => 'integer' },
                    timed_out => { type => 'boolean' },
                },
                title => 'ResultSet',
                type => 'object',
            },
            # NOTE: schemas -> reverse_dependencies
            reverse_dependencies =>
            {
                description => q{This is the object representing a reverse dependencies result set)},
                properties =>
                {
                    data => 
                    {
                        items =>
                        {
                            '$ref' => '#/components/schemas/release',
                        },
                        type => 'array',
                    },
                    took => { type => 'integer' },
                    timed_out => { type => 'boolean' },
                },
                title => 'ReverseDependencies',
                type => 'object',
            },
            # NOTE: schemas -> river
            river =>
            {
                description => q{This is the object representing a distribution river)},
                example => '/v1/distribution/river/Moose',
                properties =>
                {
                    river => 
                    {
                        properties =>
                        {
                            module =>
                            {
                                properties =>
                                {
                                    bus_factor =>
                                    {
                                        type => 'integer',
                                    },
                                    bucket => 
                                    {
                                        type => 'integer',
                                    },
                                    immediate => 
                                    {
                                        type => 'integer',
                                    },
                                    total => 
                                    {
                                        type => 'integer',
                                    },
                                },
                                type => 'object',
                                example => 'Moose',
                            },
                        },
                        type => 'object'
                    },
                },
                title => 'River',
                type => 'object',
            },
            # NOTE: schemas -> scroll
            scroll =>
            {
                description => q{This is the object representing a scroll search follow-on query)},
                properties => 
                {
                    scroll =>
                    {
                        description => "Specifies the [scroll query time to live](https://www.elastic.co/guide/en/elasticsearch/reference/2.4/search-request-scroll.html#scroll-search-context).",
                        type => 'string',
                    },
                    size =>
                    {
                        description => "Specifies the [scroll page size](https://www.elastic.co/guide/en/elasticsearch/reference/2.4/search-request-scroll.html).",
                        type => 'integer',
                    },
                    scroll_id =>
                    {
                        description => "Specifies the [search scroll ID](https://www.elastic.co/guide/en/elasticsearch/reference/2.4/search-request-scroll.html).",
                        type => 'string',
                    },
                },
                required => ["scroll", "scroll_id"],
                title => 'Scroll search',
                type => 'object',
            },
            # NOTE: schemas -> scroll_result_set
            scroll_result_set =>
            {
                description => q{This is the object representing a scroll search result set)},
                allOf => [
                    { '$ref' => '#/components/schemas/result_set' },
                    properties =>
                    {
                        _scroll_id => 
                        {
                            type => 'string',
                        },
                    },
                ],
                title => 'ResultSet',
            },
            # NOTE: schemas -> search
            search =>
            {
                description => q{This is the object representing a search query)},
                properties => 
                {
                    aggs =>
                    {
                        description => "Specifies the aggregation method for the [search query](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#post-searches).",
                        properties =>
                        {
                            license =>
                            {
                                properties =>
                                {
                                    terms => 
                                    {
                                        properties =>
                                        {
                                            field =>
                                            {
                                                type => 'string',
                                            },
                                            size =>
                                            {
                                                type => 'integer',
                                            },
                                        },
                                    }
                                },
                                type => 'object',
                            }
                        },
                    },
                    fields =>
                    {
                        description => "Specifies which fields in the response should be provided.",
                        type => 'array',
                    },
                    filter =>
                    {
                        description => "",
                        properties =>
                        {
                            'and' =>
                            {
                                items =>
                                {
                                    anyOf => [
                                        {
                                            properties =>
                                            {
                                                'exists' => 
                                                {
                                                    additionalProperties => {},
                                                    type => 'object',
                                                },
                                            },
                                        },
                                        {
                                            properties =>
                                            {
                                                missing => 
                                                {
                                                    additionalProperties => {},
                                                    type => 'object',
                                                },
                                            },
                                        },
                                        {
                                            properties =>
                                            {
                                                term => 
                                                {
                                                    additionalProperties => {},
                                                    type => 'object',
                                                },
                                            },
                                        },
                                    ],
                                },
                                type => 'array',
                            },
                            'not' =>
                            {
                                items =>
                                {
                                    anyOf => [
                                        {
                                            properties =>
                                            {
                                                'exists' => 
                                                {
                                                    additionalProperties => {},
                                                    type => 'object',
                                                },
                                            },
                                        },
                                        {
                                            properties =>
                                            {
                                                missing => 
                                                {
                                                    additionalProperties => {},
                                                    type => 'object',
                                                },
                                            },
                                        },
                                        {
                                            properties =>
                                            {
                                                term => 
                                                {
                                                    additionalProperties => {},
                                                    type => 'object',
                                                },
                                            },
                                        },
                                    ],
                                },
                                type => 'array',
                            },
                            'or' =>
                            {
                                items =>
                                {
                                    anyOf => [
                                        {
                                            properties =>
                                            {
                                                'exists' => 
                                                {
                                                    additionalProperties => {},
                                                    type => 'object',
                                                },
                                            },
                                        },
                                        {
                                            properties =>
                                            {
                                                missing => 
                                                {
                                                    additionalProperties => {},
                                                    type => 'object',
                                                },
                                            },
                                        },
                                        {
                                            properties =>
                                            {
                                                term => 
                                                {
                                                    additionalProperties => {},
                                                    type => 'object',
                                                },
                                            },
                                        },
                                    ],
                                },
                                type => 'array',
                            },
                        },
                        type => 'object',
                    },
                    from =>
                    {
                        description => "Specifies the offset, starting at 0, from which to return the results.",
                        type => 'integer',
                    },
                    query =>
                    {
                        description => "Specifies the [search query](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#post-searches).",
                        type => 'string',
                    },
                    size =>
                    {
                        description => "Specifies the maximum number of [search](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#post-searches) result elements.",
                        type => 'integer',
                    },
                    sort =>
                    {
                        description => "Specifies the elements to sort the [search](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#post-searches) result.",
                        type => 'string',
                    },
                },
                title => 'Search',
                type => 'object',
            },
        },
    },
    info =>
    {
        contact =>
        {
            email => 'admin@metacpan.org',
            name => 'CPAN Administrators',
            url => 'https://metacpan.org',
        },
        description => 'The MetaCPAN REST API. Please see https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md for more details.',
        termsOfService => "https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#being-polite",
        title => 'MetaCPAN API',
        version => '2023-07-27',
    },
    openapi => '3.0.0',
    paths =>
    {
        # NOTE: /v1/author
        '/v1/author' =>
        {
            get => 
            {
                description => 'Retrieves author information details.',
                operationId => 'GetAuthor',
                parameters => [
                {
                    in => 'query',
                    name => 'q',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => 'The offset starting from 0 within the total data.',
                    in => 'query',
                    name => 'from',
                    required => \0,
                    schema =>
                    {
                        type => 'integer',
                    },
                    style => 'simple',
                },
                {
                    description => 'The size of each page, i.e. how many results are returned per page. This usually defaults to 10.',
                    in => 'query',
                    name => 'size',
                    required => \0,
                    schema =>
                    {
                        type => 'integer',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => 'Retrieves author information details.',
                operationId => 'PostAuthor',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => 
                                {
                                    "q" => 
                                    {
                                        maxLength => 2048,
                                        type => 'string',
                                    },
                                    from => 
                                    {
                                        type => 'integer',
                                    },
                                    size => 
                                    {
                                        type => 'integer',
                                    },
                                    fields => 
                                    {
                                        maxLength => 2048,
                                        type => 'string',
                                    },
                                },
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Author.pm#L45>
        # NOTE: /v1/author/by_ids
        '/v1/author/by_ids' =>
        {
            get => 
            {
                description => 'Retrieves author information details using pause ID.',
                example => '/v1/author/by_ids?id=PAUSE_ID1&id=PAUSE_ID2...',
                operationId => 'GetAuthorByPauseID',
                parameters => [
                {
                    in => 'query',
                    name => 'id',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => 'Retrieves author information details using pause ID.',
                example => '/v1/author/by_ids with JSON payload: {"id": ["PAUSE_ID1", "PAUSE_ID2"]}',
                operationId => 'PostAuthorByPauseID',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => 
                                {
                                    id => 
                                    {
                                        maxLength => 2048,
                                        type => 'string',
                                    },
                                    fields =>
                                    {
                                        description => "Specifies which fields in the response should be provided.",
                                        maxLength => 2048,
                                        type => 'string',
                                    },
                                },
                                type => 'object',
                                required => ["id"],
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Author.pm#L64>
        # NOTE: /v1/author/by_prefix/{prefix}
        '/v1/author/by_prefix/{prefix}' =>
        {
            get => 
            {
                description => 'Retrieves author information details using parts of the pause ID.',
                operationId => 'GetAuthorByPrefix',
                parameters => [
                {
                    in => 'path',
                    name => 'prefix',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies from which offset to return the results.",
                    in => 'query',
                    name => 'from',
                    required => \0,
                    schema =>
                    {
                        type => 'integer'
                    },
                },
                {
                    description => "Specifies the maximum size of the results.",
                    in => 'query',
                    name => 'size',
                    required => \0,
                    schema =>
                    {
                        type => 'integer'
                    },
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            # There is no POST method for this endpoint.
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Author.pm#L57>
        # NOTE: /v1/author/by_user
        '/v1/author/by_user' =>
        {
            get => 
            {
                description => 'Retrieves author information details using user ID in query string.',
                example => '/v1/author/by_user?user=oa-cmsLWTTOALauLxve1LA&user=2n2yGvQ4QxenVpSzkkTitQ',
                operationId => 'GetAuthorByUserIDQuery',
                parameters => [
                {
                    in => 'query',
                    name => 'user',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => 'Retrieves author information details using user ID.',
                example => '/v1/author/by_user woth JSON payload {"user": ["oa-cmsLWTTOALauLxve1LA","2n2yGvQ4QxenVpSzkkTitQ"]}',
                operationId => 'PostAuthorByUserIDQuery',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => 
                                {
                                    user =>
                                    {
                                        description => 'This is the user id, which is different from the PAUSEID',
                                        maxLength => 2048,
                                        type => 'string',
                                    },
                                    fields =>
                                    {
                                        description => "Specifies which fields in the response should be provided.",
                                        maxLength => 2048,
                                        type => 'string',
                                    },
                                },
                                type => 'object',
                                required => ["user"],
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Author.pm#L51>
        # NOTE: /v1/author/by_user/{user}
        '/v1/author/by_user/{user}' =>
        {
            get => 
            {
                description => 'Retrieves author information details using user ID.',
                operationId => 'GetAuthorByUserID',
                parameters => [
                {
                    description => 'This is the user id, which is different from the PAUSEID',
                    in => 'path',
                    name => 'user',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/author/{author}
        '/v1/author/{author}' =>
        {
            get => 
            {
                description => 'Retrieves an author information details.',
                operationId => 'GetAuthorProfile',
                parameters => [
                {
                    in => 'path',
                    name => 'author',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which object to [join](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#joins) in the result.",
                    in => 'query',
                    name => 'join',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/profile",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/author/_mapping
        '/v1/author/_mapping' =>
        {
            get => 
            {
                description => qq{Returns the available fields for the [author object](https://explorer.metacpan.org/?url=/author/_mapping).},
                operationId => 'GetAuthorMapping',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/author_mapping",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/author/_search
        '/v1/author/_search' =>
        {
            get => 
            {
                description => qq{Returns the result set for the author search.},
                operationId => 'GetAuthorSearch',
                parameters => [
                {
                    description => "Specifies the [search query](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#get-searches).",
                    in => 'query',
                    name => 'q',
                    required => \1,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    description => "Specifies the offset from which to return results.",
                    in => 'query',
                    name => 'from',
                    required => \0,
                    schema =>
                    {
                        type => 'integer',
                    },
                },
                {
                    description => "Specifies the time to live of the [scroll search](https://www.elastic.co/guide/en/elasticsearch/reference/2.4/search-request-scroll.html#scroll-search-context).",
                    in => 'query',
                    name => 'scroll',
                    required => \0,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    description => "Specifies the maximum number of [search](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#get-searches) result elements.",
                    in => 'query',
                    name => 'size',
                    required => \0,
                    schema =>
                    {
                        type => 'integer',
                    },
                },
                {
                    description => "Specifies the elements to sort the [search](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#get-searches) result.",
                    in => 'query',
                    name => 'sort',
                    required => \0,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        type => 'string',
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => qq{Returns the result set for the author search.},
                operationId => 'PostAuthorSearch',
                parameters => [
                {
                    description => "Specifies the time to live of the [scroll search](https://www.elastic.co/guide/en/elasticsearch/reference/2.4/search-request-scroll.html#scroll-search-context).",
                    in => 'query',
                    name => 'scroll',
                    required => \0,
                    schema =>
                    {
                        type => 'string',
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                '$ref' => '#/components/schemas/search',
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/author/_search/scroll
        '/v1/author/_search/scroll' =>
        {
            'delete' =>
            {
                description => qq{Clear a [scroll](https://www.elastic.co/guide/en/elasticsearch/reference/8.9/paginate-search-results.html#clear-scroll)},
                operationId => 'DeleteAuthorSearchScroll',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                oneOf => [
                                    {
                                        properties => 
                                        {
                                            scroll_id =>
                                            {
                                                type => 'string',
                                            },
                                        },
                                    },
                                    {
                                        properties => 
                                        {
                                            scroll_id =>
                                            {
                                                items =>
                                                {
                                                    type => 'string',
                                                },
                                                type => 'array',
                                            },
                                        },
                                    },
                                ],
                            }
                        }
                    },
                    required => \1,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    type => 'object',
                                    properties =>
                                    {
                                        # TODO: Need to find out what is returned upon clearing a scroll
                                        removed =>
                                        {
                                            type => 'boolean',
                                        }
                                    }
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            get => 
            {
                description => qq{Returns the result set for the author search.},
                operationId => 'GetAuthorSearchScroll',
                parameters => [
                {
                    description => "Specifies the time to live of the [scroll search](https://www.elastic.co/guide/en/elasticsearch/reference/2.4/search-request-scroll.html#scroll-search-context).",
                    in => 'query',
                    name => 'scroll',
                    required => \1,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    description => "Specifies the [scroll ID](https://www.elastic.co/guide/en/elasticsearch/reference/2.4/search-request-scroll.html).",
                    in => 'query',
                    name => 'scroll_id',
                    required => \1,
                    schema =>
                    {
                        type => 'string',
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/scroll_result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => qq{Returns the result set for the author search.},
                operationId => 'PostAuthorSearchScroll',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                '$ref' => '#/components/schemas/scroll',
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/scroll_result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Changes.pm#L68>
        # NOTE: /v1/changes/by_releases
        '/v1/changes/by_releases' =>
        {
            get => 
            {
                description => 'Retrieves a distribution Changes file details using author and release information.',
                operationId => 'GetChangesFileByRelease',
                parameters => [
                {
                    in => 'query',
                    name => 'release',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                    example => '/v1/changes/by_releases/?release=ETHER/Moose-2.2206',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => 'Retrieves a distribution Changes file details using author and release information.',
                operationId => 'PostChangesFileByRelease',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => 
                                {
                                    release =>
                                    {
                                        example => '{"release":"ETHER/Moose-2.2206"}',
                                        maxLength => 2048,
                                        type => 'string',
                                    },
                                },
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Changes.pm#L55>
        # NOTE: /v1/changes/{module}
        '/v1/changes/{module}' =>
        {
            get => 
            {
                description => 'Retrieves a distribution Changes file details.',
                operationId => 'GetChangesFile',
                example => '/v1/changes/Nice-Try',
                parameters => [
                {
                    in => 'path',
                    name => 'module',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/changes",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/changes/{author}/{module}
        '/v1/changes/{author}/{module}' =>
        {
            get => 
            {
                description => 'Retrieves an author distribution Changes file details.',
                operationId => 'GetChangesFileAuthor',
                example => '/v1/changes/JDEGUEST/Nice-Try-v1.3.4',
                parameters => [
                {
                    in => 'path',
                    name => 'author',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    in => 'path',
                    name => 'module',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/changes",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Contributor.pm#L19>
        # NOTE: /v1/contributor/by_pauseid/{author}
        '/v1/contributor/by_pauseid/{author}' =>
        {
            get => 
            {
                description => 'Retrieves a list of module contributed to by the specified PauseID.',
                example => '/v1/contributor/by_pauseid/ETHER',
                operationId => 'GetModuleContributedByPauseID',
                parameters => [
                {
                    in => 'path',
                    name => 'by_pauseid',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    properties =>
                                    {
                                        contributors =>
                                        {
                                            items => 
                                            {
                                                properties =>
                                                {
                                                    distribution =>
                                                    {
                                                        type => 'string',
                                                    },
                                                    pauseid =>
                                                    {
                                                        type => 'string',
                                                    },
                                                    release_author =>
                                                    {
                                                        type => 'string',
                                                    },
                                                    release_name =>
                                                    {
                                                        type => 'string',
                                                    },
                                                },
                                                type => 'object',
                                            },
                                            type => 'array',
                                        },
                                    },
                                    type => 'object',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Contributor.pm#L13>
        # NOTE: /v1/contributor/{author}/{module}
        '/v1/contributor/{author}/{release}' =>
        {
            get => 
            {
                description => 'Retrieves a list of module contributors details.',
                example => '/v1/contributor/ETHER/Moose-2.2206',
                operationId => 'GetModuleContributors',
                parameters => [
                {
                    in => 'path',
                    name => 'author',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    in => 'path',
                    name => 'release',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    properties =>
                                    {
                                        contributors =>
                                        {
                                            items => 
                                            {
                                                properties =>
                                                {
                                                    distribution =>
                                                    {
                                                        type => 'string',
                                                    },
                                                    pauseid =>
                                                    {
                                                        type => 'string',
                                                    },
                                                    release_author =>
                                                    {
                                                        type => 'string',
                                                    },
                                                    release_name =>
                                                    {
                                                        type => 'string',
                                                    },
                                                },
                                                type => 'object',
                                            },
                                            type => 'array',
                                        },
                                    },
                                    type => 'object',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Changes.pm#L23>
        # NOTE: /v1/cover/{release}
        '/v1/cover/{release}' =>
        {
            get => 
            {
                description => 'Retrieves a module cover details.',
                operationId => 'GetModuleCover',
                example => '/v1/cover/Nice-Try-v1.3.4',
                parameters => [
                {
                    in => 'path',
                    name => 'release',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/cover",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/CVE.pm#L24>
        # NOTE: /v1/cve
        '/v1/cve' =>
        {
            get => 
            {
                description => 'Retrieves CVE (Common Vulnerabilities & Exposures) information details.',
                operationId => 'GetCVE',
                parameters => [
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/CVE.pm#L24>
        # NOTE: /v1/cve/dist/{distribution}
        '/v1/cve/dist/{distribution}' =>
        {
            get => 
            {
                description => 'Retrieves Distribution CVE (Common Vulnerabilities & Exposures) information details.',
                operationId => 'GetCVEByDistribution',
                parameters => [
                {
                    in => 'path',
                    name => 'distribution',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \1,
                                properties => 
                                {
                                    version =>
                                    {
                                        maxLength => 2048,
                                        type => 'string'
                                    },
                                },
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/CVE.pm#L18>
        # NOTE: /v1/cve/release/{author}/{release}
        '/v1/cve/release/{author}/{release}' =>
        {
            get => 
            {
                description => 'Retrieves Release CVE (Common Vulnerabilities & Exposures) information details.',
                operationId => 'GetCVEByAuthorRelease',
                parameters => [
                {
                    in => 'path',
                    name => 'author',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    in => 'path',
                    name => 'release',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/CVE.pm#L18>
        # NOTE: /v1/cve/{cpanid}
        '/v1/cve/{cpanid}' =>
        {
            get => 
            {
                description => 'Retrieves CPAN ID CVE (Common Vulnerabilities & Exposures) information details.',
                operationId => 'GetCVEByCpanID',
                parameters => [
                {
                    in => 'path',
                    name => 'cpanid',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Diff.pm#L19>
        # NOTE: /v1/diff/release/{module}
        '/v1/diff/release/{module}' =>
        {
            get => 
            {
                description => 'Retrieves a diff of the latest release and its previous version.',
                operationId => 'GetReleaseDiff',
                example => '/v1/diff/release/Nice-Try',
                parameters => [
                {
                    in => 'path',
                    name => 'module',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'text/plain' =>
                            {
                                schema =>
                                {
                                    format => 'binary',
                                    type => 'string',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Diff.pm#L19>
        # NOTE: /v1/diff/release/{author1}/{release1}/{author2}/{release2}
        '/v1/diff/release/{author1}/{release1}/{author2}/{release2}' =>
        {
            get => 
            {
                description => 'Retrieves a diff of two releases.',
                operationId => 'Get2ReleasesDiff',
                example => '/v1/diff/release/JDEGUEST/Nice-Try-v1.3.3/JDEGUEST/Nice-Try-v1.3.4',
                parameters => [
                {
                    in => 'path',
                    name => 'author1',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    in => 'path',
                    name => 'release1',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    in => 'path',
                    name => 'author2',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    in => 'path',
                    name => 'release2',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'text/plain' =>
                            {
                                schema =>
                                {
                                    format => 'binary',
                                    type => 'string',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Diff.pm#L49C7-L49C73>
        # NOTE: /v1/diff/file/{file1}/{file2}
        '/v1/diff/file/{file1}/{file2}' =>
        {
            get => 
            {
                description => 'Retrieves a diff of two files.',
                operationId => 'Get2FilesDiff',
                example => '/v1/diff/file/AcREzFgg3ExIrFTURa0QJfn8nto/Ies7Ysw0GjCxUU6Wj_WzI9s8ysU',
                parameters => [
                {
                    in => 'path',
                    name => 'file1',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    in => 'path',
                    name => 'file2',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'text/plain' =>
                            {
                                schema =>
                                {
                                    format => 'binary',
                                    type => 'string',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/distribution/{distribution}
        '/v1/distribution/{distribution}' =>
        {
            get => 
            {
                description => 'The `/distribution` endpoint accepts the name of a distribution (e.g. [/distribution/Moose](https://fastapi.metacpan.org/v1/distribution/Moose)), which returns information about the distribution which is not specific to a version (like RT bug counts)',
                operationId => 'GetModuleDistribution',
                parameters => [
                {
                    in => 'path',
                    name => 'distribution',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/distribution",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Distribution.pm#L18>
        # NOTE: /v1/distribution/river
        '/v1/distribution/river' =>
        {
            get => 
            {
                description => 'Returns the river of a distribution name',
                operationId => 'GetModuleDistributionRiverWithJSON',
                example => '/v1/river',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => 
                                {
                                    distribution =>
                                    {
                                        maxLength => 2048,
                                        type => 'string'
                                    },
                                },
                                type => 'object'
                            }
                        }
                    },
                    required => \1,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/river",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Distribution.pm#L13>
        # NOTE: /v1/distribution/river/{module}
        '/v1/distribution/river/{module}' =>
        {
            get => 
            {
                description => 'Returns the river of a distribution name',
                operationId => 'GetModuleDistributionRiverWithParam',
                example => '/v1/river/Moose',
                parameters => [
                {
                    in => 'path',
                    name => 'module',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/river",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/distribution/_mapping
        '/v1/distribution/_mapping' =>
        {
            get => 
            {
                description => qq{Returns the available fields for the [distribution object](https://explorer.metacpan.org/?url=/distribution/_mapping).},
                operationId => 'GetDistributionMapping',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/distribution_mapping",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/distribution/_search
        '/v1/distribution/_search' =>
        {
            get => 
            {
                description => qq{Returns the result set for the distribution search.},
                operationId => 'GetDistributionSearch',
                parameters => [
                {
                    description => "Specifies the [search query](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#get-searches).",
                    in => 'query',
                    name => 'q',
                    required => \1,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    description => "Specifies the maximum number of [search](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#get-searches) result elements.",
                    in => 'query',
                    name => 'size',
                    required => \0,
                    schema =>
                    {
                        type => 'integer',
                    },
                },
                {
                    description => "Specifies the elements to sort the [search](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#get-searches) result.",
                    in => 'query',
                    name => 'sort',
                    required => \0,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        type => 'string',
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => qq{Returns the result set for the distribution search.},
                operationId => 'PostDistributionSearch',
                parameters => [
                {
                    in => 'query',
                    name => 'query',
                    required => \1,
                    schema =>
                    {
                        type => 'string',
                    }
                },
                {
                    in => 'query',
                    name => 'size',
                    required => \0,
                    schema =>
                    {
                        type => 'integer',
                    }
                },
                {
                    description => "Specifies the elements to sort the [search](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#get-searches) result.",
                    in => 'query',
                    name => 'sort',
                    required => \0,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                '$ref' => '#/components/schemas/search',
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/distribution/_search/scroll
        '/v1/distribution/_search/scroll' =>
        {
            'delete' =>
            {
                description => qq{Clear a [scroll](https://www.elastic.co/guide/en/elasticsearch/reference/8.9/paginate-search-results.html#clear-scroll)},
                operationId => 'DeleteDistributionSearchScroll',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                oneOf => [
                                    {
                                        properties => 
                                        {
                                            scroll_id =>
                                            {
                                                type => 'string',
                                            },
                                        },
                                    },
                                    {
                                        properties => 
                                        {
                                            scroll_id =>
                                            {
                                                items =>
                                                {
                                                    type => 'string',
                                                },
                                                type => 'array',
                                            },
                                        },
                                    },
                                ],
                            }
                        }
                    },
                    required => \1,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    type => 'object',
                                    properties =>
                                    {
                                        # TODO: Need to find out what is returned upon clearing a scroll
                                        removed =>
                                        {
                                            type => 'boolean',
                                        }
                                    }
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            get => 
            {
                description => qq{Returns the result set for the scroll search.},
                operationId => 'GetDistributionSearchScroll',
                parameters => [
                {
                    description => "Specifies the time to live of the [scroll search](https://www.elastic.co/guide/en/elasticsearch/reference/2.4/search-request-scroll.html#scroll-search-context).",
                    in => 'query',
                    name => 'scroll',
                    required => \1,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    description => "Specifies the [scroll ID](https://www.elastic.co/guide/en/elasticsearch/reference/2.4/search-request-scroll.html).",
                    in => 'query',
                    name => 'scroll_id',
                    required => \1,
                    schema =>
                    {
                        type => 'string',
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/scroll_result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => qq{Returns the result set for the author search.},
                operationId => 'PostDistributionSearchScroll',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                '$ref' => '#/components/schemas/scroll',
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/scroll_result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/download_url/{module}
        '/v1/download_url/{module}' =>
        {
            get => 
            {
                description => qq{Retrieves a download URL for a given module.\nThe `/download_url` endpoint exists specifically for the `cpanm` client.  It takes a module name with an optional version (or range of versions) and an optional `dev` flag (for development releases) and returns a `download_url` as well as some other helpful info.\n\nObviously anyone can use this endpoint, but we'll only consider changes to this endpoint after considering how `cpanm` might be affected.},
                operationId => 'GetDownloadURL',
                parameters => [
                {
                    in => 'path',
                    name => 'module',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/download_url",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/favorite
        '/v1/favorite' =>
        {
            get => 
            {
                description => 'Retrieves favorites information details.',
                operationId => 'GetFavorite',
                parameters => [
                {
                    example => '/v1/favorite?q=distribution:Moose',
                    in => 'query',
                    name => 'q',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Favorite.pm#L13>
        # NOTE: /v1/favorite/{user}/{distribution}
        '/v1/favorite/{user}/{distribution}' =>
        {
            get => 
            {
                description => 'Retrieves favorites information details.',
                operationId => 'GetFavoriteByUserModule',
                example => '/v1/favorite/q_15sjOkRminDY93g9DuZQ/DBI',
                parameters => [
                {
                    in => 'path',
                    name => 'user',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    in => 'path',
                    name => 'distribution',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/favorite",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Favorite.pm#L56C34-L56C54>
        # NOTE: /v1/favorite/agg_by_distributions
        '/v1/favorite/agg_by_distributions' =>
        {
            get => 
            {
                description => 'Retrieves favorites agregate by distributions.',
                operationId => 'GetFavoriteAggregateDistribution',
                example => '/v1/favorite/agg_by_distributions?distribution=Nice-Try',
                parameters => [
                {
                    description => "Specifies the distribution to get the favorites.",
                    example => 'Nice-Try',
                    in => 'query',
                    name => 'distribution',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                },
                {
                    description => "Specifies the user to get the favorites.",
                    example => 'AhTh1sISr3eA11yW3e1rd',
                    in => 'query',
                    name => 'user',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    properties =>
                                    {
                                        favorites =>
                                        {
                                            example => 'Nice:;Try',
                                            module =>
                                            {
                                                type => 'integer',
                                            },
                                            type => 'object',
                                        },
                                        myfavorites =>
                                        {
                                            module =>
                                            {
                                                type => 'integer',
                                            },
                                            type => 'object',
                                        },
                                        took =>
                                        {
                                            type => 'integer',
                                        },
                                    },
                                    type => 'object',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    properties =>
                                    {
                                        users =>
                                        {
                                            items =>
                                            {
                                                type => 'string',
                                            },
                                            type => 'array',
                                        },
                                    },
                                    type => 'object',
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => 'Retrieves favorites agregate by distributions using JSON parameters.',
                operationId => 'PostFavoriteAggregateDistribution',
                example => '/v1/favorite/agg_by_distributions',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => 
                                {
                                    distribution =>
                                    {
                                        description => "Specifies the distribution to get the favorites.",
                                        example => 'Nice-Try',
                                        type => 'string',
                                    },
                                    user =>
                                    {
                                        description => "Specifies the user to get the favorites.",
                                        example => 'AhTh1sISr3eA11yW3e1rd',
                                        type => 'string',
                                    },
                                },
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    properties =>
                                    {
                                        favorites =>
                                        {
                                            example => 'Nice:;Try',
                                            module =>
                                            {
                                                type => 'integer',
                                            },
                                            type => 'object',
                                        },
                                        myfavorites =>
                                        {
                                            module =>
                                            {
                                                type => 'integer',
                                            },
                                            type => 'object',
                                        },
                                        took =>
                                        {
                                            type => 'integer',
                                        },
                                    },
                                    type => 'object',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    properties =>
                                    {
                                        users =>
                                        {
                                            items =>
                                            {
                                                type => 'string',
                                            },
                                            type => 'array',
                                        },
                                    },
                                    type => 'object',
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Favorite.pm#L29>
        # NOTE: /v1/favorite/by_user/{user}
        '/v1/favorite/by_user/{user}' =>
        {
            get => 
            {
                description => 'Retrieves user favorites information details.',
                operationId => 'GetFavoriteByUser',
                example => '/v1/favorite/by_user/q_15sjOkRminDY93g9DuZQ',
                # XXX There is presumably an optional 'size' parmeter, but it is not working. When specifying 5, it returns 3. When specifying 10, it returns 7. POSTing it as JSON does not work.
                parameters => [
                {
                    in => 'path',
                    name => 'user',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/favorites",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Favorite.pm#L51C25-L51C36leaderboard>
        # NOTE: /v1/favorite/leaderboard
        '/v1/favorite/leaderboard' =>
        {
            get => 
            {
                description => 'Retrieves top favorite distributions (leaderboard).',
                operationId => 'GetFavoriteLeaderboard',
                example => '/v1/favorite/leaderboard',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    properties =>
                                    {
                                        leaderboard =>
                                        {
                                            items =>
                                            {
                                                properties =>
                                                {
                                                    doc_count =>
                                                    {
                                                        type => 'integer',
                                                    },
                                                    key =>
                                                    {
                                                        type => 'string',
                                                    },
                                                },
                                                type => 'object',
                                            },
                                            type => 'array',
                                        },
                                    },
                                    type => 'object',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    properties =>
                                    {
                                        users =>
                                        {
                                            items =>
                                            {
                                                type => 'string',
                                            },
                                            type => 'array',
                                        },
                                    },
                                    type => 'object',
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/favorite/recent
        '/v1/favorite/recent' =>
        {
            get => 
            {
                description => 'Retrieves list of recent favorite distribution.',
                operationId => 'GetFavoriteRecent',
                example => '/v1/favorite/recent',
                parameters => [
                {
                    description => "Specifies which result page should be returned.",
                    in => 'query',
                    name => 'page',
                    required => \0,
                    schema =>
                    {
                        type => 'integer'
                    },
                },
                {
                    description => "Specifies the size of the result page.",
                    in => 'query',
                    name => 'size',
                    required => \0,
                    schema =>
                    {
                        type => 'integer'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/favorites",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    properties =>
                                    {
                                        users =>
                                        {
                                            items =>
                                            {
                                                type => 'string',
                                            },
                                            type => 'array',
                                        },
                                    },
                                    type => 'object',
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Favorite.pm#L35C35-L35C56>
        # NOTE: /v1/favorite/users_by_distribution/{distribution}
        '/v1/favorite/users_by_distribution/{distribution}' =>
        {
            get => 
            {
                description => 'Retrieves list of users who favorited a distribution.',
                operationId => 'GetFavoriteUsers',
                example => '/v1/favorite/users_by_distribution/Nice-Try',
                parameters => [
                {
                    in => 'path',
                    name => 'distribution',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/favorites",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    properties =>
                                    {
                                        users =>
                                        {
                                            items =>
                                            {
                                                type => 'string',
                                            },
                                            type => 'array',
                                        },
                                    },
                                    type => 'object',
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/favorite/_mapping
        '/v1/favorite/_mapping' =>
        {
            get => 
            {
                description => qq{Returns the available fields for the [favorite object](https://explorer.metacpan.org/?url=/favorite/_mapping).},
                operationId => 'GetFavoriteMapping',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/favorite_mapping",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/favorite/_search
        '/v1/favorite/_search' =>
        {
            get => 
            {
                description => qq{Returns the result set for the favorite search.},
                operationId => 'GetFavoriteSearch',
                parameters => [
                {
                    description => "Specifies the [search query](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#get-searches).",
                    in => 'query',
                    name => 'q',
                    required => \1,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    description => "Specifies the maximum number of [search](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#get-searches) result elements.",
                    in => 'query',
                    name => 'size',
                    required => \0,
                    schema =>
                    {
                        type => 'integer',
                    },
                },
                {
                    description => "Specifies the elements to sort the [search](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#get-searches) result.",
                    in => 'query',
                    name => 'sort',
                    required => \0,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        type => 'string',
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => qq{Returns the result set for the favorite search.},
                operationId => 'PostFavoriteSearch',
                parameters => [
                {
                    in => 'query',
                    name => 'query',
                    required => \1,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    in => 'query',
                    name => 'size',
                    required => \0,
                    schema =>
                    {
                        type => 'integer',
                    },
                },
                {
                    description => "Specifies the elements to sort the [search](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#get-searches) result.",
                    in => 'query',
                    name => 'sort',
                    required => \0,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                '$ref' => '#/components/schemas/search',
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/favorite/_search/scroll
        '/v1/favorite/_search/scroll' =>
        {
            'delete' =>
            {
                description => qq{Clear a [scroll](https://www.elastic.co/guide/en/elasticsearch/reference/8.9/paginate-search-results.html#clear-scroll)},
                operationId => 'DeleteFavoriteSearchScroll',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                oneOf => [
                                    {
                                        properties => 
                                        {
                                            scroll_id =>
                                            {
                                                type => 'string',
                                            },
                                        },
                                    },
                                    {
                                        properties => 
                                        {
                                            scroll_id =>
                                            {
                                                items =>
                                                {
                                                    type => 'string',
                                                },
                                                type => 'array',
                                            },
                                        },
                                    },
                                ],
                            }
                        }
                    },
                    required => \1,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    type => 'object',
                                    properties =>
                                    {
                                        # TODO: Need to find out what is returned upon clearing a scroll
                                        removed =>
                                        {
                                            type => 'boolean',
                                        }
                                    }
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            get => 
            {
                description => qq{Returns the result set for the favorite search.},
                operationId => 'GetFavoriteSearchScroll',
                parameters => [
                {
                    description => "Specifies the time to live of the [scroll search](https://www.elastic.co/guide/en/elasticsearch/reference/2.4/search-request-scroll.html#scroll-search-context).",
                    in => 'query',
                    name => 'scroll',
                    required => \1,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    description => "Specifies the [scroll ID](https://www.elastic.co/guide/en/elasticsearch/reference/2.4/search-request-scroll.html).",
                    in => 'query',
                    name => 'scroll_id',
                    required => \1,
                    schema =>
                    {
                        type => 'string',
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/scroll_result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => qq{Returns the result set for the favorite search.},
                operationId => 'PostFavoriteSearchScroll',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                '$ref' => '#/components/schemas/scroll',
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/scroll_result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/file
        '/v1/file' =>
        {
            get => 
            {
                description => 'Retrieves a file information details.',
                operationId => 'GetFile',
                parameters => [
                {
                    in => 'query',
                    name => 'q',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/File.pm#L31>
        # NOTE: /v1/file/{author}/{release}/{path}
        '/v1/file/{author}/{release}/{path}' =>
        {
            get => 
            {
                description => 'Retrieves a file information details.',
                operationId => 'GetFileByAuthorReleaseFilePath',
                example => '/v1/file/JDEGUEST/Nice-Try-v1.3.4/lib/Nice/Try.pm',
                parameters => [
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/file",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/File.pm#L50>
        # NOTE: /v1/file/dir/{path}
        '/v1/file/dir/{path}' =>
        {
            get => 
            {
                description => 'Retrieves a file path directory content.',
                operationId => 'GetFilePathDirectoryContent',
                example => '/v1/file/dir/JDEGUEST/Module-Generic-v0.31.0/lib/Module/Generic',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    properties =>
                                    {
                                        dir =>
                                        {
                                            items =>
                                            {
                                                '$ref' => "#/components/schemas/file_preview",
                                            },
                                            type => 'array',
                                        },
                                    },
                                    type => 'object',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/file/_mapping
        '/v1/file/_mapping' =>
        {
            get => 
            {
                description => qq{Returns the available fields for the [file object](https://explorer.metacpan.org/?url=/file/_mapping).},
                operationId => 'GetFileMapping',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/file_mapping",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/file/_search
        '/v1/file/_search' =>
        {
            get => 
            {
                description => qq{Returns the result set for the file search.},
                operationId => 'GetFileSearch',
                parameters => [
                {
                    description => "Specifies the [search query](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#get-searches).",
                    in => 'query',
                    name => 'q',
                    required => \1,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    description => "Specifies the maximum number of [search](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#get-searches) result elements.",
                    in => 'query',
                    name => 'size',
                    required => \0,
                    schema =>
                    {
                        type => 'integer',
                    },
                },
                {
                    description => "Specifies the elements to sort the [search](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#get-searches) result.",
                    in => 'query',
                    name => 'sort',
                    required => \0,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        type => 'string',
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => qq{Returns the result set for the file search.},
                operationId => 'PostFileSearch',
                parameters => [
                {
                    in => 'query',
                    name => 'query',
                    required => \1,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    in => 'query',
                    name => 'size',
                    required => \0,
                    schema =>
                    {
                        type => 'integer',
                    },
                },
                {
                    description => "Specifies the elements to sort the [search](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#get-searches) result.",
                    in => 'query',
                    name => 'sort',
                    required => \0,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                '$ref' => '#/components/schemas/search',
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/file/_search/scroll
        '/v1/file/_search/scroll' =>
        {
            'delete' =>
            {
                description => qq{Clear a [scroll](https://www.elastic.co/guide/en/elasticsearch/reference/8.9/paginate-search-results.html#clear-scroll)},
                operationId => 'DeleteFileSearchScroll',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                oneOf => [
                                    {
                                        properties => 
                                        {
                                            scroll_id =>
                                            {
                                                type => 'string',
                                            },
                                        },
                                    },
                                    {
                                        properties => 
                                        {
                                            scroll_id =>
                                            {
                                                items =>
                                                {
                                                    type => 'string',
                                                },
                                                type => 'array',
                                            },
                                        },
                                    },
                                ],
                            }
                        }
                    },
                    required => \1,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    type => 'object',
                                    properties =>
                                    {
                                        # TODO: Need to find out what is returned upon clearing a scroll
                                        removed =>
                                        {
                                            type => 'boolean',
                                        }
                                    }
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            get => 
            {
                description => qq{Returns the result set for the file search.},
                operationId => 'GetFileSearchScroll',
                parameters => [
                {
                    description => "Specifies the time to live of the [scroll search](https://www.elastic.co/guide/en/elasticsearch/reference/2.4/search-request-scroll.html#scroll-search-context).",
                    in => 'query',
                    name => 'scroll',
                    required => \1,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    description => "Specifies the [scroll ID](https://www.elastic.co/guide/en/elasticsearch/reference/2.4/search-request-scroll.html).",
                    in => 'query',
                    name => 'scroll_id',
                    required => \1,
                    schema =>
                    {
                        type => 'string',
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/scroll_result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => qq{Returns the result set for the file search.},
                operationId => 'PostFileSearchScroll',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                '$ref' => '#/components/schemas/scroll',
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/scroll_result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/login/index
        '/v1/login/index' =>
        {
            get => 
            {
                description => 'Returns a login HTML page.',
                operationId => 'GetLoginPage',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'text/html' =>
                            {
                                schema =>
                                {
                                    format => 'binary',
                                    type => 'string',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/mirror
        '/v1/mirror' =>
        {
            get => 
            {
                description => qq{Returns a `mirrors` object containing a list of `mirror` objects. Currently, the API only returns one mirror, because CPAN now uses CDN instead of mirrors.},
                operationId => 'GetMirror',
                parameters => [
                {
                    description => "Specifies an optional keyword to find the matching mirrors.",
                    in => 'query',
                    name => 'q',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/mirrors",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => qq{Returns a `mirrors` object containing a list of `mirror` objects. Currently, the API only returns one mirror, because CPAN now uses CDN instead of mirrors.},
                operationId => 'PostMirror',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => 
                                {
                                    "q" =>
                                    {
                                        description => "Specifies an optional keyword to find the matching mirrors.",
                                        maxLength => 2048,
                                        type => 'string'
                                    },
                                },
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/mirrors",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Mirror.pm#L12>
        # NOTE: /v1/mirror/search
        '/v1/mirror/search' =>
        {
            get => 
            {
                description => qq{Returns a `mirrors` object containing a list of `mirror` objects. Currently, the API only returns one mirror, because CPAN now uses CDN instead of mirrors.},
                operationId => 'GetMirrorSearch',
                parameters => [
                {
                    description => "Specifies an optional keyword to find the matching mirrors.",
                    in => 'query',
                    name => 'q',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/mirrors",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => qq{Returns a `mirrors` object containing a list of `mirror` objects. Currently, the API only returns one mirror, because CPAN now uses CDN instead of mirrors.},
                operationId => 'PostMirrorSearch',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => 
                                {
                                    "q" =>
                                    {
                                        description => "Specifies an optional keyword to find the matching mirrors.",
                                        maxLength => 2048,
                                        type => 'string'
                                    },
                                },
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/mirrors",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/module
        '/v1/module' =>
        {
            get => 
            {
                description => 'Retrieves module information details.',
                operationId => 'GetModule',
                parameters => [
                {
                    in => 'query',
                    name => 'q',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/module/{module}
        '/v1/module/{module}' =>
        {
            get => 
            {
                description => qq{Returns the corresponding `file` of the latest version of the `module`. Considering that Moose-2.0001 is the latest release, the result of [/module/Moose](https://fastapi.metacpan.org/v1/module/Moose) is the same as [/file/DOY/Moose-2.0001/lib/Moose.pm](https://fastapi.metacpan.org/v1/file/DOY/Moose-2.0001/lib/Moose.pm).},
                operationId => 'GetModuleFile',
                example => '/v1/module/Module::Generic',
                parameters => [
                {
                    in => 'path',
                    name => 'module',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which object to [join](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#joins) in the result.",
                    in => 'query',
                    name => 'join',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/file",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/module/_mapping
        '/v1/module/_mapping' =>
        {
            get => 
            {
                description => qq{Returns the available fields for the [module object](https://explorer.metacpan.org/?url=/module/_mapping).},
                operationId => 'GetModuleMapping',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/module_mapping",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/module/_search
        '/v1/module/_search' =>
        {
            get => 
            {
                description => qq{Returns the result set for the module search.},
                operationId => 'GetModuleSearch',
                parameters => [
                {
                    description => "Specifies the [search query](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#get-searches).",
                    in => 'query',
                    name => 'q',
                    required => \1,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    description => "Specifies the maximum number of [search](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#get-searches) result elements.",
                    in => 'query',
                    name => 'size',
                    required => \0,
                    schema =>
                    {
                        type => 'integer',
                    },
                },
                {
                    description => "Specifies the elements to sort the [search](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#get-searches) result.",
                    in => 'query',
                    name => 'sort',
                    required => \0,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        type => 'string',
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => qq{Returns the result set for the module search.},
                operationId => 'PostModuleSearch',
                parameters => [
                {
                    in => 'query',
                    name => 'query',
                    required => \1,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    in => 'query',
                    name => 'size',
                    required => \0,
                    schema =>
                    {
                        type => 'integer',
                    },
                },
                {
                    description => "Specifies the elements to sort the [search](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#get-searches) result.",
                    in => 'query',
                    name => 'sort',
                    required => \0,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                '$ref' => '#/components/schemas/search',
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/module/_search/scroll
        '/v1/module/_search/scroll' =>
        {
            'delete' =>
            {
                description => qq{Clear a [scroll](https://www.elastic.co/guide/en/elasticsearch/reference/8.9/paginate-search-results.html#clear-scroll)},
                operationId => 'DeleteModuleSearchScroll',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                oneOf => [
                                    {
                                        properties => 
                                        {
                                            scroll_id =>
                                            {
                                                type => 'string',
                                            },
                                        },
                                    },
                                    {
                                        properties => 
                                        {
                                            scroll_id =>
                                            {
                                                items =>
                                                {
                                                    type => 'string',
                                                },
                                                type => 'array',
                                            },
                                        },
                                    },
                                ],
                            }
                        }
                    },
                    required => \1,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    type => 'object',
                                    properties =>
                                    {
                                        # TODO: Need to find out what is returned upon clearing a scroll
                                        removed =>
                                        {
                                            type => 'boolean',
                                        }
                                    }
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            get => 
            {
                description => qq{Returns the result set for the module search.},
                operationId => 'GetModuleSearchScroll',
                parameters => [
                {
                    description => "Specifies the time to live of the [scroll search](https://www.elastic.co/guide/en/elasticsearch/reference/2.4/search-request-scroll.html#scroll-search-context).",
                    in => 'query',
                    name => 'scroll',
                    required => \1,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    description => "Specifies the [scroll ID](https://www.elastic.co/guide/en/elasticsearch/reference/2.4/search-request-scroll.html).",
                    in => 'query',
                    name => 'scroll_id',
                    required => \1,
                    schema =>
                    {
                        type => 'string',
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/scroll_result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => qq{Returns the result set for the module search.},
                operationId => 'PostModuleSearchScroll',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                '$ref' => '#/components/schemas/scroll',
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/scroll_result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/package
        '/v1/package' =>
        {
            get => 
            {
                description => 'Retrieves package information details.',
                operationId => 'GetPackage',
                parameters => [
                {
                    in => 'query',
                    name => 'q',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Package.pm#L10C31-L10C56>
        # NOTE: /v1/package/modules/{distribution}
        '/v1/package/modules/{distribution}' =>
        {
            get => 
            {
                description => 'Retrieves the list of a distribution packages.',
                operationId => 'GetPackageDistributionList',
                example => '/v1/package/modules/Moose',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    property =>
                                    {
                                        modules =>
                                        {
                                            items =>
                                            {
                                                example => 'Moose::Cookbook',
                                                maxLength => 2048,
                                                type => 'string',
                                            },
                                            type => 'array',
                                        },
                                    },
                                    type => 'object',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/package/{module}
        '/v1/package/{module}' =>
        {
            get => 
            {
                description => qq{Returns the corresponding `package` for the specified `module`. For example, [/package/Moose](https://fastapi.metacpan.org/v1/package/Moose).},
                operationId => 'GetModulePackage',
                parameters => [
                {
                    in => 'path',
                    name => 'module',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/package",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/permission
        '/v1/permission' =>
        {
            get => 
            {
                description => 'Retrieves permission information details.',
                operationId => 'GetPermission',
                parameters => [
                {
                    in => 'query',
                    name => 'q',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/permission/by_author/{author}
        '/v1/permission/by_author/{author}' =>
        {
            get => 
            {
                description => 'Retrieves permission information details by author.',
                operationId => 'GetPermissionByAuthor',
                parameters => [
                {
                    description => "This is the user's pause ID",
                    example => 'TIMB',
                    in => 'path',
                    name => 'author',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/permissions",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Permission.pm#L20>
        # NOTE: /v1/permission/by_module
        '/v1/permission/by_module' =>
        {
            get => 
            {
                description => 'Retrieves permission information details by module.',
                operationId => 'GetPermissionByModuleQueryString',
                example => '/v1/permission/by_module?module=DBD::DBM::Statement',
                parameters => [
                {
                    description => "This is the module package name",
                    example => 'DBD::DBM::Statement',
                    in => 'query',
                    name => 'module',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/permissions",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => 'Retrieves permission information details by module.',
                operationId => 'PostPermissionByModuleJSON',
                example => '/v1/permission/by_module',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => 
                                {
                                    module => 
                                    {
                                        description => "This is the module package name",
                                        example => 'DBD::DBM::Statement',
                                        maxLength => 2048,
                                        type => 'string',
                                    },
                                },
                                type => 'object'
                            }
                        }
                    },
                    required => \1,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/permissions",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Permission.pm#L15>
        # NOTE: /v1/permission/by_module/{module}
        '/v1/permission/by_module/{module}' =>
        {
            get => 
            {
                description => 'Retrieves permission information details by module.',
                operationId => 'GetPermissionByModule',
                example => '/v1/permission/by_module/DBD::DBM::Statement',
                parameters => [
                {
                    description => "This is the module package name",
                    example => 'DBD::DBM::Statement',
                    in => 'path',
                    name => 'module',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/permissions",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/permission/{module}
        '/v1/permission/{module}' =>
        {
            get => 
            {
                description => qq{Returns the corresponding `permission` for the specified `module`. For example, [/permission/Moose](https://fastapi.metacpan.org/v1/permission/Moose).},
                operationId => 'GetModulePermission',
                parameters => [
                {
                    in => 'path',
                    name => 'module',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/permission",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/pod_render
        '/v1/pod_render' =>
        {
            get => 
            {
                description => qq{Takes some POD data and check for errors. It returns the POD provided in formatted plan text.},
                operationId => 'GetRenderPOD',
                parameters => [
                {
                    description => 'The POD data to format',
                    example => qq{=encoding utf-8\n\n=head1 Hello World\n\nSomething here\n\n=oops\n\n=cut\n},
                    in => 'query',
                    name => 'pod',
                    required => \1,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    in => 'query',
                    name => 'show_errors',
                    required => \0,
                    schema =>
                    {
                        type => 'boolean',
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'text/plain' =>
                            {
                                schema =>
                                {
                                    format => 'binary',
                                    type => 'string',
                                    example => qq{Hello World\n    Something here\n\nPOD ERRORS\n    Hey! The above document had some coding errors, which are explained below:\n\n    Around line 7:\n        Unknown directive: =oops\n},
                                }
                            },
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => qq{Takes some POD data and check for errors. It returns the POD provided in formatted plan text.},
                operationId => 'PostRenderPOD',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => 
                                {
                                    pod =>
                                    {
                                        type => 'string',
                                        description => 'The POD data to format',
                                        example => q{=encoding utf-8\n\n=head1 Hello World\n\nSomething here\n\n=oops\n\n=cut\n},
                                    },
                                    show_errors =>
                                    {
                                        type => 'boolean',
                                    },
                                },
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'text/plain' =>
                            {
                                schema =>
                                {
                                    format => 'binary',
                                    type => 'string',
                                }
                            },
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/pod/{module}
        '/v1/pod/{module}' =>
        {
            get => 
            {
                description => qq{Returns the POD of the given module. You can change the output format by either passing a `content-type` query parameter (e.g. [/pod/Moose?content-type=text/plain](https://fastapi.metacpan.org/v1/pod/Moose?content-type=text/plain) or by adding an `Accept` header to the HTTP request. Valid content types are:\n\n* text/html (default)\n* text/plain\n* text/x-pod\n* text/x-markdown},
                operationId => 'GetModulePOD',
                parameters => [
                {
                    in => 'path',
                    name => 'module',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    in => 'query',
                    name => 'show_errors',
                    required => \0,
                    schema =>
                    {
                        type => 'boolean',
                    },
                },
                {
                    in => 'query',
                    name => 'url_prefix',
                    required => \0,
                    # XXX /pod/author/release/path?url_prefix -> Not sure what the valid values are
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                },
                {
                    description => qq{You can change the output format by either passing a `content-type` query parameter (e.g. [/pod/Moose?content-type=text/plain](https://fastapi.metacpan.org/v1/pod/Moose?content-type=text/plain) or by adding an `Accept` header to the HTTP request. Valid content types are:\n\n* text/html (default)\n* text/plain\n* text/x-pod\n* text/x-markdown},
                    in => 'query',
                    name => 'content-type',
                    required => \0,
                    schema =>
                    {
                        properties =>
                        {
                            'content-type' =>
                            {
                                enum => [qw( text/html text/plain text/x-pod text/x-markdown )],
                                type => 'string',
                                maxLength => 2048,
                            },
                        },
                        required => [],
                        title => 'query_param',
                        type => 'object',
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'text/html' =>
                            {
                                schema =>
                                {
                                    format => 'binary',
                                    type => 'string',
                                }
                            },
                            'text/plain' =>
                            {
                                schema =>
                                {
                                    format => 'binary',
                                    type => 'string',
                                }
                            },
                            'text/x-pod' =>
                            {
                                schema =>
                                {
                                    format => 'binary',
                                    type => 'string',
                                }
                            },
                            'text/x-markdown' =>
                            {
                                schema =>
                                {
                                    format => 'binary',
                                    type => 'string',
                                }
                            },
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Pod.pm#L12>
        # NOTE: /v1/pod/{author}/{release}/{path}
        '/v1/pod/{author}/{release}/{path}' =>
        {
            get => 
            {
                description => qq{Returns the POD of the given module. You can change the output format by either passing a `content-type` query parameter (e.g. [/pod/Moose?content-type=text/plain](https://fastapi.metacpan.org/v1/pod/Moose?content-type=text/plain) or by adding an `Accept` header to the HTTP request. Valid content types are:\n\n* text/html (default)\n* text/plain\n* text/x-pod\n* text/x-markdown},
                operationId => 'GetModuleReleasePod',
                parameters => [
                {
                    in => 'path',
                    name => 'author',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    in => 'path',
                    name => 'release',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    in => 'path',
                    name => 'path',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    in => 'query',
                    name => 'show_errors',
                    required => \0,
                    schema =>
                    {
                        type => 'boolean',
                    },
                },
                {
                    in => 'query',
                    name => 'url_prefix',
                    required => \0,
                    # XXX /pod/author/release/path?url_prefix -> Not sure what the valid values are
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                },
                {
                    description => qq{You can change the output format by either passing a `content-type` query parameter (e.g. [/pod/Moose?content-type=text/plain](https://fastapi.metacpan.org/v1/pod/Moose?content-type=text/plain) or by adding an `Accept` header to the HTTP request. Valid content types are:\n\n* text/html (default)\n* text/plain\n* text/x-pod\n* text/x-markdown},
                    in => 'query',
                    name => 'content-type',
                    required => \0,
                    schema =>
                    {
                        properties =>
                        {
                            'content-type' =>
                            {
                                enum => [qw( text/html text/plain text/x-pod text/x-markdown )],
                                type => 'string',
                                maxLength => 2048,
                            },
                        },
                        required => [],
                        title => 'query_param',
                        type => 'object',
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'text/html' =>
                            {
                                schema =>
                                {
                                    format => 'binary',
                                    type => 'string',
                                }
                            },
                            'text/plain' =>
                            {
                                schema =>
                                {
                                    format => 'binary',
                                    type => 'string',
                                }
                            },
                            'text/x-pod' =>
                            {
                                schema =>
                                {
                                    format => 'binary',
                                    type => 'string',
                                }
                            },
                            'text/x-markdown' =>
                            {
                                schema =>
                                {
                                    format => 'binary',
                                    type => 'string',
                                }
                            },
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/rating
        '/v1/rating' =>
        {
            get => 
            {
                description => 'Retrieves rating information details.',
                operationId => 'GetRating',
                parameters => [
                {
                    in => 'query',
                    name => 'q',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Rating.pm#L12>
        # NOTE: /v1/rating/by_distributions
        '/v1/rating/by_distributions' =>
        {
            get => 
            {
                description => 'Retrieves rating information details by distribution.',
                operationId => 'GetRatingByDistribution',
                example => '/v1/rating/by_distributions?distribution=Moose',
                parameters => [
                {
                    in => 'query',
                    name => 'distribution',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/distributions",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => 'Retrieves rating information details by distribution.',
                operationId => 'PostRatingByDistribution',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => 
                                {
                                    distribution =>
                                    {
                                        maxLength => 2048,
                                        type => 'string',
                                        example => 'Moose',
                                    },
                                },
                                type => 'object'
                            }
                        }
                    },
                    required => \1,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/distributions",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/rating/_mapping
        '/v1/rating/_mapping' =>
        {
            get => 
            {
                description => qq{Returns the available fields for the [rating object](https://explorer.metacpan.org/?url=/rating/_mapping).},
                operationId => 'GetRatingMapping',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/rating_mapping",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/rating/_search
        '/v1/rating/_search' =>
        {
            get => 
            {
                description => qq{Returns the result set for the rating search.},
                operationId => 'GetRatingSearch',
                parameters => [
                {
                    description => "Specifies the [search query](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#get-searches).",
                    in => 'query',
                    name => 'q',
                    required => \1,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    description => "Specifies the maximum number of [search](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#get-searches) result elements.",
                    in => 'query',
                    name => 'size',
                    required => \0,
                    schema =>
                    {
                        type => 'integer',
                    },
                },
                {
                    description => "Specifies the elements to sort the [search](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#get-searches) result.",
                    in => 'query',
                    name => 'sort',
                    required => \0,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        type => 'string',
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => qq{Returns the result set for the rating search.},
                operationId => 'PostRatingSearch',
                parameters => [
                {
                    in => 'query',
                    name => 'query',
                    required => \1,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    in => 'query',
                    name => 'size',
                    required => \0,
                    schema =>
                    {
                        type => 'integer',
                    },
                },
                {
                    description => "Specifies the elements to sort the [search](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#get-searches) result.",
                    in => 'query',
                    name => 'sort',
                    required => \0,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                '$ref' => '#/components/schemas/search',
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/rating/_search/scroll
        '/v1/rating/_search/scroll' =>
        {
            'delete' =>
            {
                description => qq{Clear a [scroll](https://www.elastic.co/guide/en/elasticsearch/reference/8.9/paginate-search-results.html#clear-scroll)},
                operationId => 'DeleteRatingSearchScroll',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                oneOf => [
                                    {
                                        properties => 
                                        {
                                            scroll_id =>
                                            {
                                                type => 'string',
                                            },
                                        },
                                    },
                                    {
                                        properties => 
                                        {
                                            scroll_id =>
                                            {
                                                items =>
                                                {
                                                    type => 'string',
                                                },
                                                type => 'array',
                                            },
                                        },
                                    },
                                ],
                            }
                        }
                    },
                    required => \1,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    type => 'object',
                                    properties =>
                                    {
                                        # TODO: Need to find out what is returned upon clearing a scroll
                                        removed =>
                                        {
                                            type => 'boolean',
                                        }
                                    }
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            get => 
            {
                description => qq{Returns the result set for the rating search.},
                operationId => 'GetRatingSearchScroll',
                parameters => [
                {
                    description => "Specifies the time to live of the [scroll search](https://www.elastic.co/guide/en/elasticsearch/reference/2.4/search-request-scroll.html#scroll-search-context).",
                    in => 'query',
                    name => 'scroll',
                    required => \1,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    description => "Specifies the [scroll ID](https://www.elastic.co/guide/en/elasticsearch/reference/2.4/search-request-scroll.html).",
                    in => 'query',
                    name => 'scroll_id',
                    required => \1,
                    schema =>
                    {
                        type => 'string',
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/scroll_result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => qq{Returns the result set for the rating search.},
                operationId => 'PostRatingSearchScroll',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                '$ref' => '#/components/schemas/scroll',
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/scroll_result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/release
        '/v1/release' =>
        {
            get => 
            {
                description => 'Retrieves release information details.',
                operationId => 'GetRelease',
                parameters => [
                {
                    in => 'query',
                    name => 'q',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Release.pm#L22>
        # NOTE: /v1/release/{distribution}
        '/v1/release/{distribution}' =>
        {
            get => 
            {
                description => qq{Retrieves an author information details.\nThe `/release` endpoint accepts either the name of a `distribution` (e.g. [/release/Moose](https://fastapi.metacpan.org/v1/release/Moose)), which returns the most recent release of the distribution.},
                operationId => 'GetReleaseDistribution',
                example => '/v1/release/Moose',
                parameters => [
                {
                    in => 'path',
                    name => 'distribution',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which object to [join](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#joins) in the result.",
                    in => 'query',
                    name => 'join',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/release",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Release.pm#L29>
        # NOTE: /v1/release/{author}/{release}
        '/v1/release/{author}/{release}' =>
        {
            get => 
            {
                description => qq{Retrieves an distribution release information details.\nThis `/release` endpoint accepts  the name of an `author` and the name of the `release` (e.g. [/release/DOY/Moose-2.0001](https://fastapi.metacpan.org/v1/release/DOY/Moose-2.0001)), which returns the most recent release of the distribution.},
                operationId => 'GetAuthorReleaseDistribution',
                example => '/v1/release/JDEGUEST/Module-Generic-v0.30.5',
                parameters => [
                {
                    in => 'path',
                    name => 'author',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    in => 'path',
                    name => 'release',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which object to [join](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#joins) in the result.",
                    in => 'query',
                    name => 'join',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    properties =>
                                    {
                                        release =>
                                        {
                                            schema =>
                                            {
                                                '$ref' => "#/components/schemas/release",
                                            },
                                        },
                                        took =>
                                        {
                                            type => 'integer',
                                        },
                                        total =>
                                        {
                                            type => 'integer',
                                        },
                                    },
                                    type => 'object',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Release.pm#L80>
        # NOTE: /v1/release/all_by_author/{author}
        '/v1/release/all_by_author/{author}' =>
        {
            get => 
            {
                description => qq{Get all releases by the specified author},
                operationId => 'GetAllReleasesByAuthor',
                example => '/v1/release/all_by_author/JDEGUEST',
                parameters => [
                {
                    in => 'path',
                    name => 'author',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies the page offset starting from 1.",
                    in => 'query',
                    name => 'page',
                    required => \0,
                    schema =>
                    {
                        type => 'integer'
                    },
                },
                {
                    description => "Specifies the page size, i.e. the number of elements returned in one page.",
                    in => 'query',
                    name => 'page_size',
                    required => \0,
                    schema =>
                    {
                        type => 'integer'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => '#/components/schemas/releases',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => qq{Get all releases by the specified author},
                operationId => 'PostAllReleasesByAuthor',
                example => '/v1/release/all_by_author/JDEGUEST',
                parameters => [
                {
                    in => 'path',
                    name => 'author',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => 
                                {
                                    page =>
                                    {
                                        description => "Specifies the page offset starting from 1.",
                                        type => 'integer'
                                    },
                                    page_size =>
                                    {
                                        description => "Specifies the page size, i.e. the number of elements returned in one page.",
                                        type => 'integer'
                                    }
                                },
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => '#/components/schemas/releases',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/release/by_author
        '/v1/release/by_author' =>
        {
            get => 
            {
                description => qq{Get releases by author},
                operationId => 'GetReleaseByAuthor',
                parameters => [{
                    description => "Specifies the page size, i.e. the number of elements returned in one page.",
                    in => 'query',
                    name => 'size',
                    required => \0,
                    schema =>
                    {
                        type => 'integer'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => '#/components/schemas/releases',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => qq{Get recent releases},
                operationId => 'PostReleaseByAuthor',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => 
                                {
                                    size =>
                                    {
                                        description => "Specifies the page size, i.e. the number of elements returned in one page.",
                                        type => 'integer'
                                    }
                                },
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => '#/components/schemas/releases',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Release.pm#L37>
        # NOTE: /v1/release/contributors/{author}/{release}
        '/v1/release/contributors/{author}/{release}' =>
        {
            get => 
            {
                description => qq{Retrieves the list of contributors for the specified distributions},
                operationId => 'GetReleaseDistributionContributors',
                example => '/v1/release/contributors/JDEGUEST/Module-Generic-v0.30.5',
                parameters => [
                {
                    in => 'path',
                    name => 'author',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    in => 'path',
                    name => 'release',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which object to [join](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#joins) in the result.",
                    in => 'query',
                    name => 'join',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    properties =>
                                    {
                                        contributors =>
                                        {
                                            items =>
                                            {
                                                properties =>
                                                {
                                                    email =>
                                                    {
                                                        items =>
                                                        {
                                                            maxLength => 2048,
                                                            type => 'string',
                                                        },
                                                        type => 'array',
                                                    },
                                                    name =>
                                                    {
                                                        description => "Contributor's name",
                                                        maxLength => 2048,
                                                        type => 'string',
                                                    },
                                                },
                                                type => 'object',
                                            },
                                            type => 'array',
                                        },
                                    },
                                    type => 'object',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/release/files_by_category/{author}/{release}
        '/v1/release/files_by_category/{author}/{release}' =>
        {
            get => 
            {
                description => qq{Retrieves the list of release key files by category},
                operationId => 'GetReleaseKeyFilesByCategory',
                example => '/v1/release/files_by_category/JDEGUEST/Module-Generic-v0.30.5',
                parameters => [
                {
                    in => 'path',
                    name => 'author',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    in => 'path',
                    name => 'release',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    in => 'query',
                    name => 'category',
                    description => 'An optional category can be specified to refine the result. Valid vlues include `changelog`, `contributing`, `dist`, `license`, `other`',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => '#/components/schemas/files_categories',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => qq{Retrieves the list of release key files by category},
                operationId => 'PostReleaseKeyFilesByCategory',
                example => '/v1/release/files_by_category/JDEGUEST/Module-Generic-v0.30.5',
                parameters => [
                {
                    in => 'path',
                    name => 'author',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    in => 'path',
                    name => 'release',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => 
                                {
                                    category =>
                                    {
                                        description => 'An optional category can be specified to refine the result. Valid vlues include `changelog`, `contributing`, `dist`, `license`, `other`',
                                        maxLength => 2048,
                                        type => 'string',
                                    },
                                },
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => '#/components/schemas/files_categories',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/release/interesting_files/{author}/{release}
        '/v1/release/interesting_files/{author}/{release}' =>
        {
            get => 
            {
                description => qq{Retrieves the list of release interesting files},
                operationId => 'GetReleaseInterestingFiles',
                example => '/v1/release/interesting_files/JDEGUEST/Module-Generic-v0.30.5',
                parameters => [
                {
                    in => 'path',
                    name => 'author',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    in => 'path',
                    name => 'release',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    in => 'query',
                    name => 'category',
                    description => 'An optional category can be specified to refine the result. Valid vlues include `changelog`, `contributing`, `dist`, `license`, `other`',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => '#/components/schemas/files_interesting',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => qq{Retrieves the list of release interesting files},
                operationId => 'PostReleaseInterestingFiles',
                example => '/v1/release/interesting_files/JDEGUEST/Module-Generic-v0.30.5',
                parameters => [
                {
                    in => 'path',
                    name => 'author',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    in => 'path',
                    name => 'release',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => 
                                {
                                    category =>
                                    {
                                        description => 'An optional category can be specified to refine the result. Valid vlues include `changelog`, `contributing`, `dist`, `license`, `other`',
                                        maxLength => 2048,
                                        type => 'string',
                                    },
                                },
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => '#/components/schemas/files_interesting',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Release.pm#L75>
        # NOTE: /v1/release/latest_by_author/{author}
        '/v1/release/latest_by_author/{author}' =>
        {
            get => 
            {
                description => qq{Get latest releases by the specified author},
                operationId => 'GetLatestReleaseByAuthor',
                parameters => [
                {
                    in => 'path',
                    name => 'author',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => '#/components/schemas/releases',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => qq{Get latest releases by the specified author},
                operationId => 'PostLatestReleaseByAuthor',
                parameters => [
                {
                    in => 'path',
                    name => 'author',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => '#/components/schemas/releases',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Release.pm#L68>
        # NOTE: /v1/release/latest_by_distribution/{distribution}
        '/v1/release/latest_by_distribution/{distribution}' =>
        {
            get => 
            {
                description => qq{Get latest releases by distribution},
                operationId => 'GetLatestReleaseByDistribution',
                parameters => [
                {
                    in => 'path',
                    name => 'distribution',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    properties =>
                                    {
                                        release =>
                                        {
                                            schema =>
                                            {
                                                '$ref' => '#/components/schemas/release',
                                            }
                                        },
                                        took =>
                                        {
                                            type => 'integer',
                                        },
                                        total =>
                                        {
                                            type => 'integer',
                                        },
                                    },
                                    type => 'object',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => qq{Get recent releases},
                operationId => 'PostLatestReleaseByDistribution',
                parameters => [
                {
                    in => 'path',
                    name => 'distribution',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    properties =>
                                    {
                                        release =>
                                        {
                                            schema =>
                                            {
                                                '$ref' => '#/components/schemas/release',
                                            }
                                        },
                                        took =>
                                        {
                                            type => 'integer',
                                        },
                                        total =>
                                        {
                                            type => 'integer',
                                        },
                                    },
                                    type => 'object',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/release/modules/{author}/{release}
        '/v1/release/modules/{author}/{release}' =>
        {
            get => 
            {
                description => qq{Retrieves the list of modules in the specified release},
                operationId => 'GetReleaseModules',
                example => '/v1/release/modules/JDEGUEST/Module-Generic-v0.31.0',
                parameters => [
                {
                    in => 'path',
                    name => 'author',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    in => 'path',
                    name => 'release',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which object to [join](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#joins) in the result.",
                    in => 'query',
                    name => 'join',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => '#/components/schemas/files',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Release.pm#L56>
        # NOTE: /v1/release/recent
        '/v1/release/recent' =>
        {
            get => 
            {
                description => qq{Get recent releases},
                operationId => 'GetReleaseRecent',
                parameters => [
                {
                    description => "Specifies the page offset starting from 1.",
                    in => 'query',
                    name => 'page',
                    required => \0,
                    schema =>
                    {
                        type => 'integer'
                    },
                },
                {
                    description => "Specifies the page size, i.e. the number of elements returned in one page.",
                    in => 'query',
                    name => 'size',
                    required => \0,
                    schema =>
                    {
                        type => 'integer'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => '#/components/schemas/release_recents',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => qq{Get recent releases},
                operationId => 'PostReleaseRecent',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => 
                                {
                                    page =>
                                    {
                                        description => "Specifies the page offset starting from 1.",
                                        type => 'integer'
                                    },
                                    page_size =>
                                    {
                                        description => "Specifies the page size, i.e. the number of elements returned in one page.",
                                        type => 'integer'
                                    }
                                },
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => '#/components/schemas/release_recents',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Release.pm#L106>
        # NOTE: /v1/release/top_uploaders
        '/v1/release/top_uploaders' =>
        {
            get => 
            {
                description => qq{Get top release uploaders},
                operationId => 'GetTopReleaseUploaders',
                parameters => [
                {
                    description => "Specifies the result range. Valid values are `all`, `weekly`, `monthly` or `yearly`. It defaults to `weekly`",
                    in => 'query',
                    name => 'range',
                    required => \0,
                    schema =>
                    {
                        type => 'string'
                    },
                },
                {
                    description => "Specifies the page size, i.e. the number of elements returned in one page.",
                    in => 'query',
                    name => 'page_size',
                    required => \0,
                    schema =>
                    {
                        type => 'integer'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    properties =>
                                    {
                                        count =>
                                        {
                                            items =>
                                            {
                                                additionalProperties =>
                                                {
                                                    type => 'string',
                                                },
                                                type => 'object',
                                            },
                                            # TODO: /v1/release/top_uploaders: Not sure this is the number of distributions. Need to be double checked
                                            description => 'Array of pause IDs to the number of distributions',
                                            example => '"NOBUNAGA" : 5',
                                            type => 'array',
                                        },
                                        took =>
                                        {
                                            type => 'integer',
                                        },
                                    },
                                    type => 'object',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => qq{Get top release uploaders},
                operationId => 'PostTopReleaseUploaders',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => 
                                {
                                    range =>
                                    {
                                        description => "Specifies the result range. Valid values are `all`, `weekly`, `monthly` or `yearly`. It defaults to `weekly`",
                                        type => 'string'
                                    }
                                },
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    properties =>
                                    {
                                        count =>
                                        {
                                            items =>
                                            {
                                                additionalProperties =>
                                                {
                                                    type => 'string',
                                                },
                                                type => 'object',
                                            },
                                            # TODO: /v1/release/top_uploaders: Not sure this is the number of distributions. Need to be double checked
                                            description => 'Array of pause IDs to the number of distributions',
                                            example => '"NOBUNAGA" : 5',
                                            type => 'array',
                                        },
                                        took =>
                                        {
                                            type => 'integer',
                                        },
                                    },
                                    type => 'object',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Release.pm#L87>
        # NOTE: /v1/release/versions/{distribution}
        '/v1/release/versions/{distribution}' =>
        {
            get => 
            {
                description => qq{Get all releases by versions for the specified distribution},
                operationId => 'GetAllReleasesByVersion',
                example => '/v1/release/versions/Module-Generic',
                parameters => [
                {
                    in => 'path',
                    name => 'distribution',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies the version(s) to return as a comma-sepated value.",
                    example => 'v0.30.5,v0.31.0',
                    in => 'query',
                    name => 'versions',
                    required => \0,
                    schema =>
                    {
                        type => 'string'
                    },
                },
                {
                    description => "Specifies whether the result should be returned in plain mode.",
                    in => 'query',
                    name => 'plain',
                    required => \0,
                    schema =>
                    {
                        type => 'boolean'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => '#/components/schemas/releases',
                                }
                            },
                            'text/plain' =>
                            {
                                description => 'Lines of version and download URL spearated by a space are returned when the option `plain` is enabled.',
                                example => "v0.31.0	https://cpan.metacpan.org/authors/id/J/JD/JDEGUEST/Module-Generic-v0.31.0.tar.gz\nv0.30.5	https://cpan.metacpan.org/authors/id/J/JD/JDEGUEST/Module-Generic-v0.30.5.tar.gz",
                                schema =>
                                {
                                    format => 'binary',
                                    type => 'string',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => qq{Get all releases by versions for the specified distribution},
                operationId => 'PostAllReleasesByVersion',
                example => '/v1/release/versions/Module-Generic',
                parameters => [
                {
                    in => 'path',
                    name => 'distribution',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => 
                                {
                                    versions =>
                                    {
                                        description => "Specifies the version(s) to return as a comma-sepated value.",
                                        example => 'v0.30.5,v0.31.0',
                                        type => 'string'
                                    },
                                    plain =>
                                    {
                                        description => "Specifies whether the result should be returned in plain mode.",
                                        type => 'boolean'
                                    }
                                },
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => '#/components/schemas/releases',
                                }
                            },
                            'text/plain' =>
                            {
                                description => 'Lines of version and download URL spearated by a space are returned when the option `plain` is enabled.',
                                example => "v0.31.0	https://cpan.metacpan.org/authors/id/J/JD/JDEGUEST/Module-Generic-v0.31.0.tar.gz\nv0.30.5	https://cpan.metacpan.org/authors/id/J/JD/JDEGUEST/Module-Generic-v0.30.5.tar.gz",
                                schema =>
                                {
                                    format => 'binary',
                                    type => 'string',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/release/_mapping
        '/v1/release/_mapping' =>
        {
            get => 
            {
                description => qq{Returns the available fields for the [release object](https://explorer.metacpan.org/?url=/release/_mapping).},
                operationId => 'GetReleaseMapping',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/release_mapping",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/release/_search
        '/v1/release/_search' =>
        {
            get => 
            {
                description => qq{Returns the result set for the release search.},
                operationId => 'GetReleaseSearch',
                parameters => [
                {
                    description => "Specifies the [search query](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#get-searches).",
                    in => 'query',
                    name => 'q',
                    required => \1,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    description => "Specifies the maximum number of [search](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#get-searches) result elements.",
                    in => 'query',
                    name => 'size',
                    required => \0,
                    schema =>
                    {
                        type => 'integer',
                    },
                },
                {
                    description => "Specifies the elements to sort the [search](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#get-searches) result.",
                    in => 'query',
                    name => 'sort',
                    required => \0,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        type => 'string',
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => qq{Returns the result set for the release search.},
                operationId => 'PostReleaseSearch',
                parameters => [
                {
                    in => 'query',
                    name => 'query',
                    required => \1,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    in => 'query',
                    name => 'size',
                    required => \0,
                    schema =>
                    {
                        type => 'integer',
                    },
                },
                {
                    description => "Specifies the elements to sort the [search](https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md#get-searches) result.",
                    in => 'query',
                    name => 'sort',
                    required => \0,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                '$ref' => '#/components/schemas/search',
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/release/_search/scroll
        '/v1/release/_search/scroll' =>
        {
            'delete' =>
            {
                description => qq{Clear a [scroll](https://www.elastic.co/guide/en/elasticsearch/reference/8.9/paginate-search-results.html#clear-scroll)},
                operationId => 'DeleteReleaseSearchScroll',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                oneOf => [
                                    {
                                        properties => 
                                        {
                                            scroll_id =>
                                            {
                                                type => 'string',
                                            },
                                        },
                                    },
                                    {
                                        properties => 
                                        {
                                            scroll_id =>
                                            {
                                                items =>
                                                {
                                                    type => 'string',
                                                },
                                                type => 'array',
                                            },
                                        },
                                    },
                                ],
                            }
                        }
                    },
                    required => \1,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    type => 'object',
                                    properties =>
                                    {
                                        # TODO: Need to find out what is returned upon clearing a scroll
                                        removed =>
                                        {
                                            type => 'boolean',
                                        }
                                    }
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            get => 
            {
                description => qq{Returns the result set for the release search.},
                operationId => 'GetReleaseSearchScroll',
                parameters => [
                {
                    description => "Specifies the time to live of the [scroll search](https://www.elastic.co/guide/en/elasticsearch/reference/2.4/search-request-scroll.html#scroll-search-context).",
                    in => 'query',
                    name => 'scroll',
                    required => \1,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    description => "Specifies the [scroll ID](https://www.elastic.co/guide/en/elasticsearch/reference/2.4/search-request-scroll.html).",
                    in => 'query',
                    name => 'scroll_id',
                    required => \1,
                    schema =>
                    {
                        type => 'string',
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/scroll_result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => qq{Returns the result set for the release search.},
                operationId => 'PostReleaseSearchScroll',
                parameters => [],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                '$ref' => '#/components/schemas/scroll',
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/scroll_result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/ReverseDependencies.pm#L14>
        # NOTE: /v1/reverse_dependencies/dist/{module}
        '/v1/reverse_dependencies/dist/{module}' =>
        {
            get => 
            {
                description => qq{Returns a list of all the modules who depend on the specified module.`.},
                operationId => 'GetReverseDependencyDist',
                parameters => [
                {
                    in => 'path',
                    name => 'module',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => 'Specifies the page offset from which the result will be returned.',
                    in => 'query',
                    name => 'page',
                    required => \0,
                    schema =>
                    {
                        type => 'integer',
                    },
                },
                {
                    description => 'Specifies the number of result per page to be returned.',
                    in => 'query',
                    name => 'page_size',
                    required => \0,
                    schema =>
                    {
                        type => 'integer',
                    },
                },
                {
                    description => 'Specifies the maximum total number of result to be returned.',
                    in => 'query',
                    name => 'size',
                    required => \0,
                    schema =>
                    {
                        type => 'integer',
                    },
                },
                {
                    description => 'Specifies how the result is sorted.',
                    in => 'query',
                    name => 'sort',
                    required => \0,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/reverse_dependencies",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => qq{Returns a list of all the modules who depend on the specified module.`.},
                operationId => 'PostReverseDependencyDist',
                parameters => [
                {
                    in => 'path',
                    name => 'module',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => 
                                {
                                    page =>
                                    {
                                        description => 'Specifies the page offset from which the result will be returned.',
                                        type => 'integer',
                                    },
                                    page_size =>
                                    {
                                        description => 'Specifies the number of result per page to be returned.',
                                        type => 'integer',
                                    },
                                    size =>
                                    {
                                        description => 'Specifies the maximum total number of result to be returned.',
                                        type => 'integer',
                                    },
                                    sort =>
                                    {
                                        description => 'Specifies how the result is sorted.',
                                        type => 'string',
                                    },
                                },
                                required => [],
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/reverse_dependencies",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/ReverseDependencies.pm#L23>
        # NOTE: /v1/reverse_dependencies/module/{module}
        '/v1/reverse_dependencies/module/{module}' =>
        {
            get => 
            {
                description => qq{Returns a list of all the modules who depend on the specified module.`.},
                operationId => 'GetReverseDependencyModule',
                example => '/v1/reverse_dependencies/module/Module::Generic',
                parameters => [
                {
                    in => 'path',
                    name => 'module',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => 'Specifies the page offset from which the result will be returned.',
                    in => 'query',
                    name => 'page',
                    required => \0,
                    schema =>
                    {
                        type => 'integer',
                    },
                },
                {
                    description => 'Specifies the number of result per page to be returned.',
                    in => 'query',
                    name => 'page_size',
                    required => \0,
                    schema =>
                    {
                        type => 'integer',
                    },
                },
                {
                    description => 'Specifies how the result is sorted.',
                    in => 'query',
                    name => 'sort',
                    required => \0,
                    schema =>
                    {
                        type => 'string',
                    },
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/reverse_dependencies",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
            post => 
            {
                description => qq{Returns a list of all the modules who depend on the specified module.`.},
                operationId => 'PostReverseDependencyModule',
                parameters => [
                {
                    in => 'path',
                    name => 'module',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/json' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => 
                                {
                                    page =>
                                    {
                                        description => 'Specifies the page offset from which the result will be returned.',
                                        type => 'integer',
                                    },
                                    page_size =>
                                    {
                                        description => 'Specifies the number of result per page to be returned.',
                                        type => 'integer',
                                    },
                                    sort =>
                                    {
                                        description => 'Specifies how the result is sorted.',
                                        type => 'string',
                                    },
                                },
                                required => [],
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/reverse_dependencies",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/search
        '/v1/search' =>
        {
            get => 
            {
                description => qq{Returns result set based on the search query.`.},
                operationId => 'GetSearchResult',
                parameters => [
                {
                    description => "Specifies the search keywords to be queried.",
                    in => 'query',
                    name => 'q',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/search/autocomplete
        '/v1/search/autocomplete' =>
        {
            get => 
            {
                description => qq{Returns result set based on the autocomplete search query.`.},
                operationId => 'GetSearchAutocompleteResult',
                parameters => [
                {
                    description => "Specifies the search keyword to be queried.",
                    in => 'query',
                    name => 'q',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/search/autocomplete/suggest
        '/v1/search/autocomplete/suggest' =>
        {
            get => 
            {
                description => qq{Returns suggested result set based on the autocomplete search query.`.},
                operationId => 'GetSearchAutocompleteSuggestResult',
                parameters => [
                {
                    description => "Specifies the search keyword to be queried.",
                    in => 'query',
                    name => 'q',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/search/first
        '/v1/search/first' =>
        {
            get => 
            {
                description => qq{Perform API search and return the first result (I'm Feeling Lucky)},
                operationId => 'GetSearchFirstResult',
                parameters => [
                {
                    description => "Specifies the search keywords to be queried.",
                    in => 'query',
                    name => 'q',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    properties =>
                                    {
                                        path =>
                                        {
                                            type => 'string',
                                            description => "Relative path to module with full name",
                                        },
                                        authorized =>
                                        {
                                            type => 'boolean',
                                        },
                                        description =>
                                        {
                                            type => 'string',
                                            description => "Module description",
                                        },
                                        id =>
                                        {
                                            type => 'string',
                                        },
                                        distribution =>
                                        {
                                            type => 'string',
                                            description => "Name of the distribution the module is contained in",
                                        },
                                        author =>
                                        {
                                            type => 'string',
                                            description => "Module author ID",
                                        },
                                        release =>
                                        {
                                            type => 'string',
                                            description => "Package name with version",
                                        },
                                        status =>
                                        {
                                            type => 'string',
                                        },
                                        'abstract.analyzed' =>
                                        {
                                            type => 'string',
                                            description => "The module's abstract as analyzed from POD",
                                        },
                                        dist_fav_count =>
                                        {
                                            type => 'integer',
                                            description => "Number of times favorited",
                                        },
                                        date =>
                                        {
                                            type => 'string',
                                            description => "date module was indexed",
                                            format => 'date-time',
                                        },
                                        documentation =>
                                        {
                                            type => 'string',
                                        },
                                        pod_lines =>
                                        {
                                            type => 'array',
                                        },
                                        items =>
                                        {
                                            type => 'integer',
                                        },
                                        indexed =>
                                        {
                                            type => 'boolean',
                                            description => "Is the module indexed by PAUSE",
                                        },
                                    },
                                    type => 'object',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # NOTE: /v1/search/web
        '/v1/search/web' =>
        {
            get => 
            {
                description => qq{Perform API search in the same fashion as the Web UI},
                operationId => 'GetSearchWebResult',
                parameters => [
                {
                    description => "The query search term. If the search term contains a term with the tags `dist:` or `module:` results will be in expanded form, otherwise collapsed form.\n\nSee also `collapsed`",
                    in => 'query',
                    name => 'q',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    description => "The offset to use in the result set",
                    in => 'query',
                    name => 'from',
                    required => \0,
                    schema =>
                    {
                        default => 0,
                        type => 'integer',
                    },
                    style => 'simple',
                },
                {
                    description => "Number of results per page",
                    in => 'query',
                    name => 'size',
                    required => \0,
                    schema =>
                    {
                        default => 20,
                        type => 'integer',
                    },
                    style => 'simple',
                },
                {
                    description => "Force a collapsed even when searching for a particular distribution or module name.",
                    in => 'query',
                    name => 'collapsed',
                    required => \0,
                    schema =>
                    {
                        type => 'boolean',
                    },
                    style => 'simple',
                },
                {
                    description => "Specifies which fields in the response should be provided.",
                    in => 'query',
                    name => 'fields',
                    required => \0,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string'
                    },
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'application/json' =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/result_set",
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Source.pm#L17>
        # NOTE: /v1/source/{author}/{release}/{path}
        '/v1/source/{author}/{release}/{path}' =>
        {
            get => 
            {
                description => qq{Returns the POD of the given module. You can change the output format by either passing a `content-type` query parameter (e.g. [/pod/Moose?content-type=text/plain](https://fastapi.metacpan.org/v1/pod/Moose?content-type=text/plain) or by adding an `Accept` header to the HTTP request. Valid content types are:\n\n* text/html (default)\n* text/plain\n* text/x-pod\n* text/x-markdown},
                operationId => 'GetSourceReleasePod',
                example => '/v1/source/JDEGUEST/Module-Generic-v0.31.0/lib/Module/Generic.pm',
                parameters => [
                {
                    in => 'path',
                    name => 'author',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    in => 'path',
                    name => 'release',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                },
                {
                    in => 'path',
                    name => 'path',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'text/plain' =>
                            {
                                schema =>
                                {
                                    format => 'binary',
                                    type => 'string',
                                }
                            },
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
        # <https://github.com/metacpan/metacpan-api/blob/97b4791bf274bfb4e25f3a122e7115a2e9315404/lib/MetaCPAN/Server/Controller/Source.pm#L61>
        # NOTE: /v1/source/{module}
        '/v1/source/{module}' =>
        {
            get => 
            {
                description => qq{Returns the full source of the latest, authorized version of the given `module`.},
                operationId => 'GetModuleSource',
                parameters => [
                {
                    in => 'path',
                    name => 'module',
                    required => \1,
                    schema =>
                    {
                        maxLength => 2048,
                        type => 'string',
                    },
                    style => 'simple',
                }],
                requestBody =>
                {
                    content =>
                    {
                        'application/x-www-form-urlencoded' =>
                        {
                            encoding => {},
                            schema =>
                            {
                                additionalProperties => \0,
                                properties => {},
                                type => 'object'
                            }
                        }
                    },
                    required => \0,
                },
                responses =>
                {
                    200 =>
                    {
                        content =>
                        {
                            'text/plain' =>
                            {
                                schema =>
                                {
                                    format => 'binary',
                                    type => 'string',
                                }
                            }
                        },
                        description => 'Successful response.',
                    },
                    default =>
                    {
                        content =>
                        {
                            "application/json" =>
                            {
                                schema =>
                                {
                                    '$ref' => "#/components/schemas/error",
                                }
                            }
                        },
                        description => "Error response.",
                    }
                }
            },
        },
    },
    security => [],
    servers => [
        { url => 'https://fastapi.metacpan.org' },
    ],
}
