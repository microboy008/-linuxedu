#!/bin/bash
expect << EOF
 [ $i != 41 ]&&ping -c2 -i0.3 -W1 176.204.15.$i
 if [ $? -eq 0 ];then
 spawn ssh 176.204.15.$i
 sleep 2
 expect "yes/no" {send "yes"\r}
 expect "password" {send "Taren1\r"}
 expect "#" {send "touch /root/Desktop/test.txt\r"} 
 expect "#" {send "exit\r"}
  fi
EOF

