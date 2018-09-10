#!/bin/bash
systemctl stop mariadb
systemctl disable mariadb
rm -rf /etc/my.conf
rm -rf /var/log/mysql
yum -y install perl-Data-Dumper perl-JSON perl-Time-HiRes
cd /root/mysql
tar -xf mysql-5.7.17.tar
rpm -Uvh mysql-community-*.rpm

