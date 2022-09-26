#!/bin/bash
clear

#
#declare array with name "matrix"
#
declare -A matrix

num_rows=6
num_columns=4

#
#fill matrix by random values
#
for ((i=1;i<=$num_rows;i++)) do
    for ((j=1;j<=$num_columns;j++)) do
        matrix[$i,$j]=$(($RANDOM % 99 + 1))
    done
done

#format string #1
f1="%3s|"

#format string #2
# with 9 sinmbols width
f2=" %3s"

printf "\n\n\n"

#print header with columns No.
printf "$f1" ''
for ((j=1;j<=$num_columns;j++)) do
    printf "$f2" $j
done
printf "\n"

printf "$f1" ''
for ((j=1;j<=$num_columns;j++)) do
    printf "$f2" "___"
done
printf "\n"

#print array
for ((i=1;i<=num_rows;i++)) do

    #print row No
    printf "$f1" $i

    for ((j=1;j<=num_columns;j++)) do

        #print value by address [$i,$j]
        printf "$f2" ${matrix[$i,$j]}

    done

    printf "\n"
done
printf "\n\n\n"
