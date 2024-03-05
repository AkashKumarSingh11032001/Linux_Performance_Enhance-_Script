#!/bin/bash

FIO_DIRECTORY="/home/tester/AKS"

cd $FIO_DIRECTORY

nvme list

echo "---------------AVIABLE NVME DEVICES----------------"


nvme format /dev/nvme8n1 -l 0 -f; nvme format /dev/nvme9n1 -l 0 -f; nvme format /dev/nvme10n1 -l 0 -f; nvme format /dev/nvme11n1 -l 0 -f; nvme format /dev/nvme12n1 -l 0 -f; nvme format /dev/nvme13n1 -l 0 -f; nvme format /dev/nvme14n1 -l 0 -f; nvme format /dev/nvme15n1 -l 0 -f && echo "---------------NVME FORMATTING COMPLETE----------------"
