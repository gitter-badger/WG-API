package WG::API::Auth;

use 5.014;
use strict;
use warnings;
use base qw/WG::API/;
use Readonly;
use LWP;
 
=head1 NAME

WG::API::Auth - The great new WG::API::Auth!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

Readonly::Scalar my $fortnight => '1209600';    #two weeks

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use WG::API;

    my $foo = WG::API->login();
    ...

=head1 METHODS

=head2 AUTH

=head3 login

=cut

sub login { 
    my ( $self, $params ) = @_;

    $self->_post( {
        api_uri     => 'api.worldoftanks.ru/wot',
        uri         => 'auth/login', 
        redirect_uri    => $params->{ 'redirect_uri' }, 
        expires_at      => $params->{ 'expires_at' } || $fortnight,
        nofollow        => $params->{ 'nofollow' } ? '1': '0',
    } );

    return $self->status && $self->status eq 'ok' ? $self->{ 'data' } : $self->{ 'error' };
}  

=head3 prolongate

=cut

sub prolongate { 
    $_[0]->_post( { 
            uri => 'auth/prolongate', 
            access_token => $_[0]->{ 'access_token' }, 
            expires_at => $_[1] && ref $_[1] eq 'HASH' ? $_[1]->{ 'expires_at' } : $fortnight 
        } ) 
}

=head3 logout

=cut

sub logout { 
    $_[0]->_post( { 
            uri => 'auth/logout', 
            access_token => $_[0]->{ 'access_token' } 
        } ) 
}

1;
