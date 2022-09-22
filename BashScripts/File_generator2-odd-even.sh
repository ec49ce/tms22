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
 let rnd=($RANDOM % 9 + 1)
 echo $rnd
}


##################
# gen files in dir
##################
function genFiles
{

	local flsCnt=4+$(getRandomNumber)

        for (( i=1; i<=$flsCnt; i++))
                do
                local flName=("fileName"$i)
                echo -n > $1/$flName
                done
}

################
# gen dir
################
function genDirs
    {
	if [[ ! -d $1/myDir$3-$2 ]]
	then
        mkdir $1/myDir$3-$2
	    #genFiles $1/myDir$3-$2 $3
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
    echo "create parent dir"
    mkdir -p ${ParentDir}
else
    echo "clean parent dir"
    rm -r ${ParentDir}

    echo "create parent dir"
    mkdir -p ${ParentDir}
fi

#
# generating Tree and fill it with files
#
echo "gen tree"

while [[ $CurDepth -le MaxDepth ]]
	do
        echo "CurDepth=$CurDepth"

		find ${ParentDir}"/" -mindepth $(( $CurDepth - 1 )) -type d -print0 | while read -d $'\0' dir
			do

				dirCnt=$(getRandomNumber)

	        		for (( d=1; d<=$dirCnt; d++))
        	        		do
                				genDirs $dir $d $CurDepth
                			done

			done

        	((CurDepth=$CurDepth+1))

	done


echo "gen files"

find ${ParentDir}"/" -type d -print0 | while read -d $'\0' dir
    do
            genFiles $dir
    done



echo "fill files with odd/even"

find ${ParentDir}"/" -type d -print0 | while read -d $'\0' dir 
    do
           
           find $dir -maxdepth 1 -type f -print0 | while read -d $'\0' filename 
            do
                let filesInDirCnt+=1
                
                if [ $(($filesInDirCnt % 2)) -eq 0 ];
                    then 
                        echo "even - $filename" > $filename
                    else
                        echo "odd - $filename" > $filename
                fi

            done
            

    done
