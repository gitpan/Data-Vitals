package Data::Vitals::Height;

# The standard measurement of height.

use strict;
use Data::Vitals::Util ();

use vars qw{$VERSION};
BEGIN {
	$VERSION = '0.02';
}

use overload 'bool' => sub () { 1 };
use overload '""'   => 'as_string';





#####################################################################
# Constructor

sub new {
	my $class = ref $_[0] || $_[0];
	my $value = defined $_[1] ? lc $_[1] : return undef;
	$value =~ s/^\s+//g;
	$value =~ s/\s+$//g;

	# Basic metric
	if ( $value =~ /^(\d{2,3}(?:\.5)?)(?:c|cm|cms)?$/ ) {
		my $cm = 0 + $1;
		unless ( $cm > 30 and $cm < 300 ) {
			# Impossibly out of range
			return undef;
		}
		return bless { value => $cm }, $class;
	}

	# Basic imperial
	if ( $value =~ /^(\d)(?:\'|\s)(\d{1,2}(?:\.5)?)\"?$/ ) {
		my $feet = 0 + $1;
		my $inch = 0 + $2;
		unless ( $feet >= 1 and $feet <= 8 ) {
			# Impossibly out of range
			return undef;
		}
		unless ( $inch >= 0 and $inch < 12 ) {
			# Illegal value
			return undef;
		}

		# Convert to cm
		my $cm = Data::Vitals::Util::inch2cm($feet * 12 + $inch) or return undef;
		return bless { value => $cm }, $class;
	}

	# Anything else
	undef;
}

# Generic string form, which is currently set to cms.
# Normally, given the American bias in programming, I would have done
# this as feet and inches. However there is a long term trend towards
# metrification, and from a support issue it is better to be a bit more
# aggressive and use standard units by default earlier, rather than be
# stuck with a default string form that nobody uses in future years.
sub as_string { shift->as_metric }

# Metric is cms
sub as_metric { shift->as_cms }

# Imperial is feet
sub as_imperial { shift->as_feet }

# String form in cm
sub as_cms { $_[0]->{value} . 'cm' }

# String form in inches
sub as_feet {
	my $inch = Data::Vitals::Util::cm2inch($_[0]->{value});
	my $feet = int($inch / 12);
	$inch = $inch % 12;
	"$feet'$inch\"";
}

1;
