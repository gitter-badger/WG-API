#!/usr/bin/env perl
#
#

use v5.014;
use strict;
use warnings;
use Test::More;

BEGIN: { use_ok( 'WG::API::WoT::Tanks' ) };

can_ok( 'WG::API::WoT::Tanks', qw/tanks_stats tanks_achievements/ );

TODO: {
    todo_skip 'not implemented', '2';

    my $wot = WG::API::WoT::Tanks->new( { application_id => 'demo' } );
    ok( $wot->tanks_stats(), 'get tanks stats' );
    ok( $wot->tanks_achievements(), 'get tanks achievements' );
};

done_testing();
