#!/bin/bash
#
filesdir=$1
searchstr=$2

if [ $# -eq 2 ];
then
	echo "filesdir = $filesdir and searchstr = ${searchstr}"
else
	echo "expected 2 params, provided $# !"
	exit 1
fi

if [ ! -d $filesdir ]
then
	echo "$filesdir is not a directory!"
	exit 1
fi

filenumber=$(ls -alR $filesdir | grep ^- | wc -l)
matchesnumber=$(grep -r $searchstr $filesdir/* | wc -l)
echo "The number of files are $filenumber and the number of matching lines are $matchesnumber"

