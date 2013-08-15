#!/usr/bin/perl

# script that reads an array of amino acid abbreviations and maps them to a MIDI mapping declared in %acid_map
# script prints to .CSV ready to be used in conjunction with MIDICSV_template.ods, content of script fills columns C - F, from row 11 onwards
# mapping uses initials of amino acids rather than 3 letter abbreviations in order that sequence to be converted can be stored as in-script array
# utilises the MIDICSV executable available at http://www.fourmilab.ch/webtools/midicsv/. If site is unavailable the code is mirrored here #MY WEBSITE

use strict;
use warnings;


# declare variables
my $files = 'seq_22.txt';

# check if the file exists
if (-f $files) {
    unlink $files
        or die "Cannot delete $files: $!";
}

# use a variable for the file handle
my $OUTFILE;

# use the three arguments version of open
# and check for errors
open $OUTFILE, '>>', $files
    or die "Cannot open $files";



my %acid_map = (

'Ala' => 60,
'Arg' => 61,
'Asn' => 62,
'Asp' => 63,
'Cys' => 64,
'Gin' => 65,
'Glu' => 66,
'Glx' => 67,
'Gly' => 68,
'His' => 69,
'Leu' => 70,
'Lys' => 71,
'Met' => 72,
'Phe' => 73,
'Pro' => 74,
'Ser' => 76,
'Thr' => 77,
'Trp' => 79,
'Tyr' => 81,
'Val' => 83
 );

my @SEQ_ID_22 = ('Gly','Ala','Gly','Gin','Gly','Gly','Tyr','Gly','Gly','Leu','Gly','Ser','Gin','Gly','Ala','Gly','Arg','Gly','Gly','Leu','Gly','Gly','Gin','Gly','Ala','Gly','Ala','Ala','Ala','Ala','Ala','Ala','Ala','Gly','Gly','Ala','Gly','Gin','Gly','Gly','Leu','Gly','Ser','Gin','Gly','Ala','Gly','Gin','Gly','Ala','Gly','Ala','Ala','Ala','Ala','Ala','Ala','Gly','Gly','Ala','Gly','Gin','Gly','Gly','Tyr','Gly','Gly','Leu','Gly','Ser','Gin','Gly','Ala','Gly','Arg','Gly','Gly','Gin','Gly','Ala','Gly','Ala','Ala','Ala','Ala','Ala','Ala','Gly','Gly','Ala','Gly','Gin','Gly','Gly','Tyr','Gly');

# 96 entities in above

# the additional sequence is too long for an array when stored using abbreviations # char limit = 2998

my $match;
my $midi_map;


foreach $match(@SEQ_ID_22) {
	$midi_map = @acid_map{$match};
	print $OUTFILE "Note_on_c,0,$midi_map,64\n";
	print $OUTFILE "Note_on_c,0,$midi_map,0\n";
}

## I want Note_on_c,0,$VALUE,64\nNote_on_c,0,$VALUE,0

#print "$midi_map\n";


# check for errors
close $OUTFILE
    or die "Cannot close $files";

#Debug the array

#foreach (@SEQ_ID_22) {
#	print "$_\n";
#}

# Debug the hash

#my $key;
#foreach $key (%acid_map)
#{
#  print "$key is $acid_map{$key}\n";
#}
