#!/bin/bash
while :
do
cout=$[RANDOM%43+1]
clear
sed -n ''"$cout"'p' names.txt
sleep 0.5
done
