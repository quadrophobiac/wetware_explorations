The scripts here were used to experiment with granular synthesis and genetic data. It aimed to transform the sounds of goats bellowing (the man goat meme) with the genetic data extracted from the spider silk protein (which was introduced into transgenic goats to produce goats milk laced with spider silk) - more here http://www.stephenfortune.net/gran-synthbio-goats/

.pl scripts read an array of amino acid abbreviations and maps them to a MIDI mapping declared in %acid_map

script prints to .CSV ready to be used in conjunction with MIDICSV_template.ods, content of script fills columns C - F, from row 11 onwards


mapping uses initials of amino acids rather than 3 letter abbreviations in order that sequence to be converted can be stored as in-script array

utilises the MIDICSV executable available at http://www.fourmilab.ch/webtools/midicsv/