package Scalar::IfDefined;

use 5.006;
use strict;
use warnings;

use Exporter 'import';
our @EXPORT_OK = qw/ifdef/;

=head1 NAME

Scalar::IfDefined - Apply block to scalar depending on if it's defined.

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

    use Scalar::IfDefined qw/ifdef/;

    my $hash = {
        a => 1,
        b => 2,
        c => 3,
        d => {
            E => 1,
            F => 2,
        },
    };

    ifdef { $_ + 1 } $hash->{a};   # ---> 2
    ifdef { $_ + 1 } $hash->{missing};    # ---> undef
    ifdef { $_ + 1 } ifdef { $_->{F} } $hash->{d};  # ---> 3
    ifdef { $_ + 1 } ifdef { $_->{MISSING} } $hash->{d};  # ---> undef


    # Or perhaps with Perl6::Flows

    use Perl6::Flows;

    $hash->{a} 
        ==> ifdef { $_->{F} }
        ==> ifdef { $_ + 1 };            # ---> 3

=head1 EXPORT

=over 4

=item ifdef

=back

=head1 SUBROUTINES/METHODS

=head2 ifdef

Takes a block and a scalar value.

If the scalar value is undef, the block is ignored and undef is returned
straight away.

If the scalar value is defined, then the block is evaluated with $_ as
the value passed in, and the result of the block is returned.

=cut

sub ifdef(&$) {
    my ($block, $scalar) = @_;

    return $scalar if not defined $scalar;
    return $block->($scalar) for $scalar;
}


=head1 AUTHOR

Nick Booker, C<< <NMBooker at gmail.com> >>

=head1 BUGS

L<https://github.com/nmbooker/p5-Scalar-IfDefined/issues>


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2014 Nick Booker.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of Scalar::IfDefined
