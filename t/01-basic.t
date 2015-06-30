#!/usr/bin/env perl
#

use v5.014;
use strict;
use warnings;
use lib( './lib');
use WG::API;

use Test::More;
use Data::Dumper;

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
# $wg->_get( uri, params, passed_params );
ok( ! $wg->_get( undef, ['language'], { language => 'ru' } ),       'send _get request' );
ok( ! $wg->_get( 'test', undef, { language => 'ru' } ),             'send _get request' );
ok( ! $wg->_get( 'test', ['language'], undef ),                     'send _get request' );

# $wg->_post( uri, params, passed_params );
ok( ! $wg->_post( undef, ['language'], { language => 'ru' } ),      'send _post request' );
ok( ! $wg->_post( 'test', undef, { language => 'ru' } ),            'send _post request' );
ok( ! $wg->_post( 'test', ['language'], undef ),                    'send _post request' );

# $wg->_request( method. uri, params_list, required params, passd params );
ok ( ! $wg->_request( 'test', 'uri', ['test'], ['test'], { test => 1 } ), '_request test' );
ok ( $wg->_request( 'get', 'uri', ['test'], ['test'], { test => 1 } ), '_prepare test' );
ok ( ! $wg->_request( 'get', '', ['test'], ['test'], { api_uri => 'test.worldoftanks.ru/wot' } ), '_prepare test' );
ok ( $wg->_request( 'get', '', ['test'], undef, { api_uri => 'test.worldoftanks.ru/wot' } ), '_prepare test' );
ok ( $wg->_request( 'get', '', undef, undef, { api_uri => 'test.worldoftanks.ru/wot' } ), '_prepare test' );
ok ( ! $wg->_request( 'get', '', undef, ['test'], { api_uri => 'test.worldoftanks.ru/wot' } ), '_prepare test' );
ok ( $wg->_request( 'post', '', ['test'], undef, { api_uri => 'api.worldoftanks.ru/wot' } ), '_prepare test' );
done_testing();
