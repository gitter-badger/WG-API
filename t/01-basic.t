#!/usr/bin/env perl
#

use v5.014;
use strict;
use warnings;
use lib( './lib');
use WG::API;

use Test::More;

my $app_id = 'demo';

ok( ! WG::API->new( ),                              'create object without app_id' );
ok( ! WG::API->new( $app_id ),                      'create object with invalid app_id' );
ok( ! WG::API->new( application_id => $app_id ),    'create object with invalid app_id' );

my $wg = WG::API->new( { application_id => $app_id } );
ok( $wg,                                            'create object with valid app_id' );
ok( ! $wg->login(),                                 'login without redirect_uri' );
ok( ! $wg->login( 'test', 'test' ),                 'login with invalid params' );
ok( $wg->login( 'api.worldoftanks.ru/wot/blank/' ), 'login with redirect_uri' );
ok( $wg->login( { redirect_uri => 'api.worldoftanks.ru/wot/blank/',
                    expires_at => '1',
                } ),                                'login with valid params' );

done_testing();
