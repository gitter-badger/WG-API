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
ok( $wg->login( { 
            redirect_uri => 'api.worldoftanks.ru/wot/blank/',
        } ),                                        'login with redirect_uri and withour expires' );
ok( $wg->status eq 'ok',                            'check status' );
ok( $wg->response,                                  'check response' );
ok( ! $wg->error->code,                             'get error code' );
ok( ! $wg->login( 'blank' ),                        'login with invalid redirect_uri' );
ok( $wg->error->code,                               'check error code' );

my $wgn = $wg->new( { 
            application_id  => 'demo1',
            lang            => 'ru',
            api_uri         => 'api.worldoftanks.ru/wgn',
            debug           => '1',
        } );
ok( $wgn,                                           'create class with all params from ref' );
ok( ! $wgn->clans_list( { 
            'api_uri' => 'test.ru',
        } ),                                        'get clans list from invalid url' );

done_testing();
