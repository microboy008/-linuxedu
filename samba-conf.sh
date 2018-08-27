#!/bin/bash
#samba服务端安装配置,创建与主机名同名的共享文件夹，guest用户读权限，admin读写权限；
#auth:tsm
#date:2018-07-12
rpm -q samba
if [ $? -ne 0 ];then
  yum -y install samba
fi
firewall-cmd --add-service=samba
firewall-cmd --add=service=samba-client
setsebool -P samba_export_all_ro=on
setsebool -P samba_export_all_rw=on
mkdir /${HOSTNAME}
chmod o=rwx /${HOSTNAME}
if [ -f /etc/samba/smb.conf ];then
    cp /etc/samba/smb.conf /etc/samba/smb.conf.bak
    
    echo "[${HOSTNAME}-share]
      path = /${HOSTNAME}
      write list = admin"   >> /etc/samba/smb.conf
fi

useradd guest
useradd admin
for i in {guest,admin}
do
pdbedit -a $i<<EOF
123456
123456
EOF
done
      
systemctl restart smb
if [ $? -eq 0 ];then
  echo -e "\e[\0;31m samba is ok!!\e[0m"
fi






















