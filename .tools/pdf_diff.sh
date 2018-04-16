#!/bin/sh

if [ -e `which diffpdf` ]
then
	diffpdf "$1" "$2"
else
	# @See https://www.evilmadscientist.com/2011/improving-open-source-hardware-visual-diffs/

	A=`tempfile -s .png`
	B=`tempfile -s .png`
	C=`tempfile -s .png`

	convert -density 150x150 +antialias -negate $1 $A
	convert -density 150x150 +antialias -negate $2 $B
	composite -stereo 0 $A $B $C 
	display -title "$1" $C

	rm $A $B $C
fi

