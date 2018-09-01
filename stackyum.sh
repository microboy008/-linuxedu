#!/bin/bash
file="/var/www/html/rhel7-sp/"
for i in `find $file -maxdepth 1 -name "*rpms"`
do
name=${i##*/}
echo "[$name]
name=$name
baseurl=http://192.168.4.254/rhel7-sp/$name
gpgcheck=0" >> openstack.repo

done

