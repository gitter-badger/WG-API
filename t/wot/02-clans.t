#!/usr/bin/env perl
#
#

use v5.014;
use strict;
use warnings;
use Test::More;
BEGIN: { use_ok( 'WG::API::WoT::Clans' ) };

can_ok( 'WG::API::WoT::Clans', qw/clan_provinces/ );

TODO: {
    todo_skip 'not implemented', '1';

    my $wot = WG::API::WoT::Clans->new( { application_id => 'demo' } );
    ok( $wot->clan_provinces(), 'get clan provinces' );
};

done_testing();
