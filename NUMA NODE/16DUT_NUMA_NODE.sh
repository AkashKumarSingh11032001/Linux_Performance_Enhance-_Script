#!/bin/bash

FIO_DIRECTORY="/home/tester/AKS/DUT_FIO"
FIO_LOG_DIRECTORY="/home/tester/AKS/logs"
CGROUP_DIRECTORY="/sys/fs/cgroup"

for iteration in {0..4..1}
do
    echo "Moving into FIO file Directory"
    cd $FIO_DIRECTORY
    
    # nvme format /dev/nvme0n1 -l 0 -f; nvme format /dev/nvme1n1 -l 0 -f; nvme format /dev/nvme2n1 -l 0 -f; nvme format /dev/nvme3n1 -l 0 -f; nvme format /dev/nvme4n1 -l 0 -f; nvme format /dev/nvme5n1 -l 0 -f; nvme format /dev/nvme6n1 -l 0 -f; nvme format /dev/nvme7n1 -l 0 -f && echo "---------------NVME FORMATTING COMPLETE----------------" &&
    
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
    
    # node 0 [DUT 1 to DUT 8]
    # node 1 [DUT 9 to DUT 16]
    numa_DUT_1=0-3
    numa_DUT_2=4-7
    numa_DUT_3=8-11
    numa_DUT_4=12-15
    numa_DUT_5=64-67
    numa_DUT_6=68-71
    numa_DUT_7=72-75
    numa_DUT_8=76-79
    numa_DUT_9=108-111
    numa_DUT_10=104-107
    numa_DUT_11=100-103
    numa_DUT_12=96-99
    numa_DUT_13=45-48
    numa_DUT_14=41-44
    numa_DUT_15=37-40
    numa_DUT_16=33-36
    
    
    numactl --physcpubind=$numa_DUT_1 fio $FIO_DIRECTORY/DUT1.txt --eta-newline=1 --eta=always > ${FIO_LOG_DIRECTORY}/${f1} & CURR_PID=$! ; echo "FIO 1 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> ${FIO_LOG_DIRECTORY}/${a} ; sleep 1; done &
    numactl --physcpubind=$numa_DUT_2 fio $FIO_DIRECTORY/DUT2.txt --eta-newline=1 --eta=always > ${FIO_LOG_DIRECTORY}/${f2} & CURR_PID=$! ; echo "FIO 2 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> ${FIO_LOG_DIRECTORY}/${b} ; sleep 1; done &
    numactl --physcpubind=$numa_DUT_3 fio $FIO_DIRECTORY/DUT3.txt --eta-newline=1 --eta=always > ${FIO_LOG_DIRECTORY}/${f3} & CURR_PID=$! ; echo "FIO 3 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> ${FIO_LOG_DIRECTORY}/${c} ; sleep 1; done &
    numactl --physcpubind=$numa_DUT_4 fio $FIO_DIRECTORY/DUT4.txt --eta-newline=1 --eta=always > ${FIO_LOG_DIRECTORY}/${f4} & CURR_PID=$! ; echo "FIO 4 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> ${FIO_LOG_DIRECTORY}/${d} ; sleep 1; done &
    
    numactl --physcpubind=$numa_DUT_5 fio $FIO_DIRECTORY/DUT5.txt --eta-newline=1 --eta=always > ${FIO_LOG_DIRECTORY}/${f5} & CURR_PID=$! ; echo "FIO 5 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> ${FIO_LOG_DIRECTORY}/${e} ; sleep 1; done &
    numactl --physcpubind=$numa_DUT_6 fio $FIO_DIRECTORY/DUT6.txt --eta-newline=1 --eta=always > ${FIO_LOG_DIRECTORY}/${f6} & CURR_PID=$! ; echo "FIO 6 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> ${FIO_LOG_DIRECTORY}/${f} ; sleep 1; done &
    numactl --physcpubind=$numa_DUT_7 fio $FIO_DIRECTORY/DUT7.txt --eta-newline=1 --eta=always > ${FIO_LOG_DIRECTORY}/${f7} & CURR_PID=$! ; echo "FIO 7 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> ${FIO_LOG_DIRECTORY}/${g} ; sleep 1; done &
    numactl --physcpubind=$numa_DUT_8 fio $FIO_DIRECTORY/DUT8.txt --eta-newline=1 --eta=always > ${FIO_LOG_DIRECTORY}/${f8} & CURR_PID=$! ; echo "FIO 8 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> ${FIO_LOG_DIRECTORY}/${h} ; sleep 1; done &
    
    numactl --physcpubind=$numa_DUT_9 fio $FIO_DIRECTORY/DUT9.txt --eta-newline=1 --eta=always > ${FIO_LOG_DIRECTORY}/${f9} & CURR_PID=$! ; echo "FIO 9 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> ${FIO_LOG_DIRECTORY}/${i} ; sleep 1; done &
    numactl --physcpubind=$numa_DUT_10 fio $FIO_DIRECTORY/DUT10.txt --eta-newline=1 --eta=always > ${FIO_LOG_DIRECTORY}/${f10} & CURR_PID=$! ; echo "FIO 10 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> ${FIO_LOG_DIRECTORY}/${j} ; sleep 1; done &
    numactl --physcpubind=$numa_DUT_11 fio $FIO_DIRECTORY/DUT11.txt --eta-newline=1 --eta=always > ${FIO_LOG_DIRECTORY}/${f11} & CURR_PID=$! ; echo "FIO 11 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> ${FIO_LOG_DIRECTORY}/${k} ; sleep 1; done &
    numactl --physcpubind=$numa_DUT_12 fio $FIO_DIRECTORY/DUT12.txt --eta-newline=1 --eta=always > ${FIO_LOG_DIRECTORY}/${f12} & CURR_PID=$! ; echo "FIO 12 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> ${FIO_LOG_DIRECTORY}/${l} ; sleep 1; done &
    
    numactl --physcpubind=$numa_DUT_13 fio $FIO_DIRECTORY/DUT13.txt --eta-newline=1 --eta=always > ${FIO_LOG_DIRECTORY}/${f13} & CURR_PID=$! ; echo "FIO 13 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> ${FIO_LOG_DIRECTORY}/${m} ; sleep 1; done &
    numactl --physcpubind=$numa_DUT_14 fio $FIO_DIRECTORY/DUT14.txt --eta-newline=1 --eta=always > ${FIO_LOG_DIRECTORY}/${f14} & CURR_PID=$! ; echo "FIO 14 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> ${FIO_LOG_DIRECTORY}/${n} ; sleep 1; done &
    numactl --physcpubind=$numa_DUT_15 fio $FIO_DIRECTORY/DUT15.txt --eta-newline=1 --eta=always > ${FIO_LOG_DIRECTORY}/${f15} & CURR_PID=$! ; echo "FIO 15 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> ${FIO_LOG_DIRECTORY}/${o} ; sleep 1; done &
    numactl --physcpubind=$numa_DUT_16 fio $FIO_DIRECTORY/DUT16.txt --eta-newline=1 --eta=always > ${FIO_LOG_DIRECTORY}/${f16} & CURR_PID=$! ; echo "FIO 16 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> ${FIO_LOG_DIRECTORY}/${p} ; sleep 1; done &
    
    sleep 125
    
    # grep "iops        : min=" DUT1_RUN0_Log.txt DUT2_RUN0_Log.txt DUT3_RUN0_Log.txt DUT4_RUN0_Log.txt | awk '{print $6}' > Iteration0_iops.txt
    
    echo "Running ${iteration} Ended!"
    
done

cd $FIO_DIRECTORY

exec bash