#!/usr/bin/env perl
#
#

use v5.014;
use strict;
use warnings;
use WG::API::Servers;

use Test::More;

my $wgc = WG::API::Servers->new( { application_id => 'demo', debug => 1 } );
can_ok( 'WG::API::Servers', qw/servers_info/);
$wgc->servers_info;
ok( $wgc->status eq 'ok',     'get servers info status is ok' );
ok( $wgc->response,           'get response' );
$wgc->servers_info( { game => 'wowp' } );
ok( $wgc->status eq 'ok',     'get status wowp server' );

done_testing();
