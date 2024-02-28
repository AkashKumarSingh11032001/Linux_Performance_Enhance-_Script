#!/bin/bash

FIO_DIRECTORY="/home/tester/AKS"
CGROUP_DIRECTORY="/sys/fs/cgroup"

for iteration in {0..4..1}
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
    f9="DUT9_RUN${iteration}_Log.txt"
    f10="DUT10_RUN${iteration}_Log.txt"
    f11="DUT11_RUN${iteration}_Log.txt"
    f12="DUT12_RUN${iteration}_Log.txt"
    f13="DUT13_RUN${iteration}_Log.txt"
    f14="DUT14_RUN${iteration}_Log.txt"
    f15="DUT15_RUN${iteration}_Log.txt"
    f16="DUT16_RUN${iteration}_Log.txt"
    
    a="DUT1_PSR_CHECK.txt"
    b="DUT2_PSR_CHECK.txt"
    c="DUT3_PSR_CHECK.txt"
    d="DUT4_PSR_CHECK.txt"
    e="DUT5_PSR_CHECK.txt"
    f="DUT6_PSR_CHECK.txt"
    g="DUT7_PSR_CHECK.txt"
    h="DUT8_PSR_CHECK.txt"
    i="DUT9_PSR_CHECK.txt"
    j="DUT10_PSR_CHECK.txt"
    k="DUT11_PSR_CHECK.txt"
    l="DUT12_PSR_CHECK.txt"
    m="DUT13_PSR_CHECK.txt"
    n="DUT14_PSR_CHECK.txt"
    o="DUT15_PSR_CHECK.txt"
    p="DUT16_PSR_CHECK.txt"
    
    fio $FIO_DIRECTORY/DUT1.txt -allow_mounted_write=1 --eta-newline=1 --eta=always > logs/${f1} & CURR_PID=$! ; echo "FIO 1 : $CURR_PID" ; echo $CURR_PID > /sys/fs/cgroup/DUT1/cgroup.procs ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${a} ; sleep 1; done &
    fio $FIO_DIRECTORY/DUT2.txt -allow_mounted_write=1 --eta-newline=1 --eta=always > logs/${f2} & CURR_PID=$! ; echo "FIO 2 : $CURR_PID" ; echo $CURR_PID > /sys/fs/cgroup/DUT2/cgroup.procs ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${b} ; sleep 1; done &
    fio $FIO_DIRECTORY/DUT3.txt -allow_mounted_write=1 --eta-newline=1 --eta=always > logs/${f3} & CURR_PID=$! ; echo "FIO 3 : $CURR_PID" ; echo $CURR_PID > /sys/fs/cgroup/DUT3/cgroup.procs ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${c} ; sleep 1; done &
    fio $FIO_DIRECTORY/DUT4.txt -allow_mounted_write=1 --eta-newline=1 --eta=always > logs/${f4} & CURR_PID=$! ; echo "FIO 4 : $CURR_PID" ; echo $CURR_PID > /sys/fs/cgroup/DUT4/cgroup.procs ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${d} ; sleep 1; done &
    
    fio $FIO_DIRECTORY/DUT5.txt -allow_mounted_write=1 --eta-newline=1 --eta=always > logs/${f5} & CURR_PID=$! ; echo "FIO 5 : $CURR_PID" ; echo $CURR_PID > /sys/fs/cgroup/DUT5/cgroup.procs ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${e} ; sleep 1; done &
    fio $FIO_DIRECTORY/DUT6.txt -allow_mounted_write=1 --eta-newline=1 --eta=always > logs/${f6} & CURR_PID=$! ; echo "FIO 6 : $CURR_PID" ; echo $CURR_PID > /sys/fs/cgroup/DUT6/cgroup.procs ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${f} ; sleep 1; done &
    fio $FIO_DIRECTORY/DUT7.txt -allow_mounted_write=1 --eta-newline=1 --eta=always > logs/${f7} & CURR_PID=$! ; echo "FIO 7 : $CURR_PID" ; echo $CURR_PID > /sys/fs/cgroup/DUT7/cgroup.procs ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${g} ; sleep 1; done &
    fio $FIO_DIRECTORY/DUT8.txt -allow_mounted_write=1 --eta-newline=1 --eta=always > logs/${f8} & CURR_PID=$! ; echo "FIO 8 : $CURR_PID" ; echo $CURR_PID > /sys/fs/cgroup/DUT8/cgroup.procs ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${h} ; sleep 1; done &

    fio $FIO_DIRECTORY/DUT9.txt -allow_mounted_write=1 --eta-newline=1 --eta=always > logs/${f9} & CURR_PID=$! ; echo "FIO 5 : $CURR_PID" ; echo $CURR_PID > /sys/fs/cgroup/DUT9/cgroup.procs ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${i} ; sleep 1; done &
    fio $FIO_DIRECTORY/DUT10.txt -allow_mounted_write=1 --eta-newline=1 --eta=always > logs/${f10} & CURR_PID=$! ; echo "FIO 6 : $CURR_PID" ; echo $CURR_PID > /sys/fs/cgroup/DUT10/cgroup.procs ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${j} ; sleep 1; done &
    fio $FIO_DIRECTORY/DUT11.txt -allow_mounted_write=1 --eta-newline=1 --eta=always > logs/${f11} & CURR_PID=$! ; echo "FIO 7 : $CURR_PID" ; echo $CURR_PID > /sys/fs/cgroup/DUT11/cgroup.procs ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${k} ; sleep 1; done &
    fio $FIO_DIRECTORY/DUT12.txt -allow_mounted_write=1 --eta-newline=1 --eta=always > logs/${f12} & CURR_PID=$! ; echo "FIO 8 : $CURR_PID" ; echo $CURR_PID > /sys/fs/cgroup/DUT12/cgroup.procs ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${l} ; sleep 1; done &

    fio $FIO_DIRECTORY/DUT13.txt -allow_mounted_write=1 --eta-newline=1 --eta=always > logs/${f13} & CURR_PID=$! ; echo "FIO 5 : $CURR_PID" ; echo $CURR_PID > /sys/fs/cgroup/DUT13/cgroup.procs ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${m} ; sleep 1; done &
    fio $FIO_DIRECTORY/DUT14.txt -allow_mounted_write=1 --eta-newline=1 --eta=always > logs/${f14} & CURR_PID=$! ; echo "FIO 6 : $CURR_PID" ; echo $CURR_PID > /sys/fs/cgroup/DUT14/cgroup.procs ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${n} ; sleep 1; done &
    fio $FIO_DIRECTORY/DUT15.txt -allow_mounted_write=1 --eta-newline=1 --eta=always > logs/${f15} & CURR_PID=$! ; echo "FIO 7 : $CURR_PID" ; echo $CURR_PID > /sys/fs/cgroup/DUT15/cgroup.procs ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${o} ; sleep 1; done &
    fio $FIO_DIRECTORY/DUT16.txt -allow_mounted_write=1 --eta-newline=1 --eta=always > logs/${f16} & CURR_PID=$! ; echo "FIO 8 : $CURR_PID" ; echo $CURR_PID > /sys/fs/cgroup/DUT16/cgroup.procs ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${p} ; sleep 1; done &

    sleep 310
    
    # grep "iops        : min=" DUT1_RUN0_Log.txt DUT2_RUN0_Log.txt DUT3_RUN0_Log.txt DUT4_RUN0_Log.txt | awk '{print $6}' > Iteration0_iops.txt
    
    echo "Running ${iteration} Ended!"
    
done

cd $FIO_DIRECTORY

exec bash