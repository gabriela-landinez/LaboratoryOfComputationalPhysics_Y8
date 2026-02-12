#!/bin/bash

# 2a
cd /home/gaby/Documents/PoD/CP/LaboratoryOfComputationalPhysics_Y8/docs_03
grep -v '^#' data.csv | tr -d ',' > data.txt

#2b
evens=$(tr ' ' '\n' < data.txt | awk '$0 % 2 == 0' | wc -l)
echo "even numbers: $evens"

#2c
awk '{ 
    d = sqrt($1^2 + $2^2 + $3^2)
    if (d > 86.6025) g++ ; else s++ 
} 
END { print "Greater:", g, "Smaller:", s }' data.txt
