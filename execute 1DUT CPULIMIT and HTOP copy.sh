#!/bin/bash

for iteration in {0..2..1}
do
    echo "Running ${iteration} Started!"
    
    f1="DUT1_RUN${iteration}_Log.txt"
    f2="DUT2_RUN${iteration}_Log.txt"
    f3="DUT3_RUN${iteration}_Log.txt"
    f4="DUT4_RUN${iteration}_Log.txt"
    
    fio DUT1.txt --eta-newline=1 --eta=always > ${f1} & CURR_PID=$! ; echo $CURR_PID ; cpulimit -c 1 -p $CURR_PID -l 100 &
    # fio DUT2.txt --eta-newline=1 --eta=always > ${f2} & CURR_PID=$! ; echo $CURR_PID ; cpulimit -c 1 -p $CURR_PID -l 100 &
    # fio DUT3.txt --eta-newline=1 --eta=always > ${f3} & CURR_PID=$! ; echo $CURR_PID ; cpulimit -c 1 -p $CURR_PID -l 100 &
    # fio DUT4.txt --eta-newline=1 --eta=always > ${f4} & CURR_PID=$! ; echo $CURR_PID ; cpulimit -c 1 -p $CURR_PID -l 100 &
    
    sleep 310
    
    # grep "iops        : min=" ${f1} ${f2} ${f3} ${f4} | awk '{print $6}' > Iteration${iteration}_iops.txt
    
    echo "Running ${iteration} Ended!"
    
done

grep "iops        : min=" DUT1_RUN0_Log.txt DUT2_RUN0_Log.txt DUT3_RUN0_Log.txt DUT4_RUN0_Log.txt | awk '{print $6}' > Iteration0_iops.txt &
grep "iops        : min=" DUT1_RUN1_Log.txt DUT2_RUN1_Log.txt DUT3_RUN1_Log.txt DUT4_RUN1_Log.txt | awk '{print $6}' > Iteration1_iops.txt &
grep "iops        : min=" DUT1_RUN2_Log.txt DUT2_RUN2_Log.txt DUT3_RUN2_Log.txt DUT4_RUN2_Log.txt | awk '{print $6}' > Iteration2_iops.txt &
grep "iops        : min=" DUT1_RUN3_Log.txt DUT2_RUN3_Log.txt DUT3_RUN3_Log.txt DUT4_RUN3_Log.txt | awk '{print $6}' > Iteration3_iops.txt &
grep "iops        : min=" DUT1_RUN4_Log.txt DUT2_RUN4_Log.txt DUT3_RUN4_Log.txt DUT4_RUN4_Log.txt | awk '{print $6}' > Iteration4_iops.txt


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