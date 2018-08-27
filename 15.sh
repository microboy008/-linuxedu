#!/bin/bash
A=`awk -F : '/bash$/{print $1}' /etc/passwd`
for i in $A
do
awk -F : '/^'$i'/{print $1,$2}' /etc/shadow
done
