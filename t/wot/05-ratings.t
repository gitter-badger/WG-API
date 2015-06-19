#!/usr/bin/env perl
#
#

use v5.014;
use strict;
use warnings;
use Test::More;
BEGIN: { use_ok( 'WG::API::WoT::Ratings' ) };

can_ok( 'WG::API::WoT::Ratings', qw/ratings_types ratings_dates ratings_accounts ratings_neighbors ratings_top/ );

TODO: {
    todo_skip 'not_implemented', '5';

    my $wot = WG::API::WoT::Ratings->new( { application_id => 'demo' } );
    ok( $wot->ratings_types(), 'get ratings types' );
    ok( $wot->ratings_dates(), 'get ratings dates' );
    ok( $wot->ratings_accounts(), 'get ratings accounts' );
    ok( $wot->ratings_neighbors(), 'get ratings neighbors' );
    ok( $wot->ratings_top(), 'get ratings top' );
};

done_testing();
