#!/bin/bash

f1="DUT1_RUN_Log.txt"
f2="DUT2_RUN_Log.txt"
f3="DUT3_RUN_Log.txt"
f4="DUT4_RUN_Log.txt"

f5="DUT1_PSR_CHECK.txt"
f6="DUT2_PSR_CHECK.txt"
f7="DUT3_PSR_CHECK.txt"
f8="DUT4_PSR_CHECK.txt"

cd /sys/fs/cgroup/

fio /home/ainblr/Desktop/AKS/DUT1.txt -allow_mounted_write=1 --eta-newline=1 --eta=always > logs/${f1} & CURR_PID=$! ; echo "FIO 1 : $CURR_PID" ; echo $CURR_PID > /sys/fs/cgroup/DUT1/cgroup.procs ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${f5} ; sleep 1; done &
fio /home/ainblr/Desktop/AKS/DUT2.txt -allow_mounted_write=1 --eta-newline=1 --eta=always > logs/${f2} & CURR_PID=$! ; echo "FIO 2 : $CURR_PID" ; echo $CURR_PID > /sys/fs/cgroup/DUT2/cgroup.procs ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${f6} ; sleep 1; done &
fio /home/ainblr/Desktop/AKS/DUT3.txt -allow_mounted_write=1 --eta-newline=1 --eta=always > logs/${f3} & CURR_PID=$! ; echo "FIO 3 : $CURR_PID" ; echo $CURR_PID > /sys/fs/cgroup/DUT3/cgroup.procs ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${f7} ; sleep 1; done &
fio /home/ainblr/Desktop/AKS/DUT4.txt -allow_mounted_write=1 --eta-newline=1 --eta=always > logs/${f4} & CURR_PID=$! ; echo "FIO 4 : $CURR_PID" ; echo $CURR_PID > /sys/fs/cgroup/DUT4/cgroup.procs ; for i in {1..300}; do echo $(ps -o psr $CURR_PID) >> logs/${f8} ; sleep 1; done &

cd /home/ainblr/Desktop/AKS/

exec bash