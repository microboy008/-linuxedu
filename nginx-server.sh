#!/bin/bash
st(){
netstat -anput|grep -q nginx  &&echo "nginx is running"|| echo "nginx is not run"
}
[ $# -ne 2 ] &>/dev/null&&echo -e "\033[31m本脚本只支持NGINX,usage:$0 start|restart|stop|status nginx\033[0m"&&exit 3
case $1 in 
start)
 /usr/local/nginx/sbin/nginx
st;;
restart)
/usr/local/nginx/sbin/nginx -s stop &>/dev/null
sleep 1
/usr/local/nginx/sbin/nginx 
st;;
stop)
/usr/local/nginx/sbin/nginx -s stop &>/dev/null
st;;
status)
st;;
*)
echo -e "\033[31m error!!!!!!!!
usage:$0 start|restart|stop|status nginx\033[0m";;
esac






