#!/bin/bash
#
writefile=$1
writestr=$2

if [ $# -ne 2 ];
then
        echo "expected 2 params, provided $# !"
        exit 1
fi

#if [ "/" != $(grep -o ^/ <<< ${writefile}) ];
if [ ! $(grep -o ^/ <<< ${writefile}) ];
then
	echo "$writefile has no absolute path!"
	exit 1
fi	

checkdir=$(grep -o ".*/" <<< $writefile)
mkdir -p $checkdir

$(echo $writestr > $writefile)

if [ ! -f $writefile ];
then
	echo "$writefile could not be written!"
	exit 1
fi	

