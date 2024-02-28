#!/bin/bash

for i in {1..1000};
do
    echo $(echo q | htop -C | aha --line-fix | html2text -width 999 | grep -v "F1Help" | grep -v "xml version=" >> "htop.txt") ; sleep 1;
done

exec bash

# grep "iops        : min=" DUT1_RUN0_Log.txt DUT2_RUN0_Log.txt DUT3_RUN0_Log.txt DUT4_RUN0_Log.txt | awk '{print $6}' > Iteration0_iops.txt &
# grep "iops        : min=" DUT1_RUN1_Log.txt DUT2_RUN1_Log.txt DUT3_RUN1_Log.txt DUT4_RUN1_Log.txt | awk '{print $6}' > Iteration1_iops.txt &
# grep "iops        : min=" DUT1_RUN2_Log.txt DUT2_RUN2_Log.txt DUT3_RUN2_Log.txt DUT4_RUN2_Log.txt | awk '{print $6}' > Iteration2_iops.txt &
# grep "iops        : min=" DUT1_RUN3_Log.txt DUT2_RUN3_Log.txt DUT3_RUN3_Log.txt DUT4_RUN3_Log.txt | awk '{print $6}' > Iteration3_iops.txt &
# grep "iops        : min=" DUT1_RUN4_Log.txt DUT2_RUN4_Log.txt DUT3_RUN4_Log.txt DUT4_RUN4_Log.txt | awk '{print $6}' > Iteration4_iops.txt


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