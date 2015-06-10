#!/usr/bin/env perl
#

use v5.014;
use strict;
use warnings;
use WG::API::WoWp::Ratings;

use Test::More;

can_ok( 'WG::API::WoWp::Ratings', qw/ratings_types ratings_accounts ratings_neighbors ratings_top ratings_dates/);

my $wowp = WG::API::WoWp::Ratings->new( { application_id => 'demo' } );
ok( $wowp,                      'rating-class created' );

ok( $wowp->ratings_types(), 'get ratings types' );
ok( $wowp->ratings_accounts(), 'get ratings accounts' );
ok( $wowp->ratings_neighbors(), 'get ratinds nieghbors' );
ok( $wowp->ratings_top(), 'get ratings top' );
ok( $wowp->ratings_dates(), 'get ratings dates' );

done_testing();
