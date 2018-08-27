#!/bin/bash
if [ $# -ne 0 ]&&[  -s $1 ];then
   for i in `cat user.txt`
   do
     useradd $i >/dev/null
     echo "123456" | passwd --stdin $i >/dev/null
   done
else
  echo "文件为空，请重新选择文件"
  exit 3
fi
