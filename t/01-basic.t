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
ok( $wg->new( { 
            application_id  => 'demo1',
            lang            => 'ru',
            api_uri         => 'api.worldoftanks.ru/wgn',
            debug           => '1',
        } ),                                         'create class with all params from ref' );
ok( ! WG::API->new( { app_id => $app_id } ),              'create object without application_id');
ok( ! $wg->_get( { 
            api_uri => 'http://www.ru/',
            uri     => 'test',
        } ), 'check api_uri params' );

ok( ! $wg->_get( { 
            api     => 'http://www.ru/',
            uri     => 'test',
        } ), 'check api_uri params' );

ok( ! $wg->_post( { 
            api_uri => 'http://www.ru/',
            uri     => 'test',
        } ), 'check api_uri params' );

ok( ! $wg->_post( { 
            api     => 'http://www.ru/',
            uri     => 'test',
        } ), 'check api_uri params' );

done_testing();
