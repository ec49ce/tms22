#!/bin/bash
clear

cnt=0
for ((i=1;i<=3;i++)) do
    
    #print row No 
    echo $cnt

    for ((j=1;j<=4;j++)) do

        let cnt++ 
    
    done

done

echo $cnt

