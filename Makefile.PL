use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'PAP::Parser',
    AUTHOR              => q{"Michael Zedeler" <"michael@zedeler.dk">},
    VERSION_FROM        => 'lib/PAP/Parser.pm',
    ABSTRACT_FROM       => 'lib/PAP/Parser.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'Test::Exception' => 0,
        'Parse::Eyapp' => 0
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'PAP-Parser-*' },
);
