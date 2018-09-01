#!/bin/sh
read -p "请输入服务器公网IP:" serverip
read -p "请输入VPN帐户名:" user
read -p "请输入VPN密码:" pass
read -p "请输入预共享密钥:" key

yum -y install libreswan
yum -y install xl2tpd

cat << EOF > /etc/ipsec.d/myipsec.conf
conn IDC-PSK-NAT
    rightsubnet=vhost:%priv
    also=IDC-PSK-noNAT

conn IDC-PSK-noNAT
    authby=secret
        ike=3des-sha1;modp1024
        phase2alg=aes256-sha1;modp2048
    pfs=no
    auto=add
    keyingtries=3
    rekey=no
    ikelifetime=8h
    keylife=3h
    type=transport
    left=$serverip
    leftprotoport=17/1701
    right=%any
    rightprotoport=17/%any
EOF

cat <<EOF > /etc/ipsec.d/mypass.secrets
$serverip   %any:    PSK    "$key"
EOF

systemctl start ipsec

sed -i "/^local/c local ip = $serverip" /etc/xl2tpd/xl2tpd.conf
sed -i '/auth/a require-mschap-v2' /etc/ppp/options.xl2tpd
sed -i 's/^crts/#crts/p' /etc/ppp/options.xl2tpd
sed -i 's/^lock/#lock/p' /etc/ppp/options.xl2tpd

cat << EOF  >> /etc/ppp/chap-secrets
$user   *       $pass  *
EOF

systemctl start xl2tpd

echo "1" > /proc/sys/net/ipv4/ip_forward

iptables -F
iptables -t nat -I POSTROUTING -s 192.168.3.0/24 -j SNAT --to-source $serverip





