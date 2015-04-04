#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'WG::API' ) || print "Bail out!\n";
}

diag( "Testing WG::API $WG::API::VERSION, Perl $], $^X" );
