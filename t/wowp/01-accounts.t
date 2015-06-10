#!/usr/bin/env perl
#

use v5.014;
use strict;
use warnings;
use WG::API::WoWp::Accounts;

use Test::More;

can_ok( 'WG::API::WoWp::Accounts', qw/account_list account_info account_planes/);

my $wowp = WG::API::WoWp::Accounts->new( { application_id => 'demo' } );
ok( $wowp,                      'accounts-class created' );

ok( $wowp->account_list(), 'get account list' );
ok( $wowp->account_info(), 'get account info' );
ok( $wowp->account_planes(), 'get account planes' );

done_testing();
