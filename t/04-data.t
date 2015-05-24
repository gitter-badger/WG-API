#!/usr/bin/env perl
#

use v5.014;
use strict;
use warnings;
use lib( './lib');
use WG::API;

use Test::More;

my $wg = WG::API->new( { 
            application_id  => 'demo1',
            lang            => 'ru',
            api_uri         => 'api.worldoftanks.ru/wgn',
            debug           => '1',
        } );
# without data (invalid request)
ok( ! $wg->data,                    'get response data' );
ok( ! $wg->data->count,             'get data-object counter' );
ok( ! $wg->data->all,               'get all data\'s from request' );
ok( ! $wg->data->each,              'each next data-object from request' );

    $wg = WG::API->new( { 
            application_id  => 'demo',
            lang            => 'ru',
            api_uri         => 'api.worldoftanks.ru/wgn',
            debug           => '1',
        } );
# with data (valid request)
ok( $wg->data,                    'get response data' );
ok( $wg->data->count,             'get data-object counter' );
ok( $wg->data->all,               'get all data\'s from request' );
ok( $wg->data->each,              'each next data-object from request' );

done_testing();
