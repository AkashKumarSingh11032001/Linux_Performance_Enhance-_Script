#!/bin/bash
directory="/sys/bus/cxl/devices/"
echo "Before Loop!"

for memNumber in {0..15..1}
do
    echo "Dut: ${memNumber}"
    File="mem${memNumber}"
    
    searchFile=${directory}/${File}
    if [-L $searchFile]; then
        echo "File : ${File} present!"
        cd /home/tester/Akash/cxl_temp | touch mem${memNumber}link.txt | readlink -f /sys/bus/cxl/devices/mem${memNumber} > mem${memNumber}link.txt | cut -c 30-34 mem${memNumber}link.txt > bdf${memNumber}link.txt
    else
        echo 'File does not exist!'
        exit 1
        
    fi
done
echo "After Loop!"

exit 0