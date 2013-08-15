#!/usr/bin/perl

# script that reads an array of amino acid abbreviations and maps them to a MIDI mapping declared in %acid_map
# script prints to .CSV ready to be used in conjunction with MIDICSV_template.ods, content of script fills columns C - F, from row 11 onwards
# mapping uses initials of amino acids rather than 3 letter abbreviations in order that sequence to be converted can be stored as in-script array
# utilises the MIDICSV executable available at http://www.fourmilab.ch/webtools/midicsv/. If site is unavailable the code is mirrored here #MY WEBSITE

use strict;
use warnings;


# declare variables
my $files = 'seq21.txt';

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

'A' => 60,
'R' => 61,
'N' => 62,
'D' => 63,
'C' => 64,
'Q' => 65,
'E' => 66,
'Z' => 67,
'G' => 68,
'H' => 69,
'L' => 70,
'K' => 71,
'M' => 72,
'F' => 73,
'P' => 74,
'S' => 76,
'T' => 77,
'W' => 79,
'Y' => 81,
'V' => 83
 );

my @SEQ_ID_21 = ('G','A','G','R','G','G','Q','G','A','G','A','A','A','A','A','A','G','G','A','G','Q','G','G','Y','G','G','L','G','S','Q','G','A','G','R','G','G','L','G','G','Q','G','A','G','A','A','A','A','A','A','A','G','G','A','G','Q','G','G','L','G','S','Q','G','A','G','Q','G','A','G','A','A','A','A','A','A','G','G','A','G','Q','G','G','Y','G','G','L','G','S','Q','G','A','G','Q','G','G','Y','G','G','L','G','S','Q','G','A','G','R','G','G','Q','G','A','G','A','A','A','A','A','A','G','G','A','G','Q','G','G','Y','G','G','L','G','S','Q','G','A','G','R','G','G','L','G','G','Q','G','A','G','A','A','A','A','A','A','A','G','G','A','G','Q','G','G','L','G','S','Q','G','A','G','Q','G','A','G','A','A','A','A','A','A','G','G','A','G','Q','G','G','Y','G','G','L','G','S','Q','G','A','G','Q','G','G','Y','G','G','L','G','S','Q','G','A','G','R','G','G','Q','G','A','G','A','A','A','A','A','A','G','G','A','G','Q','G','G','Y','G','G','L','G','S','Q','G','A','G','R','G','G','L','G','G','Q','G','A','G','A','A','A','A','A','A','A','G','G','A','G','Q','G','G','L','G','S','Q','G','A','G','Q','G','A','G','A','A','A','A','A','A','G','G','A','G','Q','G','G','Y','G','G','L','G','S','Q','G','A','G','Q','G','G','Y','G','G','L','G','S','Q','G','A','G','R','G','G','Q','G','A','G','A','A','A','A','A','A','G','G','A','G','Q','G','G','Y','G','G','L','G','S','Q','G','A','G','R','G','G','L','G','G','Q','G','A','G','A','A','A','A','A','A','A','G','G','A','G','Q','G','G','L','G','S','Q','G','A','G','Q','G','A','G','A','A','A','A','A','A','G','G','A','G','Q','G','G','Y','G','G','L','G','S','Q','G','A','G','Q','G','G','Y','G','G','L','G','S','Q','G','A','G','R','G','G','Q','G','A','G','A','A','A','A','A','A','G','G','A','G','Q','G','G','Y','G','G','L','G','S','Q','G','A','G','R','G','G','L','G','G','Q','G','A','G','A','A','A','A','A','A','A','G','G','A','G','Q','G','G','L','G','S','Q','G','A','G','Q','G','A','G','A','A','A','A','A','A','G','G','A','G','Q','G','G','Y','G','G','L','G','S','Q','G','A','G','Q','G','G','Y','G','G','L','G','S','Q','G','A','G','R','G','G','Q','G','A','G','A','A','A','A','A','A','G','G','A','G','Q','G','G','Y','G','G','L','G','S','Q','G','A','G','R','G','G','L','G','G','Q','G','A','G','A','A','A','A','A','A','A','G','G','A','G','Q','G','G','L','G','S','Q','G','A','G','Q','G','A','G','A','A','A','A','A','A','G','G','A','G','Q','G','G','Y','G','G','L','G','S','Q','G','A','G','Q','G','G','Y','G','G','L','G','S','Q');

my $match;
my $midi_map;


foreach $match(@SEQ_ID_21) {
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
