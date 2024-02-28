#!/bin/bash

FIO_DIRECTORY="/home/tester/AKS"
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
    # f9="DUT9_RUN${iteration}_Log.txt"
    # f10="DUT10_RUN${iteration}_Log.txt"
    # f11="DUT11_RUN${iteration}_Log.txt"
    # f12="DUT12_RUN${iteration}_Log.txt"
    # f13="DUT13_RUN${iteration}_Log.txt"
    # f14="DUT14_RUN${iteration}_Log.txt"
    # f15="DUT15_RUN${iteration}_Log.txt"
    # f16="DUT16_RUN${iteration}_Log.txt"
    
    a="DUT1_PSR_CHECK.txt"
    b="DUT2_PSR_CHECK.txt"
    c="DUT3_PSR_CHECK.txt"
    d="DUT4_PSR_CHECK.txt"
    e="DUT5_PSR_CHECK.txt"
    f="DUT6_PSR_CHECK.txt"
    g="DUT7_PSR_CHECK.txt"
    h="DUT8_PSR_CHECK.txt"
    # i="DUT9_PSR_CHECK.txt"
    # j="DUT10_PSR_CHECK.txt"
    # k="DUT11_PSR_CHECK.txt"
    # l="DUT12_PSR_CHECK.txt"
    # m="DUT13_PSR_CHECK.txt"
    # n="DUT14_PSR_CHECK.txt"
    # o="DUT15_PSR_CHECK.txt"
    # p="DUT16_PSR_CHECK.txt"
    
    # nice -n -10 taskset -a -c 0-4 fio DUT1.txt --eta-newline=1 --eta=always > logs/${f1} & CURR_PID=$! ; echo $CURR_PID ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> "Currpsr_$iteration_$CURR_PID.txt" ; sleep 1; done &
    # nice -n -10 taskset -a -c 65-69 fio DUT2.txt --eta-newline=1 --eta=always > logs/${f2} & CURR_PID=$! ; echo $CURR_PID ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> "Currpsr_$iteration_$CURR_PID.txt" ; sleep 1; done &
    # nice -n -10 taskset -a -c 72-76 fio DUT3.txt --eta-newline=1 --eta=always > logs/${f3} & CURR_PID=$! ; echo $CURR_PID ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> "Currpsr_$iteration_$CURR_PID.txt" ; sleep 1; done &
    # nice -n -10 taskset -a -c 82-86 fio DUT4.txt --eta-newline=1 --eta=always > logs/${f4} & CURR_PID=$! ; echo $CURR_PID ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> "Currpsr_$iteration_$CURR_PID.txt" ; sleep 1; done & sleep 310
    
    fio $FIO_DIRECTORY/DUT1.txt --eta-newline=1 --eta=always > logs/${f1} & CURR_PID=$! ; echo "FIO 1 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${a} ; sleep 1; done &
    fio $FIO_DIRECTORY/DUT2.txt --eta-newline=1 --eta=always > logs/${f2} & CURR_PID=$! ; echo "FIO 2 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${b} ; sleep 1; done &
    fio $FIO_DIRECTORY/DUT3.txt --eta-newline=1 --eta=always > logs/${f3} & CURR_PID=$! ; echo "FIO 3 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${c} ; sleep 1; done &
    fio $FIO_DIRECTORY/DUT4.txt --eta-newline=1 --eta=always > logs/${f4} & CURR_PID=$! ; echo "FIO 4 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${d} ; sleep 1; done &

    fio $FIO_DIRECTORY/DUT5.txt --eta-newline=1 --eta=always > logs/${f5} & CURR_PID=$! ; echo "FIO 5 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${e} ; sleep 1; done &
    fio $FIO_DIRECTORY/DUT6.txt --eta-newline=1 --eta=always > logs/${f6} & CURR_PID=$! ; echo "FIO 6 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${f} ; sleep 1; done &
    fio $FIO_DIRECTORY/DUT7.txt --eta-newline=1 --eta=always > logs/${f7} & CURR_PID=$! ; echo "FIO 7 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${g} ; sleep 1; done &
    fio $FIO_DIRECTORY/DUT8.txt --eta-newline=1 --eta=always > logs/${f8} & CURR_PID=$! ; echo "FIO 8 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${h} ; sleep 1; done &
    
    # fio $FIO_DIRECTORY/DUT9.txt --eta-newline=1 --eta=always > logs/${f9} & CURR_PID=$! ; echo "FIO 9 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${i} ; sleep 1; done &
    # fio $FIO_DIRECTORY/DUT10.txt --eta-newline=1 --eta=always > logs/${f10} & CURR_PID=$! ; echo "FIO 10 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${j} ; sleep 1; done &
    # fio $FIO_DIRECTORY/DUT11.txt --eta-newline=1 --eta=always > logs/${f11} & CURR_PID=$! ; echo "FIO 11 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${k} ; sleep 1; done &
    # fio $FIO_DIRECTORY/DUT12.txt --eta-newline=1 --eta=always > logs/${f12} & CURR_PID=$! ; echo "FIO 12 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${l} ; sleep 1; done &

    # fio $FIO_DIRECTORY/DUT13.txt --eta-newline=1 --eta=always > logs/${f13} & CURR_PID=$! ; echo "FIO 13 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${m} ; sleep 1; done &
    # fio $FIO_DIRECTORY/DUT14.txt --eta-newline=1 --eta=always > logs/${f14} & CURR_PID=$! ; echo "FIO 14 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${n} ; sleep 1; done &
    # fio $FIO_DIRECTORY/DUT15.txt --eta-newline=1 --eta=always > logs/${f15} & CURR_PID=$! ; echo "FIO 15 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${o} ; sleep 1; done &
    # fio $FIO_DIRECTORY/DUT16.txt --eta-newline=1 --eta=always > logs/${f16} & CURR_PID=$! ; echo "FIO 16 : $CURR_PID" ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${p} ; sleep 1; done &
    
    sleep 310
    
    # grep "iops        : min=" DUT1_RUN0_Log.txt DUT2_RUN0_Log.txt DUT3_RUN0_Log.txt DUT4_RUN0_Log.txt | awk '{print $6}' > Iteration0_iops.txt
    
    
    echo "Running ${iteration} Ended!"
    
