#!/bin/sh
# set -x

if [ ! -e `which eeplot` ]
then
	echo "Eeplot must be installed on the system"
	exit 1
fi

A=`tempfile -s .png`
B=`tempfile -s .png`

eeplot -o $A $1
eeplot -o $B $2

.tools/image_diff.sh $A $B

