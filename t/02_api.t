#!/usr/bin/perl -w

# Basic first pass API testing for Data::Vitals

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

use Test::More 'tests' => 43;
use Test::ClassAPI;

# Load the API to test
use Data::Vitals;

# Execute the tests
Test::ClassAPI->execute('complete', 'collisions');
exit(0);

# Define the API
__DATA__

Data::Vitals=class
Data::Vitals::Util=class
Data::Vitals::Circumference=class
Data::Vitals::Hips=class
Data::Vitals::Waist=class
Data::Vitals::Chest=class

[Data::Vitals]
hips=method
waist=method
chest=method
bust=method

[Data::Vitals::Util]
inch2cm=method
cm2inch=method

[Data::Vitals::Circumference]
new=method
as_string=method
as_cms=method
as_inches=method

[Data::Vitals::Hips]
Data::Vitals::Circumference=isa

[Data::Vitals::Waist]
Data::Vitals::Circumference=isa

[Data::Vitals::Chest]
Data::Vitals::Circumference=isa