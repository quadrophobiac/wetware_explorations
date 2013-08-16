## script that converts input video to plain text ascii frames, including perl script that concatenates scripts into CSV file
## code derived from fantastic work conducted by Stariocek http://stariocek.asuscomm.com/

vid="folding.avi" ; #change file name as appropriate

ffmpeg -i $vid -r 10 -f image2 -sameq -vcodec mjpeg %03d.jpg; # change r value to increase frames captured

for f in *.jpg; do  j=`echo $i | cut -d . -f 1`;  jp2a --width=102 --chars="   .%*+-:;acgt<=>@[\]^" $f > "${f%.jpg}.txt";done 
# chars enclosed subsequent to --chars= " ___ " are the chars which jp2a will use when converting image to ascii

ls *.txt > filelist.txt;

perl readwrite.pl;
