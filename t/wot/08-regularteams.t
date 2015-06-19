#!/usr/bin/env perl
#
#

use v5.014;
use strict;
use warnings;
use Test::More;

BEGIN: { use_ok( 'WG::API::WoT::Regularteams' ) };

can_ok( 'WG::API::WoT::Regularteams', qw/regularteams_list regularteams_info/ );
    
TODO: {
    todo_skip 'not implemented', '2';

    my $wot = WG::API::WoT::Regularteams->new( { application_id => 'demo' } );
    ok( $wot->regularteams_list(), 'get regular teams list' );
    ok( $wot->regularteams_info(), 'get regular teams info' );
};

done_testing();
