#!/bin/bash

#set time format to print only real time of script runing
TIMEFORMAT='%3lR'

# 2>/dev/null - redirect stderr to null device
# -path "/mnt*" -prune -o - exlude /mnt* points from search, in  WSL VM 
time (find / -path "/mnt*" -prune -o -name test -type f 2>/dev/null)

#return default value
TIMEFORMAT='\nreal\t%3lR\nuser\t%3lU\nsys\t%3lS'

# resulto of script exec:
# $ bash Time_execute.sh
#
#/mnt
#/usr/bin/test
#/tmp/test
#/tmp/dir101/test
#0m1.978s
