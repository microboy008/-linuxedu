#!/bin/bash
while :
do
clear
line=$(sed -n "$=" $1)
num=$[RANDOM%line+1]
sed -n "${num}p" $1
sleep 1
done
