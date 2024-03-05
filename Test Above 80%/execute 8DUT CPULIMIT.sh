#!/bin/bash

FIO_DIRECTORY="/home/tester/AKS/DUT_FIO"
FIO_LOG_DIRECTORY="/home/tester/AKS/logs"

for iteration in {0..3..1}
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
    
    fio DUT1.txt --eta-newline=1 --eta=always > $FIO_LOG_DIRECTORY/${f1} & CURR_PID=$! ; echo $CURR_PID ; cpulimit -c 4 -p $CURR_PID -l 11 &
    fio DUT2.txt --eta-newline=1 --eta=always > $FIO_LOG_DIRECTORY/${f2} & CURR_PID=$! ; echo $CURR_PID ; cpulimit -c 4 -p $CURR_PID -l 11 &
    fio DUT3.txt --eta-newline=1 --eta=always > $FIO_LOG_DIRECTORY/${f3} & CURR_PID=$! ; echo $CURR_PID ; cpulimit -c 4 -p $CURR_PID -l 11 &
    fio DUT4.txt --eta-newline=1 --eta=always > $FIO_LOG_DIRECTORY/${f4} & CURR_PID=$! ; echo $CURR_PID ; cpulimit -c 4 -p $CURR_PID -l 11 &

    fio DUT5.txt --eta-newline=1 --eta=always > $FIO_LOG_DIRECTORY/${f5} & CURR_PID=$! ; echo $CURR_PID ; cpulimit -c 4 -p $CURR_PID -l 11 &
    fio DUT6.txt --eta-newline=1 --eta=always > $FIO_LOG_DIRECTORY/${f6} & CURR_PID=$! ; echo $CURR_PID ; cpulimit -c 4 -p $CURR_PID -l 11 &
    fio DUT7.txt --eta-newline=1 --eta=always > $FIO_LOG_DIRECTORY/${f7} & CURR_PID=$! ; echo $CURR_PID ; cpulimit -c 4 -p $CURR_PID -l 11 &
    fio DUT8.txt --eta-newline=1 --eta=always > $FIO_LOG_DIRECTORY/${f8} & CURR_PID=$! ; echo $CURR_PID ; cpulimit -c 4 -p $CURR_PID -l 11 &
    
    sleep 125
    
    # grep "iops        : min=" ${f1} ${f2} ${f3} ${f4} | awk '{print $6}' > Iteration${iteration}_iops.txt
    
    echo "Running ${iteration} Ended!"
    
done

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

grep "iops        : min=" DUT1_RUN0_Log.txt DUT2_RUN0_Log.txt DUT3_RUN0_Log.txt DUT4_RUN0_Log.txt | awk '{print $6}' > Iteration0_iops.txt & grep "iops        : min=" DUT1_RUN1_Log.txt DUT2_RUN1_Log.txt DUT3_RUN1_Log.txt DUT4_RUN1_Log.txt | awk '{print $6}' > Iteration1_iops.txt & grep "iops        : min=" DUT1_RUN2_Log.txt DUT2_RUN2_Log.txt DUT3_RUN2_Log.txt DUT4_RUN2_Log.txt | awk '{print $6}' > Iteration2_iops.txt & grep "iops        : min=" DUT1_RUN3_Log.txt DUT2_RUN3_Log.txt DUT3_RUN3_Log.txt DUT4_RUN3_Log.txt | awk '{print $6}' > Iteration3_iops.txt & grep "iops        : min=" DUT1_RUN4_Log.txt DUT2_RUN4_Log.txt DUT3_RUN4_Log.txt DUT4_RUN4_Log.txt | awk '{print $6}' > Iteration4_iops.txt


# exit 0

# (fio DUT1.txt --eta-newline=1 --eta=always > DUT1_Log.txt & CURR_PID=$! ; echo $CURR_PID ; cpulimit -c 2 -p $CURR_PID -l 25) & (fio DUT2.txt --eta-newline=1 --eta=always > DUT2_Log.txt & CURR_PID=$! ; echo $CURR_PID ; cpulimit -c 2 -p $CURR_PID -l 25) & (fio DUT3.txt --eta-newline=1 --eta=always > DUT3_Log.txt & CURR_PID=$! ; echo $CURR_PID ; cpulimit -c 2 -p $CURR_PID -l 25) & (fio DUT4.txt --eta-newline=1 --eta=always > DUT4_Log.txt & CURR_PID=$! ; echo $CURR_PID ; cpulimit -c 2 -p $CURR_PID -l 25)