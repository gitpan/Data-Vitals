package Data::Vitals::Chest;

# A measurement around the chest.
# For women, this is also the "bust" measurement.

use strict;
use base 'Data::Vitals::Circumference';

use vars qw{$VERSION};
BEGIN {
	$VERSION = '0.01';
}

1;
