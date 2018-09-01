#!/bin/bash
arr=(`cat names.txt`)
while :
do
num1=$[RANDOM%21]
num2=$[RANDOM%21]
num3=$[ num1 + num2 ]
clear
echo $num3 $num1 $num2  ${arr[$num3]}
sleep 0.08
done
