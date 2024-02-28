#!/bin/bash

FIOLOG_DIRECTORY="/home/tester/AKS/logs"

for iteration in {0..4..1}
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
    f9="DUT9_RUN${iteration}_Log.txt"
    f10="DUT10_RUN${iteration}_Log.txt"
    f11="DUT11_RUN${iteration}_Log.txt"
    f12="DUT12_RUN${iteration}_Log.txt"
    f13="DUT13_RUN${iteration}_Log.txt"
    f14="DUT14_RUN${iteration}_Log.txt"
    f15="DUT15_RUN${iteration}_Log.txt"
    f16="DUT16_RUN${iteration}_Log.txt"
    
    grep "iops        : min=" ${f1} ${f2} ${f3} ${f4} ${f5} ${f6} ${f7} ${f8} ${f9} ${f10} ${f11} ${f12} ${f13} ${f14} ${f15} ${f16} | awk '{print $6}' > Iteration${iteration}_iops.txt
    
    echo "Running ${iteration} Ended!"
    
done

cd $FIOLOG_DIRECTORY

exec bash