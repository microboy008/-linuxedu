#!/bin/bash

for ((i=13;i<=13;i++))
do
   for ((j=1;j<255;j++))
     do
    { 
     ping -c2 -i0.3 -W1 176.204.$i.$j &>/dev/null  
     if [ $? -eq 0 ];then
        echo "176.204.$i.$j is up"
        #ssh 176.204.$i.$j
     #else
       # echo "176.204.$i.$j is down"
     fi
     } &
done
done
wait
