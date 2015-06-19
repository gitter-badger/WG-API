#!/usr/bin/env perl
#
#

use v5.014;
use strict;
use warnings;
use Test::More;

BEGIN: { use_ok( 'WG::API::WoT::ClansRatings' ) };

TODO: {
    can_ok( 'WG::API::WoT::ClansRatings', qw/clanratings_types clanratings_dates clanratings_clans clanratings_neighbors clanratings_top/ );

    my $wot = WG::API::WoT::ClansRatings->new( { application_id => 'demo' } );
    ok( $wot->clanratings_types(), 'get clan ratings types' );
    ok( $wot->clanratings_dates(), 'get clan ratings dates' );
    ok( $wot->clanratings_clans(), 'get clan ratings clans' );
    ok( $wot->clanratings_neighbors(), 'get clan ratings neighbors' );
    ok( $wot->clanratings_top(), 'get clan ratings top' );
};

done_testing();
