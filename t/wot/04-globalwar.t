#!/usr/bin/env perl
#
#

use v5.014;
use strict;
use warnings;
use Test::More;
BEGIN: { use_ok( 'WG::API::WoT::Globalwar' ) };

can_ok( 'WG::API::WoT::Globalwar', qw/
    globalwar_clans globalwar_maps globalwar_provinces globalwar_tournaments globalwar_battles 
    globalwar_accountpoints globalwar_accountpointshistory globalwar_accountpointsrating 
    globalwar_clanpoints globalwar_clanpointshistory globalwar_clanpointsrating globalwar_clanprovinces/ );

my $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
ok( ! $wot->globalwar_clans(), 'get global war clans');
ok( ! $wot->globalwar_clans( map_id => 1 ), 'get global war clans');
ok( ! $wot->globalwar_clans( { app_id => 1 } ), 'get global war clans');
ok( ! $wot->globalwar_clans( { map_id => 'test' } ), 'get global war clans');
ok( $wot->status eq 'error', 'get global war clans' );
   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
ok( $wot->globalwar_clans( { map_id => '1' } ), 'get global war clans');
ok( $wot->status eq 'ok', 'get global war clans' );

TODO: {
    todo_skip 'not implemented', '12';

    my $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
    ok( $wot->globalwar_clans(), 'get global war clans');
    ok( $wot->globalwar_maps(), 'get global war maps');
    ok( $wot->globalwar_provinces(), 'get global war provinces');
    ok( $wot->globalwar_tournaments(), 'get global war tournaments');
    ok( $wot->globalwar_battles(), 'get global war battles');
    ok( $wot->globalwar_accountpoints(), 'get global war account pounts');
    ok( $wot->globalwar_accountpointshistory(), 'get global war account points hystory');
    ok( $wot->globalwar_accountpointsrating(), 'get global war account points rating');
    ok( $wot->globalwar_clanpoints(), 'get global war clan points');
    ok( $wot->globalwar_clanpointshistory(), 'get global war clan points hystory');
    ok( $wot->globalwar_clanpointsrating(), 'get global war clan points rating');
    ok( $wot->globalwar_clanprovinces(), 'get global war clan provinces');
};

done_testing();
