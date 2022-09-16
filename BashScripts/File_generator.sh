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
                local flName=("fileName"$i)
                echo -n > $flName
                done
}

#########################
# gen dirs in working dir
#########################
function genDirs
    {
        mkdir myDir$1
        cd myDir$1

	genFiles

        ((CurDepth=$CurDepth + 1))

        if [ $CurDepth -le $MaxDepth ]; then
            genDirs
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

cd ${ParentDir}

genFiles

dirCnt=$(getRandomNumber)

for ((d=1; d<=$dirCnt; d++))
	do
        genDirs $d
	cd ${ParentDir}
	CurDepth=1
	done
