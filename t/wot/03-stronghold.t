#!/usr/bin/env perl
#
#

use v5.014;
use strict;
use warnings;
use Test::More;
BEGIN: { use_ok( 'WG::API::WoT::Stronghold' ) };

TODO: {
    can_ok( 'WG::API::WoT::Stronghold', qw/stronghold_info stronghold_buildings stronghold_accountstats/ );

    my $wot = WG::API::WoT::Stronghold->new( { application_id => 'demo' } );
    ok( $wot->stronghold_info(), 'get info about stronghold' );
    ok( $wot->stronghold_buildings(), 'get info about stronghold buildings' );
    ok( $wot->stronghold_accountstats(), 'get info about account stats' );
};

done_testing();
