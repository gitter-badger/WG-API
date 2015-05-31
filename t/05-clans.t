#!/udr/bin/env perl
#
#

use v5.014;
use strict;
use warnings;
use WG::API::Clans;

use Test::More;

my $wgc = WG::API::Clans->new( { application_id => 'demo' } );
can_ok( 'WG::API::Clans', qw/clans_list clans_info clans_memberinfo clans_glossary/,  'can all methods');
ok( $wgc->clans_list(), 'get clans list');
ok( $wgc->clans_info(), 'get clan info');
ok( $wgc->clans_memberinfo(), 'get clans members info');
ok( $wgc->clans_glossary(), 'get clans glossary');

done_testing();
