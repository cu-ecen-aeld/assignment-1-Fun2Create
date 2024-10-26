#!/bin/bash
#
filesdir=$1
searchstr=$2

if [ $# -eq 2 ];	#ensure correct nr of parameters
then
	echo "filesdir = $filesdir and searchstr = ${searchstr}"
else
	echo "expected 2 params, provided $# !"
	exit 1
fi

if [ ! -d $filesdir ]	#test -d - true only if directory
then
	echo "$filesdir is not a directory!"
	exit 1
fi

filenumber=$(ls -alR $filesdir | grep ^- | wc -l)	#ls: -a - all files, -l - long/1 line per file, R - recursive; grep for lines with 1st char "-"; wc -l - count lines
matchesnumber=$(grep -r $searchstr $filesdir/* | wc -l)	#grep -r - get recursive all lines with string; wc -l - count lines
echo "The number of files are $filenumber and the number of matching lines are $matchesnumber"

