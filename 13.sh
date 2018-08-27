#!/bin/bash
ssh(){
expect << EOF
 spawn ssh -o StrictHostKeyChecking=no $1
 expect "yes/no" {send "yes\r"}
 expect "password" {send "Taren1\r"}
 expect "#" {send "wall 晚上不吃鸡\r"} 
 expect "#" {send "exit\r"}
 expect "#" {send "exit\r"}
EOF
}

for i in `seq 254`
 do
{
 ip=176.204.15.$i 
 [ $i != "41" ] &&  ping -c 2 -i 0.3 -W 1 $ip 
 if [ $? -eq 0 ];then
 ssh $ip
 fi
  }&
 done
