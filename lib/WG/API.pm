package WG::API;

use 5.014;
use strict;
use warnings;
use WG::API::Error;
use LWP;
use JSON;
use Data::Dumper;
use Readonly;

=head1 NAME

WG::API - The great new WG::API!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

Readonly::Scalar my $fortnight => '1209600';    #two weeks

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use WG::API;

    my $foo = WG::API->new();
    ...

=head1 METHODS

=head2 CONSTRUCTOR

=head3 new

Creta new object.

=cut

sub new {
    my $class   = shift;

    my $self = {};
    %{ $self } = @_;
    $self->{ 'ua' }  = LWP::UserAgent->new();
    $self->{ 'lang' } = 'ru' unless defined $self->{ 'lang' };
    
    bless $self, ref( $class ) || $class;

    return $self;
}

=head2 AUTH

=head3 login

=cut

sub login { 
    my ( $self, $redirect_uri ) = @_;
    my $response = $self->_post( uri => 'auth/login', redirect_uri => $redirect_uri, nofollow => 1 ); 
    return $self;
}  

=head3 prolongate

=cut

sub prolongate { $_[0]->_post( uri => 'auth/prolongate', access_token => $_[0]->{ 'access_token' }, expires_at => $_[1] ? $_[1] : $fortnight ) }

=head3 logout

=cut

sub logout { $_[0]->_post( uri => 'auth/logout', access_token => $_[0]->{ 'access_token' } ) }

=head2 CLANS 

=head3 clans_list

Return clans list

=cut

sub clans_list {
    my ( $self, %params ) = @_;

    my $clans_list = $self->_get(
        uri => 'clans/list',
        params  => %params,
    );

    return $clans_list;
}

=head2 INTERNAL DATA

=head3 status

Return request status

=cut

sub status { shift->{ 'status' } }

=head3 response

Return response

=cut

sub response { shift->{ 'response' } }

=head3 error

Return WG::API::Error object

=cut

sub error { shift->{ 'error' } }

sub _get {
    my ( $self, %param ) = @_;

    my $url = sprintf 'https://%s/%s/?application_id=%s',
            $self->{ 'api_uri' },
            $param{ 'uri' },
            $self->{ 'application_id' },
    ;
    for ( qw/access_token account_id fields language expires_at search/ ) {
        $url .= sprintf "&%s=%s", $_, $param{ $_ } if $param{ $_ }; 
    }

    warn $url if $self->{ 'debug' };
    $self->_parse( decode_json $self->{ 'ua' }->get( $url )->decoded_content );
    return $self->status;
}

sub _post {
    my ( $self, %param ) = @_;

    my $url = sprintf 'https://%s/%s/', 
        $self->{ 'api_uri' },
        $param{ 'uri' };

    $param{ 'application_id' } = $self->{ 'application_id' };

    warn $url if $self->{ 'debug' };
    $self->_parse( decode_json $self->{ 'ua' }->post( $url, \%param )->decoded_content );
    return $self->status;
}

sub _parse {
    my ( $self, $response ) = @_;

    warn Dumper $response if $self->{ 'debug' };

    $self->{ 'status' } = $response->{ 'status' };

    if ( $self->status eq 'error' ) {
        $self->{ 'error' } = WG::API::Error->new(
            $response->{ 'error' },
        );
    } elsif ( $self->status eq 'ok' ) {
        $self->{ 'response' } = $response->{ 'data' };
    } else {
        $self->{ 'status' } = 'unknow';
        $self->{ 'response' } = $response;

        warn sprintf "unknow status %s\n", $response->{ 'status' };
        warn "---- DEBUG ----\n";
        warn Dumper $response;
        warn "---- DEBUG ----\n";
    }

    return;
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
