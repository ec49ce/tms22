#!/bin/bash
echo
echo "                   read file with EoL=\r\n"
echo "========================================================================="
echo
file="/mnt/d/TechMeSkills/github-files/tms22/Credentials/instr-by3"

USERNAME=`head -1 "$file"`
USERPWD=`tail -1 "$file"`

echo ">>>>>>>>"$USERNAME"======" 
echo "^^^^^^^^"$USERPWD"======="


echo
echo
echo "                   read file with EoL=\n"
echo "========================================================================="
echo


file="/mnt/d/TechMeSkills/github-files/tms22/Credentials/instr-by2"

USERNAME=`head -1 "$file"`
USERPWD=`tail -1 "$file"`

echo ">>>>>>>>"$USERNAME"======" 
echo "^^^^^^^^"$USERPWD"======="


echo
echo
echo
echo

echo "========================================="
echo "========================================="
echo "========================================="



file=$(cat "/mnt/d/TechMeSkills/github-files/tms22/Credentials/instr-by3")

for line in $file
do
    echo ">>>>>>>>>>>>>>>>>|"$line"|~~~~~~~~~~~"
done

echo "========================================="


file=$(cat "/mnt/d/TechMeSkills/github-files/tms22/Credentials/instr-by2")

for line in $file
do
    echo ">>>>>>>>>>>>>>>>>|"$line"|~~~~~~~~~~~"
done

echo "========================================="