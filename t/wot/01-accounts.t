#!/usr/bin/env perl
#
#

use v5.014;
use strict;
use warnings;
use Test::More;
use WG::API::WoT::Accounts;

can_ok( 'WG::API::WoT::Accounts', qw/account_list account_info account_tanks account_achievements/ );

my $wot = WG::API::WoT::Accounts->new( { application_id => 'demo' } );
ok( $wot->account_list(), 'get account list');
ok( $wot->account_info(), 'get account info' );
ok( $wot->account_tanks(), 'get account tanks' );
ok( $wot->account_avhievements(), 'get account achievements' );
done_testing();
