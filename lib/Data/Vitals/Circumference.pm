package Data::Vitals::Circumference;

# Data::Vitals::Circumference is a base class for the set of measurements
# that include bust/hips/waist/etc and are generally expressed in cm or
# inches.

use strict;
use Data::Vitals::Util ();

use vars qw{$VERSION};
BEGIN {
	$VERSION = '0.01';
}

use overload 'bool' => sub () { 1 };
use overload '""'   => 'as_string';





#####################################################################
# Constructor

sub new {
	my $class = ref $_[0] || $_[0];
	my $value = defined $_[1] ? lc $_[1] : return undef;
	$value =~ s/\s+//g;

	# Metric "123cm" or "123.5cm" or "123c"
	if ( $value =~ /^(\d{2,3}(?:\.5)?)(?:c|cm|cms)$/ ) {
		my $cm = $1 + 0;
		unless ( $cm > 10 and $cm < 400 ) {
			# Impossibly out of range
			return undef;
		}
		return bless { value => $cm }, $class;
	}

	# Imperial '30"' or '30.5"' or '30i' or '30inchs'
	if ( $value =~ /^(1?\d{1,2}(?:\.5)?)(?:\"|i|in|inc|inch|inchs|inches)$/ ) {
		my $inch = $1 + 0;
		unless ( $inch > 3 and $inch < 120 ) {
			# Impossibly out or range
			return undef;
		}
		my $cm = Data::Vitals::Util::inch2cm($inch) or return undef;
		return bless { value => $cm }, $class;
	}

	# Anything else
	undef;
}

# Generic string form, which is currently set in inches.
# Normally, given the American bias in programming, I would have done
# this as inches. However there is a long term trend towards
# metrification, and from a support issue it is better to be a bit more
# aggressive and use standard units by default earlier, rather than be
# stuck with a default string form that nobody uses in future years.
sub as_string { shift->as_cms }

# String form in cm
sub as_cms { $_[0]->{value} . 'cm' }

# String form in inches
sub as_inches { Data::Vitals::Util::cm2inch($_[0]->{value}) . '"' }

1;
