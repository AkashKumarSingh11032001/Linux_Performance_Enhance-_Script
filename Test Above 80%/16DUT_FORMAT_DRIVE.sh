#!/bin/bash

FIO_DIRECTORY="/home/tester/AKS"

cd $FIO_DIRECTORY

nvme list

echo "---------------AVIABLE NVME DEVICES----------------"


nvme format /dev/nvme0n1 -l 0 -f; nvme format /dev/nvme1n1 -l 0 -f; nvme format /dev/nvme2n1 -l 0 -f; nvme format /dev/nvme3n1 -l 0 -f; nvme format /dev/nvme4n1 -l 0 -f; nvme format /dev/nvme5n1 -l 0 -f; nvme format /dev/nvme6n1 -l 0 -f; nvme format /dev/nvme7n1 -l 0 -f; nvme format /dev/nvme8n1 -l 0 -f; nvme format /dev/nvme9n1 -l 0 -f; nvme format /dev/nvme10n1 -l 0 -f; nvme format /dev/nvme11n1 -l 0 -f; nvme format /dev/nvme12n1 -l 0 -f; nvme format /dev/nvme13n1 -l 0 -f; nvme format /dev/nvme14n1 -l 0 -f; nvme format /dev/nvme15n1 -l 0 -f && echo "---------------NVME FORMATTING COMPLETE----------------"
# nvme format /dev/nvme0n1 -l 0 -f; nvme format /dev/nvme1n1 -l 0 -f; nvme format /dev/nvme2n1 -l 0 -f; nvme format /dev/nvme3n1 -l 0 -f; nvme format /dev/nvme4n1 -l 0 -f; nvme format /dev/nvme5n1 -l 0 -f; nvme format /dev/nvme6n1 -l 0 -f; nvme format /dev/nvme7n1 -l 0 -f && echo "---------------NVME FORMATTING COMPLETE----------------" &&
