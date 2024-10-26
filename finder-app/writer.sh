#!/bin/bash
#
writefile=$1
writestr=$2

if [ $# -ne 2 ];	#request exactly 2 arguments
then
        echo "expected 2 params, provided $# !"
        exit 1
fi

#if [ "/" != $(grep -o ^/ <<< ${writefile}) ];	#alternative to next line, variant with string-compare
if [ ! $(grep -o ^/ <<< ${writefile}) ];	#input name of writefile (string) to grep, check if it starts with "/" - better alternative to previous line
then
	echo "$writefile has no absolute path!"
	exit 1
fi	

checkdir=$(grep -o ".*/" <<< $writefile)	#remove filename after last "/" in writefile to store only directory-path in checkdir
mkdir -p $checkdir				#mkdir -p to create dir only if not already existing, else proceed without error 

$(echo $writestr > $writefile)			# >- write file, overwrite if it exists

if [ ! -f $writefile ];				# test -f - verify filecreation
then
	echo "$writefile could not be written!"
	exit 1
fi	

