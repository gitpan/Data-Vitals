package Data::Vitals::Underarm;

# A measurement around the torso under the arms, and above the breasts.
# For women, this is one of the measurements used to determine bra size.

use strict;
use base 'Data::Vitals::Circumference';

use vars qw{$VERSION};
BEGIN {
	$VERSION = '0.02';
}

1;
