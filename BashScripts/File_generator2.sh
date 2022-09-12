#!/bin/bash

####################################################################################################################
####################################################################################################################
####################################################################################################################

#####################################
# generate random number from 1 to 10
#####################################
function getRandomNumber() {
 let rnd=($RANDOM % 10 + 1)
 echo $rnd
}


##########################
# gen files in working dir
##########################
function genFiles(){

	local flsCnt=$(getRandomNumber)

        for (( i=1; i<=$flsCnt; i++))
                do
                echo -n > $1"/fileName"$i
                done
}

#########################
# gen dirs in working dir
#########################
function genDirs
    {
	if [[ ! -d $1/myDir$2 ]]
	then
        mkdir $1/myDir$2
	genFiles $1/myDir$2
	fi
}



####################################################################################################################
####################################################################################################################
####################################################################################################################

CurDepth=1
MaxDepth=$2

ParentDir=$1

# check if parent dir doesn`t exists
# create it
# else remove and create
if  [ ! -d ${ParentDir} ]
then
    mkdir -p ${ParentDir}
else
    rm -r ${ParentDir}
    mkdir -p ${ParentDir}
fi

#cd ${ParentDir}

genFiles ${ParentDir}


while [[ $CurDepth -le MaxDepth ]]
	do

		find ${ParentDir}"/" -type d -print0 | while read -d $'\0' dir
			do

				dirCnt=$(getRandomNumber)

	        		for (( d=1; d<=$dirCnt; d++))
        	        		do
                				genDirs $dir $d
                			done

			done

        	((CurDepth=$CurDepth+1))

	done
