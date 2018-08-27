#!/bin/bash
num=`yum repolist |awk -F : '/repolist/{print $2}'|sed  's/,//'`
[ $num -gt 3000 ] &&  yum -y install gcc openssl-devel pcre-devel &>/dev/null
tar -xf nginx-1.12.2.tar.gz && cd nginx-1.12.2
./configure &>/dev/null
make &>/dev/null
make install &>/dev/null
[ -d /usr/local/nginx/conf ] && [ -d /usr/local/nginx/sbin ]&&echo "nginx ok!"












