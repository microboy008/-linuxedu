#!/bin/bash
<<<<<<< HEAD
slfkjslakj
=======
#test
>>>>>>> 4d5d0439f5ab630b09eaac2f84f49fd34dd50f90
password=""
origin="zxcvbnmasdfghjklqwertyuiopQWERTYUIOPASDFGHJKLZXCVBNM1234567890"
for i in `seq $1`
do
  len=$[RANDOM%62]
  tmp=${origin:len:1}
  password=$password$tmp
done
echo $password
