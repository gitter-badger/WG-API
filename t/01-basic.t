#!/usr/bin/env perl
#

use v5.014;
use strict;
use warnings;
use lib( './lib');
use WG::API;

use Test::More;

my $app_id = 'demo';

ok( WG::API->can( 'new' ),                          'can new' );
ok( WG::API->can( 'login' ),                        'can login' );
ok( WG::API->can( 'prolongate' ),                   'can prolongate' );
ok( WG::API->can( 'logout' ),                       'can logout' );

ok( ! WG::API->new( ),                              'create object without app_id' );
ok( ! WG::API->new( $app_id ),                      'create object with invalid app_id' );
ok( ! WG::API->new( application_id => $app_id ),    'create object with invalid app_id' );

my $wg = WG::API->new( { application_id => $app_id } );
ok( $wg,                                            'create object with valid app_id' );

done_testing();
