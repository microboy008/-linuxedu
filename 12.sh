#!/bin/bash
for i in `ls $1`
do
  mv $1$i $1${i%.*}.$2 
done
echo `ls $1`
