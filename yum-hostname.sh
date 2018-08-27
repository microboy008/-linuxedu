#!/bin/bash
rm -rf /etc/yum.repos.d/* &> /dev/null
echo "
[dvd]
name=dvd
baseurl=http://192.168.4.254/rhel7
gpgcheck=0"     > /etc/yum.repos.d/dvd.repo
yum clean all &>/dev/null 
yum repolist &>/dev/null
if [ $? -eq 0 ];then
   echo -e "\e[0;31m yum is ok !\e[0m"
fi

#echo "$1" > /etc/hostname
#hostnamectl set-hostname $1
#echo -e "\e[0;31m hostname is ok !\e[0m"
