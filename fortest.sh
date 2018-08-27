#!/bin/bash

for i in {1..9}
do
for j in {1..9}
do
a=$a:$i*$j=
done
echo $a
a=""
done








