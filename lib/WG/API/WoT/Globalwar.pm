package WG::API::WoT::Globalwar;

use v5.014;
use strict;
use warnings;
use base qw/WG::API::WoT/;
use Data::Dumper;

=head1 NAME

WG::API::WoT::

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSYS

Quick summary of what the module does.

Perhaps a little code snippet.

     use WG::API::WoT::Globalwar
 
     my $foo = WG::API::Globalwar->new();
     my @list = $foo->globalwar_clans();
     ...

=head1 METHODS

=head2 globalwar_clans 

...

=cut 

sub globalwar_clans{
    my $self = shift;

    $self->_request( 'get', 'globalwar/clans', ['language', 'fields', 'map_id', 'limit', 'page_no'], ['map_id'], $_[0] );

    return $self->status eq 'ok' ? $self->response : undef ;
}

=head2 globalwar_maps 

...

=cut 

sub globalwar_maps {
    my $self = shift;

    $self->_request( 'get', 'globalwar/maps', ['language', 'fields'], undef, $_[0] );

    return $self->status eq 'ok' ? $self->response : undef ;
}

=head2 globalwar_provinces 

...

=cut 

sub globalwar_provinces {
    my $self = shift;

    $self->_request( 'get', 'globalwar/provinces', ['language', 'fields', 'map_id', 'province_id', 'region_id', 'status'], ['map_id'], $_[0] );

    return $self->status eq 'ok' ? $self->response : undef ;
}

=head2 globalwar_tournaments 

...

=cut 

sub globalwar_tournaments {
    my $self = shift;

    $self->_request( 'get', 'globalwar/tournaments', ['language', 'fields', 'map_id', 'province_id'], ['map_id', 'province_id'], $_[0] );

    return $self->status eq 'ok' ? $self->response : undef ;
}

=head2 globalwar_battles 

...

=cut 

sub globalwar_battles {
    my $self = shift;

    $self->_request( 'get', 'globalwar/battles', ['language', 'fields', 'access_token', 'map_id', 'clan_id'], ['map_id', 'clan_id'], $_[0] );

    return $self->status eq 'ok' ? $self->response : undef ;
}

=head2 globalwar_accountpoints 

...

=cut 

sub globalwar_accountpoints {
    my $self = shift;

    $self->_request( 'get', 'globalwar/accountpoints', ['language', 'fields', 'map_id', 'account_id'], ['map_id', 'account_id'], $_[0] );

    return $self->status eq 'ok' ? $self->response : undef ;
}

=head2 globalwar_accountpointshistory 

...

=cut 

sub globalwar_accountpointshistory {
    my $self = shift;

    $self->_request( 'get', 'globalwar/accountpointshistory', ['language', 'fields', 'access_token', 'map_id', 'since', 'until', 'page_no', 'limit'], ['access_token', 'map_id'], $_[0] );

    return $self->status eq 'ok' ? $self->response : undef ;
}

=head2 globalwar_accountpointsrating 

...

=cut 

sub globalwar_accountpointsrating {
    my $self = shift;

    $self->_request( 'get', 'globalwar/accountpointsrating', ['language', 'fields', 'map_id', 'page_no', 'limit'], ['map_id'], $_[0] );

    return $self->status eq 'ok' ? $self->response : undef ;
}

=head2 globalwar_clanpoints 

...

=cut 

sub globalwar_clanpoints {
    my $self = shift;

    $self->_request( 'get', 'globalwar/clanpoints', ['language', 'fields', 'map_id', 'clan_id'], ['map_id', 'clan_id'], $_[0] );

    return $self->status eq 'ok' ? $self->response : undef ;
}

=head2 globalwar_clanpointshistory 

...

=cut 

sub globalwar_clanpointshistory {
    my $self = shift;

    $self->_request( 'get', 'globalwar/clanpointshistory', ['language', 'fields', 'map_id', 'clan_id', 'since', 'until', 'page_no', 'limit'], ['map_id', 'clan_id'], $_[0] );

    return $self->status eq 'ok' ? $self->response : undef ;
}

=head2 globalwar_clanpointsrating 

...

=cut 

sub globalwar_clanpointsrating {
    my $self = shift;

    $self->_request( 'get', 'globalwar/clanpointsrating', ['language', 'fields', 'map_id', 'page_no', 'limit'], ['map_id'], $_[0] );

    return $self->status eq 'ok' ? $self->response : undef ;
}

=head2 globalwar_clanprovinces

...

=cut 

sub globalwar_clanprovinces {
    my $self = shift;

    $self->_request( 'get', 'globalwar/clanprovinces', ['language', 'fields', 'clan_id'], ['clan_id'], $_[0] );

    return $self->status eq 'ok' ? $self->response : undef ;
}


=head1 AUTHOR

Cyrill Novgorodcev, C<< <cynovg at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-wg-api at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=WG-API>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc WG::API


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=WG-API>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/WG-API>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/WG-API>

=item * Search CPAN

L<http://search.cpan.org/dist/WG-API/>

=back


=head1 ACKNOWLEDGEMENTS

=cut

=head1 LICENSE AND COPYRIGHT

Copyright 2015 Cyrill Novgorodcev.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

1; # End of WG::API
