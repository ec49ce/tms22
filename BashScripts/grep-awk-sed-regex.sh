#!/bin/bash

#save data to file 1.html
wget -O 1.html https://www.atlassian.com/continuous-delivery/continuous-integration



######################################################
#
# search and count for phrase "continuous integration"
#
######################################################

#version 1.1
#
# key -i for case insensitive search
grep -oi "continuous integration" 1.html | wc -l
# result 30

#version 1.2
curl https://www.atlassian.com/continuous-delivery/continuous-integration | grep -oi "continuous integration" | wc -l
# result 30

#version 2.1
grep -oi "continuous integration" 1.html | awk '$1 {sum++} END {print sum}'
# result 30

#version 2.2
curl https://www.atlassian.com/continuous-delivery/continuous-integration | grep -oi "continuous integration" | awk '$1 {sum++} END {print sum}'
# result 30

#version 3.1
# keys at the end of cmd '/igp'
# i - case insesitive
# g - continue search to end of input data
# p - print result  
sed -En 's/(continuous integration)/\n\1\n/igp' 1.html |  sed -En 's/(continuous integration)/\1/igp' | wc -l
# result 30

#version 3.2
curl https://www.atlassian.com/continuous-delivery/continuous-integration | sed -En 's/(continuous integration)/\n\1\n/igp' | sed -En 's/(continuous integration)/\1/igp' | wc -l
# result 30


# try to do similar command like this one (for capture only numbers): 
#
#               sed -En 's/[^0-9]*([0-9]+)[^0-9]*/\1\n/gp' 1.html
#
# but couldn't adopt it to search for only phrase "continuous integration"
#
#####################################################################################################






########################################################################
#
# replace all coincidence "continuous integration" with "CCCIII" in file
#
########################################################################

#just make copy for future use
cp -f 1.html 2.html

# add key "-i" to previous "-En" command 
sed -Ei 's/(continuous integration)/CCCIII/ig' 2.html

#
#check for change
#

#1
grep -oi "CCCIII" 2.html | wc -l
#result = 30

#2
grep -oi "continuous integration" 2.html | wc -l
# result 0