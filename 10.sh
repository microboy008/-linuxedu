#!/bin/bash
#test
password=""
origin="zxcvbnmasdfghjklqwertyuiopQWERTYUIOPASDFGHJKLZXCVBNM1234567890"
for i in `seq $1`
do
  len=$[RANDOM%62]
  tmp=${origin:len:1}
  password=$password$tmp
done
echo $password
