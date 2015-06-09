package WG::API::Data;

use 5.014;
use strict;
use warnings;
use Data::Dumper;

=head1 NAME

WG::API::Data - The great new WG::API::Data!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use WG::API::Data;

    my $wg_data = WG::API::Data->new();
    ...

=head1 SUBROUTINES/METHODS

=head2 CONSTRUCTOR

=head3 new

Create new error object.

=cut

sub new {
    my $class = shift;
    
    my $self = $_[ 0 ] ? shift : {};
    bless $self, ref( $class ) ? ref( $class ) : $class;

    return $self;
}

=head2 METHODS

=cut

1;
