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

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

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
    return defined($scalar) ? $block->($scalar) : $scalar;
}

=head2 function2

=cut

sub function2 {
}

=head1 AUTHOR

Nick Booker, C<< <NMBooker at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-scalar-ifdefined at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Scalar-IfDefined>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Scalar::IfDefined


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Scalar-IfDefined>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Scalar-IfDefined>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Scalar-IfDefined>

=item * Search CPAN

L<http://search.cpan.org/dist/Scalar-IfDefined/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2014 Nick Booker.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of Scalar::IfDefined
