package WG::API::Clans;

use 5.014;
use strict;
use warnings;
use base qw/WG::API/;

=head1 NAME

WG::API::Clans - The great new WG::API::Clans!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use WG::API;

    my $foo = WG::API->clans_list();
    ...

=head1 METHODS

=head2 clans_list

    Select clans list 

=cut

sub clans_list {
    my ( $self, $params ) = @_;

    if ( $params && ref $params eq 'HASH' ) {
        $self->_get( { 
            uri => 'clans/list',
            %$params,
        } );
    } elsif ( ! $params ) {
        $self->_get( { 
            uri => 'clans/list'
        } );
    } else {
        return;
    }

    return $self->status && $self->status eq 'ok' ? $self->{ 'response' } : $self->{ 'error' };
}

=head2 clans_info

    Fetch clan info

=cut

1;
