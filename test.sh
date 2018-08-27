#!/bin/bash

echo $1,$2,$3
echo $*
echo $@
for i in $*
do 
echo $i
done
for j in $@
do
echo $j
done
