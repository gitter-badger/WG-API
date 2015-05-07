#!/usr/bin/env perl
use 5.014;
use strict;
use warnings;
use Test::More;

plan tests => 2;

BEGIN {
    use_ok( 'WG::API' ) || say "WG::API loaded";
    use_ok( 'WG::API::Error' ) || say "WG::API::Error loaded"; 
}

diag( "Testing WG::API $WG::API::VERSION, Perl $], $^X" );
diag( "Testing WG::API::Error $WG::API::Error::VERSION, Perl $], $^X" );
