#!/bin/bash
file="/etc/sysconfig/network-scripts/ifcfg-eth0"
[ -f $file ] &&  ifconfig eth0  |grep netmask >/dev/null && systemctl restart network &&echo "network ok!" ||echo "error"
