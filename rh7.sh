#!/bin/bash
echo2(){
abc01=`virsh list --all | grep $vm | awk '{print $2}'` 
abc02=`virsh list --all | grep $vm | awk '{print $3}'` 
 if [ $abc02 == running ];then
  echo -e $abc01  "\e[32;1m[running]\e[0m"
 else
   echo -e $abc01 "\033[31m[shutdown]\033[0m"

 fi
}
##################################################################
help(){
echo " Usage: rht-vmctl  VMCMD   VMNAME  
  where VMCMD is one of:
    start      - obtain and start up VMNAME
    stop       - stop a running VMNAME
    poweroff   - if running, force stop VMNAME
    reset      - poweroff, return to saved or original state, start VMNAME
    status     - display libvirt status of VMNAME "
}
#########################################################
IMG_DIR=/var/lib/libvirt/images/
#########################################################
virdef(){
virsh define /tmp/$1  &> /dev/null
echo -e "$2 \e[32;1m[OK]\e[0m"
}
#######################################################
create(){
qemu-img create -f qcow2 -b $IMG_DIR/.$1  $IMG_DIR/$2 &> /dev/null
}
###########################################################
rmimg(){
if [ -e $IMG_DIR/$1 ]; then
    rm -rf $IMG_DIR/$1
fi
}
##################################################
undef(){
id=`virsh dominfo $1 2> /dev/null | grep running`
if  [ -n "$id"  ];then
        /usr/bin/virsh destroy $1 &> /dev/null
fi
virsh undefine $1 &>/dev/null
}
#######################################################
rh7(){
undef $1
rmimg $1.img
create rh7_template.img $1.img
BASEVM=rh7_template
NEWVM=$1
cat /var/lib/libvirt/images/.rhel7.xml > /tmp/myvm.xml
sed -i "/<name>${BASEVM}/s/${BASEVM}/${NEWVM}/" /tmp/myvm.xml
sed -i "/${BASEVM}\.img/s/${BASEVM}/${NEWVM}/" /tmp/myvm.xml
virdef myvm.xml 
virsh start $1
}                        
###################################################################
if [ -z $1 ] || [ -z $2 ];then
  help
elif [ $#  -eq  2 ];then
case $1 in
   start)
   virsh start $2 ;;
   stop)
   virsh  shutdown $2 ;;  
   poweroff)
   virsh destroy $2 ;;
   status)
   vm=$2
   echo2 ;;
   reset)
  rh7 $2;;
  *)
   help ;;   
  esac
else  
   help
fi
