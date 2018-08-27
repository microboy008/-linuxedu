#!/bin/bash
yum repolist && yum -y install vsftpd &> /dev/null
cp /etc/vsftpd/vsftpd.conf{,.bak}
sed -ir '/^#anon/s/^#//' /etc/vsftpd/vsftpd.conf 
chmod 777 /var/ftp/pub &>/dev/null
systemctl enable vsftpd  &>/dev/null
systemctl restart vsftpd &> /dev/null


