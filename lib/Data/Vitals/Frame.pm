package Data::Vitals::Frame;

# A measurement around the torso, immedatiely below and not including the
# breasts.
# For women, this is one of the measurements used to determine bra size.

use strict;
use base 'Data::Vitals::Circumference';

use vars qw{$VERSION};
BEGIN {
	$VERSION = '0.01';
}

1;
