#!/usr/bin/perl -w

# Unit testing for Data::Vitals::Chest

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

use Test::More tests => 4;
use Data::Vitals::Chest;





#####################################################################
# Constructor

my $Hip = Data::Vitals::Chest->new('38"');
isa_ok( $Hip, 'Data::Vitals::Chest' );
is( $Hip->as_string, '97cm', 'Returned correct string form' );
is( $Hip->as_cms,    '97cm', 'Returned correct cm size'     );
is( $Hip->as_inches, '38"',  'Returned original size'       );

exit(0);