!#/bin/bash
#sed -i '9a\server 192.168.4.254 iburst' /etc/chronyd.conf    //时间同步设置
for i in host51 host52 host53;do scp /etc/chrony.conf $i:/etc/chrony.conf;ssh $i "systemctl restart chronyd";done
yum -y install ceph-deploy
[ -d /root/ceph-cluster ] && rm -rf /root/ceph-cluster/* || mkdir ceph-cluster
cd /root/ceph-cluster/
ceph-deploy purge host51 host52 host53
ceph-deploy purgedata host51 host52 host53
ceph-deploy uninstall host51 host52 host53
ceph-deploy new host51 host52 host53
ceph-deploy install host51 host52 host53
ceph-deploy mon create-initial
#sed -i '59a\    StrictHostKeyChecking no' /etc/ssh/ssh_config 
for i in host51 host52 host53;do ssh $i "parted -s /dev/vdb mklabel gpt;parted -s /dev/vdb mkpart primary 1M 50%;parted -s /dev/vdb mkpart primary 50% 100%";done  
cat >> /etc/rc.d/rc.local << EOF
chown ceph.ceph /dev/vdb*
EOF
chmod +x /etc/rc.d/rc.local
for i in host51 host52 host53;do scp -p /etc/rc.d/rc.local $i:/etc/rc.d/rc.local;done
for i in host51 host52 host53;do ssh $i "source /etc/rc.d/rc.local";done
for i in host52 host53 host51;do ceph-deploy disk zap $i:vdc $i:vdd;done
for i in host51 host52 host53;do ceph-deploy osd create $i:vdc:/dev/vdb1 $i:vdd:/dev/vdb2;done
ceph -s | grep health

