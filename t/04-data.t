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
ok( ! $wg->datas,                   'get response datas' );
ok( ! $wg->datas->count,            'get data-object counter' );
ok( ! $wg->datas->all,              'get all data\'s from request' );
ok( ! $wg->datas->each,             'each next data-object from request' );

    $wg = WG::API->new( { 
            application_id  => 'demo',
            lang            => 'ru',
            api_uri         => 'api.worldoftanks.ru/wgn',
            debug           => '1',
        } );
# with data (valid request)
ok( $wg->datas,                   'get response data' );
ok( $wg->datas->count,            'get data-object counter' );
ok( $wg->datas->all,              'get all data\'s from request' );
ok( $wg->datas->each,             'each next data-object from request' );

done_testing();
