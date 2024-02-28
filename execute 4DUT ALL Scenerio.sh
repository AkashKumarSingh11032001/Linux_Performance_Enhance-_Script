#!/bin/bash

for iteration in {0..4..1}
do
    echo "Running ${iteration} Started!"
    
    f1="1DUT_${iteration}_BEFORE_LIMIT.txt"
    f2="1DUT_${iteration}_AFTER_BOTH_LIMIT.txt"
    f3="1DUT_${iteration}_CPU_LIMIT.txt"
    f4="1DUT_${iteration}_MEMORY_LIMIT.txt"

    f5="2DUT_${iteration}_BEFORE_LIMIT.txt"
    f6="2DUT_${iteration}_AFTER_BOTH_LIMIT.txt"
    f7="2DUT_${iteration}_CPU_LIMIT.txt"
    f8="2DUT_${iteration}_MEMORY_LIMIT.txt"

    f9="3DUT_${iteration}_BEFORE_LIMIT.txt"
    f10="3DUT_${iteration}_AFTER_BOTH_LIMIT.txt"
    f11="3DUT_${iteration}_CPU_LIMIT.txt"
    f12="3DUT_${iteration}_MEMORY_LIMIT.txt"

    f13="4DUT_${iteration}_BEFORE_LIMIT.txt"
    f14="4DUT_${iteration}_AFTER_BOTH_LIMIT.txt"
    f15="4DUT_${iteration}_CPU_LIMIT.txt"
    f16="4DUT_${iteration}_MEMORY_LIMIT.txt"
    
    fio DUT1.txt --eta-newline=1 --eta=always > logs/${f1} & CURR_PID=$! ; echo $CURR_PID &
    fio DUT2.txt --eta-newline=1 --eta=always > logs/${f5} & CURR_PID=$! ; echo $CURR_PID &
    fio DUT3.txt --eta-newline=1 --eta=always > logs/${f9} & CURR_PID=$! ; echo $CURR_PID &
    fio DUT4.txt --eta-newline=1 --eta=always > logs/${f13} & CURR_PID=$! ; echo $CURR_PID & sleep 310

    fio DUT1.txt --eta-newline=1 --eta=always > logs/${f2} & CURR_PID=$! ; echo $CURR_PID ; prlimit --pid $CURR_PID --as=8589934592 ; cpulimit -c 8 -p $CURR_PID -l 25 &
    fio DUT2.txt --eta-newline=1 --eta=always > logs/${f6} & CURR_PID=$! ; echo $CURR_PID ; prlimit --pid $CURR_PID --as=8589934592 ; cpulimit -c 8 -p $CURR_PID -l 25 &
    fio DUT3.txt --eta-newline=1 --eta=always > logs/${f10} & CURR_PID=$! ; echo $CURR_PID ; prlimit --pid $CURR_PID --as=8589934592 ; cpulimit -c 8 -p $CURR_PID -l 25 &
    fio DUT4.txt --eta-newline=1 --eta=always > logs/${f14} & CURR_PID=$! ; echo $CURR_PID ; prlimit --pid $CURR_PID --as=8589934592 ; cpulimit -c 8 -p $CURR_PID -l 25 & sleep 310

    fio DUT1.txt --eta-newline=1 --eta=always > logs/${f3} & CURR_PID=$! ; echo $CURR_PID ; cpulimit -c 8 -p $CURR_PID -l 25 &
    fio DUT2.txt --eta-newline=1 --eta=always > logs/${f7} & CURR_PID=$! ; echo $CURR_PID ; cpulimit -c 8 -p $CURR_PID -l 25 &
    fio DUT3.txt --eta-newline=1 --eta=always > logs/${f11} & CURR_PID=$! ; echo $CURR_PID ; cpulimit -c 8 -p $CURR_PID -l 25 &
    fio DUT4.txt --eta-newline=1 --eta=always > logs/${f15} & CURR_PID=$! ; echo $CURR_PID ; cpulimit -c 8 -p $CURR_PID -l 25 & sleep 310

    fio DUT1.txt --eta-newline=1 --eta=always > logs/${f4} & CURR_PID=$! ; echo $CURR_PID ; prlimit --pid $CURR_PID --as=8589934592 &
    fio DUT2.txt --eta-newline=1 --eta=always > logs/${f8} & CURR_PID=$! ; echo $CURR_PID ; prlimit --pid $CURR_PID --as=8589934592 &
    fio DUT3.txt --eta-newline=1 --eta=always > logs/${f12} & CURR_PID=$! ; echo $CURR_PID ; prlimit --pid $CURR_PID --as=8589934592 &
    fio DUT4.txt --eta-newline=1 --eta=always > logs/${f16} & CURR_PID=$! ; echo $CURR_PID ; prlimit --pid $CURR_PID --as=8589934592 & sleep 310 
    
    
    echo "Running ${iteration} Ended!"
    
