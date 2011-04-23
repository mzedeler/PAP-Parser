#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'PAP::Parser' ) || print "Bail out!
";
}

diag( "Testing PAP::Parser $PAP::Parser::VERSION, Perl $], $^X" );
