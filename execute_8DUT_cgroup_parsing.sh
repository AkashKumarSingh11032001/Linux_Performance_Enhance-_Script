#!/bin/bash

FIOLOG_DIRECTORY="/home/tester/AKS/logs"

for iteration in {0..2..1}
do
    cd $FIOLOG_DIRECTORY
    
    echo "Running ${iteration} Started!"
    
    f1="DUT1_RUN${iteration}_Log.txt"
    f2="DUT2_RUN${iteration}_Log.txt"
    f3="DUT3_RUN${iteration}_Log.txt"
    f4="DUT4_RUN${iteration}_Log.txt"
    f5="DUT5_RUN${iteration}_Log.txt"
    f6="DUT6_RUN${iteration}_Log.txt"
    f7="DUT7_RUN${iteration}_Log.txt"
    f8="DUT8_RUN${iteration}_Log.txt"
    
    grep "iops        : min=" ${f1} ${f2} ${f3} ${f4} ${f5} ${f6} ${f7} ${f8} | awk '{print $6}' > Iteration${iteration}_iops.txt
    
    echo "Running ${iteration} Ended!"
    
done

cd $FIOLOG_DIRECTORY

exec bash