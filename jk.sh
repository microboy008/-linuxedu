#!/bin/bash
uptime |awk '{print $8,$9,$10}'|awk -F , '{print $1,$2,$3}'
ifconfig eth0 |awk '/RX pa/{print $5"B"}'
free -h |awk '/Mem/{print $4}'
df -h |awk '$6=="/"{print $4}'
cat /etc/passwd|wc -l
who |wc -l
ps aux|wc -l
rpm -qa |wc -l
