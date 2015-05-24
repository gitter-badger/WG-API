#!/usr/bin/env perl
#

use v5.014;
use strict;
use warnings;
use lib( './lib');
use WG::API;

use Test::More;

my $wg = WG::API->new( { application_id => 'demo' } );
ok( ! $wg->login(),                                 'login without redirect_uri' );
ok( ! $wg->login( { 'test', 'test' } ),             'login with invalid params' );
ok( $wg->login( 'api.worldoftanks.ru/wot/blank/' ), 'login with redirect_uri' );
ok( $wg->login( { 
            redirect_uri => 'api.worldoftanks.ru/wot/blank/',
            expires_at => '100',
         } ),                                       'login with valid params' );
ok( ! $wg->prolongate(),                            'prolongate tocken without logged user' );
ok( ! $wg->prolongate( '100' ),                     'prolongate tocken without logged user and invalid params' );
ok( ! $wg->prolongate( {
            expires_at => '100',
        } ),                                        'prolongate tocken without logged user and valid params' );
ok( ! $wg->logout(),                                'logout without logged user' );

done_testing();
