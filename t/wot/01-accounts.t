#!/usr/bin/env perl
#
#

use v5.014;
use strict;
use warnings;
use Test::More;

BEGIN: { use_ok( 'WG::API::WoT::Accounts' ) };

can_ok( 'WG::API::WoT::Accounts', qw/account_list account_info account_tanks account_achievements/ );

TODO: {
    todo_skip 'not implemented', '32';

    my $wot = WG::API::WoT::Accounts->new( { application_id => 'demo' } );
    ok( ! $wot->account_list(), 'get account list');
    ok( $wot->status eq 'error', 'get account list' );
    ok( ! $wot->account_list( search => '1234' ), 'get account list');
    ok( $wot->status eq 'error', 'get account list' );
    ok( $wot->account_list( { search => '1234' } ), 'get account list');
    ok( $wot->status eq 'ok', 'get account list' );
    ok( $wot->account_list( { search => '1234', type => 'startswith' } ), 'get account list');
    ok( $wot->status eq 'ok', 'get account list' );
    ok( $wot->account_list( { search => '1234', type => 'exact' } ), 'get account list');
    ok( $wot->status eq 'ok', 'get account list' );
    ok( ! $wot->account_list( { search => '1', type => 'startswith' } ), 'get account list');
    ok( $wot->status eq 'error', 'get account list' );
    ok( $wot->account_list( { search => '12', type => 'exact' } ), 'get account list');
    ok( $wot->status eq 'ok', 'get account list' );

    $wot = WG::API::WoT::Accounts->new( { application_id => 'demo' } );
    ok( ! $wot->account_info(), 'get account info' );
    ok( $wot->status eq 'error', 'get account info' );
    ok( ! $wot->account_info( account_id => 'test' ), 'get account info' );
    ok( $wot->status eq 'error', 'get account info' );
    ok( $wot->account_info( { account_id => 'test' } ), 'get account info' );
    ok( $wot->status eq 'ok', 'get account info' );

    $wot = WG::API::WoT::Accounts->new( { application_id => 'demo' } );
    ok( ! $wot->account_tanks(), 'get account tanks' );
    ok( $wot->status eq 'error', 'get account tanks' );
    ok( ! $wot->account_tanks( account_id => 'test' ), 'get account tanks' );
    ok( $wot->status eq 'error', 'get account tanks' );
    ok( $wot->account_tanks( { account_id => 'test' } ), 'get account tanks' );
    ok( $wot->status eq 'ok', 'get account tanks' );

    $wot = WG::API::WoT::Accounts->new( { application_id => 'demo' } );
    ok( ! $wot->account_achievements(), 'get account achievements' );
    ok( $wot->status eq 'error', 'get account achievements' );
    ok( ! $wot->account_achievements( account_id => 'test' ), 'get account achievements' );
    ok( $wot->status eq 'error', 'get account achievements' );
    ok( $wot->account_achievements( { account_id => 'test' } ), 'get account achievements' );
    ok( $wot->status eq 'ok', 'get account achievements' );
};

done_testing();
