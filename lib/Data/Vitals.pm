package Data::Vitals;

=pod

=head1 NAME

Data::Vitals - The Perl "Vital Statistics" Library

=head1 DESCRIPTION

The world of clothing and fashion works to an annoyingly anacronistic and
complicated set of measurements. The Perl "Vital Statistics" Library is an
attempt to create a comprehensive set of classes, object and algorithms for
working with human-describing data such as height, body measurements, shoe,
bra and other clothing sizes.

It is not intended to be the end to a means, or the solution to a specific
problem, but rather a general package that can be used to build more specific
packages. It is intended that the library should be extremely flexible,
highly extendible, support locales in some form, and be heavily unit tested
to ensure that packages built on top of Data::Vitals have a reliable base.

=head2 Implementation Style

As is generally the case with complex and twisty subjects (such as
L<DateTime>) this library is implemented in a highly object-orientated
form.

For the sake of completeness we take this to rather extreme levels. For
example, a Data::Vitals::Waist object specifically refers for a
measurement of the circumference of the torso taken at a waist.

=head1 STATUS

This contains an implementation of the relatively straight forward
measurements. Height + the various chest/waist/hip ones.

Unit testing is up to date, but documentation is not. See the source code
for how to work with the objects so far defined. Please be aware that the
API may change.

=head1 METHODS

=cut

use 5.005;
use strict;
use UNIVERSAL 'isa';

# Load the entire distribution
use Data::Vitals::Util          ();
use Data::Vitals::Height        ();
use Data::Vitals::Circumference ();
use Data::Vitals::Hips          ();
use Data::Vitals::Waist         ();
use Data::Vitals::Frame         ();
use Data::Vitals::Chest         ();

use vars qw{$VERSION};
BEGIN {
	$VERSION = '0.00_02';
}





#####################################################################
# Constructor Shortcuts

=pod

=head2 height $height

The C<height> method creates and returns a height object. It takes as
argument a "height string".

Returns a new Data::Vitals::Height object on success, or C<undef> on
error.

=cut

sub height {
	Data::Vitals::Height->new($_[1]);
}

=pod

=head2 chest $circumference

The C<chest> method creates and returns a chest measurement object. For
women, this is also known as a "bust" measurement. It takes as argument
a "circumference string".

Returns a new Data::Vitals::Chest object on success, or C<undef> on
error.

=cut

sub chest {
	Data::Vitals::Chest->new($_[1]);
}

=pod

=head2 bust $circumference

The C<bust> method is an alias for the L<chest|Data::Vitals/chest> method.

=cut

sub bust {
	Data::Vitals::Chest->new($_[1]);
}

=pod

=head2 frame $circumference

The C<frame> method creates and returns a "frame" measurement object.
Mainly used for women, the frame is the circumference of the torso over the
rib cage, immediately below the breasts and specifically not included any
breast material. It takes as argument a "circumference string".

Returns a new Data::Vitals::Frame object, or C<undef> on error.

=cut

sub frame {
	Data::Vitals::Frame->new($_[1]);
}

=pod

=head2 waist $circumference

The C<waist> method creates and returns a waist measurement object. It takes
as argument a "circumference string".

Returns a new Data::Vitals::Waist object, or C<undef> on error.

=cut

sub waist {
	Data::Vitals::Waist->new($_[1]);
}	

=pod

=head2 hips $circumference

The C<hips> method creates and returns a hip measurement object. It takes
as argument a "circumference string".

Returns a new Data::Vitals::Hips object, or C<undef> on error.

=cut

sub hips {
	Data::Vitals::Hips->new($_[1]);
}

1;

=pod

=head1 TO DO

- Document the measurement classes properly

- Add more measurement classes such as Data::Vitals::Underarm

- Allow for per-measurement valid ranges, that can be tweaked if needed in
special cases.

- Add Data::Vitals::Weight

- Add Data::Vitals::Bra

- Add Data::Vitals::Dress (in the various country standards)

- Add Data::Vitals::Show (in the various country standards)

=head1 SUPPORT

Bugs should always be reported via the CPAN bug tracker

L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Data%3A%3AVitals>

For other issues, contact the maintainer.

=head1 AUTHORS

Adam Kennedy (Maintainer), L<http://ali.as/>, cpan@ali.as

Thank you to Phase N (L<http://phase-n.com/>) for permitting
the open sourcing and release of this distribution.

=head1 COPYRIGHT

Copyright (c) 2004 Adam Kennedy. All rights reserved.
This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.

=cut
