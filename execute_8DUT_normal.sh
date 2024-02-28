#!/bin/bash

FIO_DIRECTORY="/home/tester/AKS"
CGROUP_DIRECTORY="/sys/fs/cgroup"

for iteration in {0..2..1}
do
    echo "Moving into FIO file Directory"
    cd $FIO_DIRECTORY
    
    echo "Running ${iteration} Started!"
    
    f1="DUT1_RUN${iteration}_Log.txt"
    f2="DUT2_RUN${iteration}_Log.txt"
    f3="DUT3_RUN${iteration}_Log.txt"
    f4="DUT4_RUN${iteration}_Log.txt"
    f5="DUT5_RUN${iteration}_Log.txt"
    f6="DUT6_RUN${iteration}_Log.txt"
    f7="DUT7_RUN${iteration}_Log.txt"
    f8="DUT8_RUN${iteration}_Log.txt"
    
    a="DUT1_PSR_CHECK.txt"
    b="DUT2_PSR_CHECK.txt"
    c="DUT3_PSR_CHECK.txt"
    d="DUT4_PSR_CHECK.txt"
    e="DUT5_PSR_CHECK.txt"
    f="DUT6_PSR_CHECK.txt"
    g="DUT7_PSR_CHECK.txt"
    h="DUT8_PSR_CHECK.txt"
    
    fio $FIO_DIRECTORY/DUT1.txt --eta-newline=1 --eta=always > logs/${f1} & CURR_PID=$! ; echo "FIO 1 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${a} ; sleep 1; done &
    fio $FIO_DIRECTORY/DUT2.txt --eta-newline=1 --eta=always > logs/${f2} & CURR_PID=$! ; echo "FIO 2 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${b} ; sleep 1; done &
    fio $FIO_DIRECTORY/DUT3.txt --eta-newline=1 --eta=always > logs/${f3} & CURR_PID=$! ; echo "FIO 3 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${c} ; sleep 1; done &
    fio $FIO_DIRECTORY/DUT4.txt --eta-newline=1 --eta=always > logs/${f4} & CURR_PID=$! ; echo "FIO 4 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${d} ; sleep 1; done &
    fio $FIO_DIRECTORY/DUT5.txt --eta-newline=1 --eta=always > logs/${f5} & CURR_PID=$! ; echo "FIO 5 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${e} ; sleep 1; done &
    fio $FIO_DIRECTORY/DUT6.txt --eta-newline=1 --eta=always > logs/${f6} & CURR_PID=$! ; echo "FIO 6 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${f} ; sleep 1; done &
    fio $FIO_DIRECTORY/DUT7.txt --eta-newline=1 --eta=always > logs/${f7} & CURR_PID=$! ; echo "FIO 7 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${g} ; sleep 1; done &
    fio $FIO_DIRECTORY/DUT8.txt --eta-newline=1 --eta=always > logs/${f8} & CURR_PID=$! ; echo "FIO 8 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${h} ; sleep 1; done &
    
    
    sleep 310
    
    # grep "iops        : min=" DUT1_RUN0_Log.txt DUT2_RUN0_Log.txt DUT3_RUN0_Log.txt DUT4_RUN0_Log.txt | awk '{print $6}' > Iteration0_iops.txt
    
    echo "Running ${iteration} Ended!"
    
done

cd $FIO_DIRECTORY

exec bash


