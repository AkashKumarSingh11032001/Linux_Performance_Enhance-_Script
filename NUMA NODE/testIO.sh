#!/bin/bash

# References
# https://devopsideas.com/benchmarking-disk-iops-aws-vs-digitalocean/
# https://wiki.mikejung.biz/Benchmarking#Fio_Test_Options_and_Examples
# https://tobert.github.io/post/2014-04-17-fio-output-explained.html


# Requires linux packages: fio ioping

echo "Testing: Random read/write performance"
#fio --randrepeat=1 --ioengine=libaio --direct=1 --gtod_reduce=1 --name=test --filename=test --bs=4k --iodepth=64 --size=4G --readwrite=randrw --rwmixread=75
fio --name=randreadwrite --ioengine=libaio --iodepth=1 --readwrite=randrw --rwmixread=75 -bs=4k --direct=1 --size=512M --numjobs=8 --runtime=240 --group_reporting

# echo ""
# echo "Testing: Random read performance"
# #fio --randrepeat=1 --ioengine=libaio --direct=1 --gtod_reduce=1 --name=test --filename=test --bs=4k --iodepth=64 --size=4G --readwrite=randread
# fio --name=randread --ioengine=libaio --iodepth=1 --readwrite=randread -bs=4k --direct=1 --size=512M --numjobs=8 --runtime=240 --group_reporting

# echo ""
# echo "Testing: Random write performance"
# #fio --randrepeat=1 --ioengine=libaio --direct=1 --gtod_reduce=1 --name=test --filename=test --bs=4k --iodepth=64 --size=4G --readwrite=randwrite
# fio --name=randwrite --ioengine=libaio --iodepth=1 --readwrite=randwrite -bs=4k --direct=1 --size=512M --numjobs=8 --runtime=240 --group_reporting


echo ""
echo "Testing: IO Latency on individual request"
ioping -c 10 .

