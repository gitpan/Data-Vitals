#!/usr/bin/perl -w

# Load testing for Data::Vitals

use strict;
use lib ();
use UNIVERSAL 'isa';
use File::Spec::Functions ':ALL';
BEGIN {
	$| = 1;
	unless ( $ENV{HARNESS_ACTIVE} ) {
		require FindBin;
		chdir ($FindBin::Bin = $FindBin::Bin); # Avoid a warning
		lib->import( catdir( updir(), updir(), 'modules') );
	}
}

use Test::More tests => 6;

# Does the module load
use_ok('Data::Vitals'               );
use_ok('Data::Vitals::Util'         );
use_ok('Data::Vitals::Circumference');
use_ok('Data::Vitals::Waist'        );
use_ok('Data::Vitals::Hips'         );
use_ok('Data::Vitals::Chest'        );

exit(0);