done

# Value Fetching
for iteration in {0..4..1}
do
    f1="1DUT_${iteration}_BEFORE_LIMIT.txt"
    f2="1DUT_${iteration}_AFTER_BOTH_LIMIT.txt"
    f3="1DUT_${iteration}_CPU_LIMIT.txt"
    f4="1DUT_${iteration}_MEMORY_LIMIT.txt"

    f5="2DUT_${iteration}_BEFORE_LIMIT.txt"
    f6="2DUT_${iteration}_AFTER_BOTH_LIMIT.txt"
    f7="2DUT_${iteration}_CPU_LIMIT.txt"
    f8="2DUT_${iteration}_MEMORY_LIMIT.txt"

    f9="3DUT_${iteration}_BEFORE_LIMIT.txt"
    f10="3DUT_${iteration}_AFTER_BOTH_LIMIT.txt"
    f11="3DUT_${iteration}_CPU_LIMIT.txt"
    f12="3DUT_${iteration}_MEMORY_LIMIT.txt"

    f13="4DUT_${iteration}_BEFORE_LIMIT.txt"
    f14="4DUT_${iteration}_AFTER_BOTH_LIMIT.txt"
    f15="4DUT_${iteration}_CPU_LIMIT.txt"
    f16="4DUT_${iteration}_MEMORY_LIMIT.txt"

    grep "iops        : min=" logs/${f1} logs/${f2} logs/${f3} logs/${f4} | awk '{print $6}' > Iteration${iteration}_DUT1_iops.txt
    grep "iops        : min=" logs/${f5} logs/${f6} logs/${f7} logs/${f8} | awk '{print $6}' > Iteration${iteration}_DUT2_iops.txt
    grep "iops        : min=" logs/${f9} logs/${f10} logs/${f11} logs/${f12} | awk '{print $6}' > Iteration${iteration}_DUT3_iops.txt
    grep "iops        : min=" logs/${f13} logs/${f14} logs/${f15} logs/${f16} | awk '{print $6}' > Iteration${iteration}_DUT4_iops.txt

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

# grep "iops        : min=" DUT1_RUN0_Log.txt DUT2_RUN0_Log.txt DUT3_RUN0_Log.txt DUT4_RUN0_Log.txt | awk '{print $6}' > Iteration0_iops.txt & grep "iops        : min=" DUT1_RUN1_Log.txt DUT2_RUN1_Log.txt DUT3_RUN1_Log.txt DUT4_RUN1_Log.txt | awk '{print $6}' > Iteration1_iops.txt & grep "iops        : min=" DUT1_RUN2_Log.txt DUT2_RUN2_Log.txt DUT3_RUN2_Log.txt DUT4_RUN2_Log.txt | awk '{print $6}' > Iteration2_iops.txt & grep "iops        : min=" DUT1_RUN3_Log.txt DUT2_RUN3_Log.txt DUT3_RUN3_Log.txt DUT4_RUN3_Log.txt | awk '{print $6}' > Iteration3_iops.txt & grep "iops        : min=" DUT1_RUN4_Log.txt DUT2_RUN4_Log.txt DUT3_RUN4_Log.txt DUT4_RUN4_Log.txt | awk '{print $6}' > Iteration4_iops.txt


# exit 0

fio DUT1.txt --eta-newline=1 --eta=always & CURR_PID=$! ; echo $CURR_PID & fio DUT2.txt --eta-newline=1 --eta=always & CURR_PID=$! ; echo $CURR_PID & fio DUT3.txt --eta-newline=1 --eta=always & CURR_PID=$! ; echo $CURR_PID & fio DUT4.txt --eta-newline=1 --eta=always & CURR_PID=$! ; echo $CURR_PID 

# (fio DUT1.txt --eta-newline=1 --eta=always > DUT1_Log.txt & CURR_PID=$! ; echo $CURR_PID ; cpulimit -c 2 -p $CURR_PID -l 25) & (fio DUT2.txt --eta-newline=1 --eta=always > DUT2_Log.txt & CURR_PID=$! ; echo $CURR_PID ; cpulimit -c 2 -p $CURR_PID -l 25) & (fio DUT3.txt --eta-newline=1 --eta=always > DUT3_Log.txt & CURR_PID=$! ; echo $CURR_PID ; cpulimit -c 2 -p $CURR_PID -l 25) & (fio DUT4.txt --eta-newline=1 --eta=always > DUT4_Log.txt & CURR_PID=$! ; echo $CURR_PID ; cpulimit -c 2 -p $CURR_PID -l 25)