done

# # Value Fetching
# for iteration in {0..4..1}
# do
#     f1="1DUT_${iteration}_BEFORE_LIMIT.txt"
#     f2="1DUT_${iteration}_AFTER_BOTH_LIMIT.txt"
#     f3="1DUT_${iteration}_CPU_LIMIT.txt"
#     f4="1DUT_${iteration}_MEMORY_LIMIT.txt"

#     grep "iops        : min=" logs/${f1} logs/${f2} logs/${f3} logs/${f4} | awk '{print $6}' > Iteration${iteration}_iops.txt

# done

# grep "iops        : min=" DUT1_RUN0_Log.txt DUT2_RUN0_Log.txt DUT3_RUN0_Log.txt DUT4_RUN0_Log.txt | awk '{print $6}' > Iteration0_iops.txt &
# grep "iops        : min=" DUT1_RUN1_Log.txt DUT2_RUN1_Log.txt DUT3_RUN1_Log.txt DUT4_RUN1_Log.txt | awk '{print $6}' > Iteration1_iops.txt &
# grep "iops        : min=" DUT1_RUN2_Log.txt DUT2_RUN2_Log.txt DUT3_RUN2_Log.txt DUT4_RUN2_Log.txt | awk '{print $6}' > Iteration2_iops.txt &
# grep "iops        : min=" DUT1_RUN3_Log.txt DUT2_RUN3_Log.txt DUT3_RUN3_Log.txt DUT4_RUN3_Log.txt | awk '{print $6}' > Iteration3_iops.txt &
# grep "iops        : min=" DUT1_RUN4_Log.txt DUT2_RUN4_Log.txt DUT3_RUN4_Log.txt DUT4_RUN4_Log.txt | awk '{print $6}' > Iteration4_iops.txt


exec bash
# CmdArray=(${cmd1} ${cmd2} ${cmd3} ${cmd4})

# for ((i = 0; i < 4; i++ ))
# do
#     ${CmdArray[$i]} &
# done
# $cmd1 & $cmd2 & $cmd3 & $cmd4


# grep "iops        : min=" DUT1_RUN0_Log.txt DUT2_RUN0_Log.txt DUT3_RUN0_Log.txt DUT4_RUN0_Log.txt | awk '{print $6}' > Iteration0_iops.txt
# grep "iops        : min=" DUT1_RUN1_Log.txt DUT2_RUN1_Log.txt DUT3_RUN1_Log.txt DUT4_RUN1_Log.txt | awk '{print $6}' > Iteration1_iops.txt
# grep "iops        : min=" DUT1_RUN2_Log.txt DUT2_RUN2_Log.txt DUT3_RUN2_Log.txt DUT4_RUN2_Log.txt | awk '{print $6}' > Iteration2_iops.txt
# grep "iops        : min=" DUT1_RUN3_Log.txt DUT2_RUN3_Log.txt DUT3_RUN3_Log.txt DUT4_RUN3_Log.txt | awk '{print $6}' > Iteration3_iops.txt
# grep "iops        : min=" DUT1_RUN4_Log.txt DUT2_RUN4_Log.txt DUT3_RUN4_Log.txt DUT4_RUN4_Log.txt | awk '{print $6}' > Iteration4_iops.txt

# grep "iops        : min=" DUT1_RUN0_Log.txt DUT2_RUN0_Log.txt DUT3_RUN0_Log.txt DUT4_RUN0_Log.txt | awk '{print $6}' > Iteration0_iops.txt & grep "iops        : min=" DUT1_RUN1_Log.txt DUT2_RUN1_Log.txt DUT3_RUN1_Log.txt DUT4_RUN1_Log.txt | awk '{print $6}' > Iteration1_iops.txt & grep "iops        : min=" DUT1_RUN2_Log.txt DUT2_RUN2_Log.txt DUT3_RUN2_Log.txt DUT4_RUN2_Log.txt | awk '{print $6}' > Iteration2_iops.txt & grep "iops        : min=" DUT1_RUN3_Log.txt DUT2_RUN3_Log.txt DUT3_RUN3_Log.txt DUT4_RUN3_Log.txt | awk '{print $6}' > Iteration3_iops.txt & grep "iops        : min=" DUT1_RUN4_Log.txt DUT2_RUN4_Log.txt DUT3_RUN4_Log.txt DUT4_RUN4_Log.txt | awk '{print $6}' > Iteration4_iops.txt


# exit 0

# (fio DUT1.txt --eta-newline=1 --eta=always > DUT1_Log.txt & CURR_PID=$! ; echo $CURR_PID ; cpulimit -c 2 -p $CURR_PID -l 25) & (fio DUT2.txt --eta-newline=1 --eta=always > DUT2_Log.txt & CURR_PID=$! ; echo $CURR_PID ; cpulimit -c 2 -p $CURR_PID -l 25) & (fio DUT3.txt --eta-newline=1 --eta=always > DUT3_Log.txt & CURR_PID=$! ; echo $CURR_PID ; cpulimit -c 2 -p $CURR_PID -l 25) & (fio DUT4.txt --eta-newline=1 --eta=always > DUT4_Log.txt & CURR_PID=$! ; echo $CURR_PID ; cpulimit -c 2 -p $CURR_PID -l 25)