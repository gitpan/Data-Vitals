package Data::Vitals::Util;

# Utility functions for Data::Vital

use strict;
use base 'Exporter';

use vars qw{$VERSION @EXPORT_OK};
BEGIN {
	$VERSION   = '0.01';
	@EXPORT_OK = qw{cm2inch inch2cm};
}





# A pair of cm <-> inch conversion functions.
# These are specialised DWIM converters for body measurements.
# A key requirement for the integrity of the data is that the conversion
# path inch->cm->inch is always guarenteed to be the same value.
# The same is NOT true for cm->inch->cm, but since we always store and
# calculate in cm this should not be a problem.

sub cm2inch {
	my $cm = 0 + shift;

	# We round down slightly, but it should be less than a cm
	# and so not a big issue from a fitting perspective.
	my $inch = int($cm / 2.54004);

	# Support half-inches
	my $part = ($cm / 2.54004) - $inch;
	$inch += 0.5 if $part >= 0.5;

	$inch;
}

sub inch2cm {
	my $inch = 0 + shift;

	# We round up slightly, but it should be less than half an
	# inch and so not a big issue from a fitting perspective.
	my $cm = $inch * 2.54004;
	if ( $cm - int($cm) ) {
		$cm = int($cm) + 1;
	}

	$cm;
}

1;
