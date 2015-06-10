use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'WG::API',
    AUTHOR           => q{Cyrill Novgorodcev <cynovg@cpan.org>},
    VERSION_FROM     => 'lib/WG/API.pm',
    ABSTRACT_FROM    => 'lib/WG/API.pm',
    LICENSE          => 'artistic_2',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.014,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => 0,
    },
    PREREQ_PM => {
        JSON                => 2.61,
        LWP                 => 6.08,
        Readonly            => 2.00,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'WG-API-*' },
    test  => { RECURSIVE_TEST_FILES => 1 },
);
