#!/bin/bash

##############################
#
#  proces count
#
##############################

echo -e "current user name: "$USER

let ProcCnt=(`ps -U ${USER} | wc -l` - 1)

echo -e "process count by running under current user: "${ProcCnt}"\n\n"




##############################
#
#  cpu usage
#
##############################


#prep for testing cpu usage:
# instal stress:
#    sudo apt-get install stress
# run stress:
#    sudo stress --cpu  8 --timeout 10

let CpuUtil=(100 - `vmstat 1 2|tail -1|awk '{print $15}'`)
echo -e "CPU usage, %: "${CpuUtil}"\n\n"





##############################
#
#  Memory sum
#
##############################

MemTotal=`free | grep Mem | awk '{print $2}'`
echo -e "Total memory:\n\tbytes\t"$(( $MemTotal * 1024 ))"\n\tkilobytes\t"$(( $MemTotal ))"\n\tmegabytes\t"$(( $MemTotal/1024 ))"\n\n"



##############################
#
#  Open port statistic
#
##############################

PortNo=$1

if [[ $PortNo=~[0..9]+ ]]
then
    regex="/"$PortNo"$/"
    ConnctCnt=`ss -n | awk 'match($5, /[0-9]+$/) {print substr($5, RSTART, RLENGTH)}' | sort | uniq -c | sort -n | grep ${PortNo} | awk '{print $1}'`
    echo -e "Connections count for port "$PortNo": "$ConnctCnt"\n\n"
else
    echo "Connection count by ports: "
    ss -n | awk 'match($5, /[0-9]+$/) {print substr($5, RSTART, RLENGTH)}' | sort | uniq -c | sort -n
    echo -e "\n\n"
fi



##############################
#
#  Total disks size
#
##############################

DisksSize=`lsblk -b -o TYPE,SIZE | awk '$1=="disk" {sum+=$2} END {print sum}'`

echo -e "Total disks size: \n\tbyte\t"$DisksSize"\n\tkillobyte\t"$(( $DisksSize/1024 ))"\n\tgigabyte\t"$(( $DisksSize/1024/1024/1024 ))"\n\n"
