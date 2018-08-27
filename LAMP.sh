#!/bin/bash
#RHEL7专用
yum makecache &> /dev/null
num=$( yum repolist | awk '/repolist/{print $2}' | sed 's/,//' )
if [ $num -ne 0 ];then
  yum -y install httpd 
  yum -y install mariadb mariadb-server mariadb-devel
  yum -y install php php-mysql
else
  echo "未配置yum源"
fi
