#!/bin/bash

####################################################################################################################
#
# run example:
# 		clear; bash ~/File_generator2.sh /tmp/P7777 3; tree /tmp/P7777
#

#####################################
# generate random number from 1 to 10
#####################################
function getRandomNumber() {
 let rnd=($RANDOM % 10 + 1)
 echo $rnd
}


##################
# gen files in dir
##################
function genFiles(){

	local flsCnt=$(getRandomNumber)

        for (( i=1; i<=$flsCnt; i++))
                do
                echo -n > $1"/fileName"$i
                done
}

################
# gen dir
################
function genDirs
    {
	if [[ ! -d $1/myDir$2 ]]
	then
        mkdir $1/myDir$2
	#genFiles $1/myDir$2
	fi
}


####################################################################################################################

CurDepth=1
MaxDepth=$2

ParentDir=$1

# check if parent dir doesn`t exists
# create it
# else remove and create new one
if  [ ! -d ${ParentDir} ]
then
    mkdir -p ${ParentDir}
else
    rm -r ${ParentDir}
    mkdir -p ${ParentDir}
fi

#
# generating Tree
#
while [[ $CurDepth -le MaxDepth ]]
	do

		find ${ParentDir}"/" -mindepth $(( $CurDepth - 1 )) -type d -print0 | while read -d $'\0' dir
			do

				dirCnt=$(getRandomNumber)

	        		for (( d=1; d<=$dirCnt; d++))
        	        		do
                				genDirs $dir $d
                			done

			done

        	((CurDepth=$CurDepth+1))

	done

#
# fill Tree with files
#
find ${ParentDir}"/" -type d -print0 | while read -d $'\0' dir
	do

         genFiles $dir

        done
