#!/usr/bin/env perl
# read and concatenate char by char

use strict;
use warnings;

open FILE, ">>test.csv" or die $!; # write ascii content to CSV for inclusion within macro enabled xls

my $file = "filelist.txt";
open (FH, "< $file") or die "Can't open $file for read: $!";
my @files = <FH>;
close FH or die "Cannot close $file: $!";

my $passfile;
foreach $passfile (@files) {

	#my $filename = $passfile;

	open (my $fh, $passfile)
		or die "could not open file '$passfile' $!";

	my $entry = ',,,,,,,,,,,,,,,,"'; # this accounts for all the rows which precede the hidden column in the excel sheet

	while (<$fh>) {
    	#split line in a char array
    		my @chars = split //;
    
    		my $char;
    		#loop char by char
    		for $char(@chars) { 
			$entry .= $char;
		}
	}
	print FILE "$entry\"";
	close($passfile);

}

close FILE;
