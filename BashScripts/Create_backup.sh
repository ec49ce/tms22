#!/bin/bash

#prepare:
#mkdir -p /tmp/dir-with-data-to-be-backup/{dir111,dir222,dir33}
#mkdir /tmp/dir-with-backups
#cd /tmp/dir-with-backups

#view arch files
#tar -tf backup.tar


if [ $# -eq 3 ]
then

    echo "source to backup (param #1): "$1
    echo "destination dir (param #2): "$2
    echo "backups cnt limints (param #3): "$3

    SoureToBackup=$1

    BackupName=$2/"backup_data_"`date +%Y%m%d_%H%M%S_%3N`".tar"

    BackupLimit=$3

    echo "SoureToBackup: "$SoureToBackup
    echo "BackupName: "$BackupName
    echo "BackupLimit: "$BackupLimit
    echo 

    if tar cvf ${BackupName} ${SoureToBackup}
    then
        BackupsCnt=`ls /tmp/dir-with-backups | wc -l`

        if [ ${BackupsCnt} -gt $BackupLimit ]
        then
            FileNameToBeRemove=`ls -1 | head -1`
            rm ${FileNameToBeRemove}
        fi

        exit 0

    else

        exit 255

    fi

else
    echo "ERROR: Not enough params! (Need 3 params)"
    exit 255
fi
