#!/bin/bash

file="/mnt/d/TechMeSkills/github-files/tms22/Credentials/instr-by3"

USERNAME=`head -1 "$file"`
USERPWD=`tail -1 "$file"`

echo ">>>>>>>>"$USERNAME"======" 
echo "^^^^^^^"$USERPWD"======="

echo "========================================="

file=$(cat "/mnt/d/TechMeSkills/github-files/tms22/Credentials/instr-by3")

for line in $file
do
    echo ">>>>>>>>>>>>>>>>>|"$line"|~~~~~~~~~~~"
done

echo "========================================="


USERNAME="ec49ce%40outlook.com"
USERPWD="4ZK3x6KA474dgWR"

echo "=="$USERNAME"==" 
echo "=="$USERPWD"=="