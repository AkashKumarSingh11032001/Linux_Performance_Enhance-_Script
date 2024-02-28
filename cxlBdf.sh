#!/bin/bash

fio_file_4DUT="4kbRandom.txt"
fio_file_1DUT="4kbRandom_1.txt"
cpu_core=2
memeory_limit=2147483648


for iteration in {0..1..1}
do
    # ----- BEFORE LIMIT -----
    echo "Running ${iteration} Started"
    
    echo '4DUT Before Limit'
    f_name="4DUT_${iteration}_BEFORE_LIMIT.txt"
    fio ${fio_file_4DUT} --eta-newline=1 --eta=always > $f_name & CURR_PID=$!
    echo $CURR_PID
    
    
    # ----- AFTER BOTH LIMIT -----
    echo '4DUT AFTER BOTH LIMIT'
    f_name="4DUT_${iteration}_AFTER_BOTH_LIMIT.txt"
    fio ${fio_file_4DUT} --eta-newline=1 --eta=always > $f_name & CURR_PID=$!
    echo $CURR_PID
    
    echo "CPU & MEMORY LIMIT STARTED"
    cpulimit -c ${cpu_core} -p $CURR_PID -l 25 & prlimit --pid $CURR_PID --as=${memeory_limit}
    echo "CPU & MEMORY LIMIT ENDED"
    
    # ----- AFTER CPU LIMIT -----
    echo '4DUT CPU LIMIT'
    f_name="4DUT_${iteration}_CPU_LIMIT.txt"
    fio ${fio_file_4DUT} --eta-newline=1 --eta=always > $f_name & CURR_PID=$!
    echo $CURR_PID
    
    echo "CPU LIMIT STARTED"
    cpulimit -c ${cpu_core} -p $CURR_PID -l 25
    echo "CPU LIMIT ENDED"
    
    # ----- AFTER MEMORY LIMIT -----
    echo '4DUT MEMORY LIMIT'
    f_name="4DUT_${iteration}_MEMORY_LIMIT.txt"
    fio ${fio_file_4DUT} --eta-newline=1 --eta=always > $f_name & CURR_PID=$!
    echo $CURR_PID
    
    echo "MEMORY LIMIT STARTED"
    prlimit --pid $CURR_PID --as=${memeory_limit}
    echo "MEMORY LIMIT ENDED"
    
    echo "Running ${iteration} Ended"
    
done


# for memNumber in {0..15..1}
# do
#     echo "Dut: ${memNumber}"
#     File="mem${memNumber}"

#     searchFile=${directory}/${File}
#     if [-L $searchFile]; then
#         echo "File : ${File} present!"
#         cd /home/tester/Akash/cxl_temp | touch mem${memNumber}link.txt | readlink -f /sys/bus/cxl/devices/mem${memNumber} > mem${memNumber}link.txt | cut -c 30-34 mem${memNumber}link.txt > bdf${memNumber}link.txt
#     else
#         echo 'File does not exist!'
#         exit 1

#     fi
# done
# echo "After Loop!"

exit 0