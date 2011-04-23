#!perl

use strict;
use warnings;
use Test::More;
use Test::Exception;
use FindBin '$Bin';

use_ok('PAP::Parser');

lives_ok { PAP::Parser->new } 'Instantiante parser.';
lives_ok { PAP::Parser->new->slurp_file($0) } 'Read a file (without parsing it yet).';
lives_ok { PAP::Parser->new->input("some string") } 'Set input string (without parsing it yet).';

sub test_them(&$) {
    my $cb  = shift;
    my $dir = shift;
    opendir(my $dh, $dir);
    $cb->($_) for(grep { -f } map {"$dir/$_"} readdir($dh));
}

test_them {
    my $parser = PAP::Parser->new;
    $parser->slurp_file("$_");
    my $result;
    lives_ok { $result = $parser->Run } 'Parse file without throwing exception.';
    is(ref $result, 'HASH', 'Result is a hashref');
} "$Bin/data/working";

test_them {
    my $parser = PAP::Parser->new(yyerror => sub {});
    $parser->slurp_file("$_");
    my $result;
    eval { $parser->Run };
    ok((not $result or $@), "Parse file $_ throws exception or returns undef.");
} "$Bin/data/defunct";

done_testing;
