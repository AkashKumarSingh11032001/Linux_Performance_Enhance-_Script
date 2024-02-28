#!/bin/bash

FIO_DIRECTORY="/home/tester/AKS"
CGROUP_DIRECTORY="/sys/fs/cgroup"


iteration=0
f1="DUT1_RUN${iteration}_Log.txt"
f2="DUT2_RUN${iteration}_Log.txt"
f3="DUT3_RUN${iteration}_Log.txt"
f4="DUT4_RUN${iteration}_Log.txt"
f5="DUT5_RUN${iteration}_Log.txt"
f6="DUT6_RUN${iteration}_Log.txt"
f7="DUT7_RUN${iteration}_Log.txt"
f8="DUT8_RUN${iteration}_Log.txt"
f9="DUT9_RUN${iteration}_Log.txt"
f10="DUT10_RUN${iteration}_Log.txt"
f11="DUT11_RUN${iteration}_Log.txt"
f12="DUT12_RUN${iteration}_Log.txt"
f13="DUT13_RUN${iteration}_Log.txt"
f14="DUT14_RUN${iteration}_Log.txt"
f15="DUT15_RUN${iteration}_Log.txt"
f16="DUT16_RUN${iteration}_Log.txt"



# ---- MAIN CALL ----
main() {
    # Take user input for number of iterations
    echo "Enter number of iterations: " 
    read NUMITR
    # take user inout for number of DUT
    echo "Enter number of DUTs: "
    read NUMDUT
    # take user input for operation to be performed
    # 1. Create CGROUPS
    # 2. RUN FIO JOB
    # 3. Create CGROUP and RUN FIO JOB
    echo "Enter operation to be performed: "
    read OPERATION

    case ${OPERATION} in
    "1") 
        # take user inout for to create number of CGROUPS
        echo "Enter number of CGROUPS: "
        read NUMPCG

        CGROUP_NAME="DUT"
        cd ${CGROUP_DIRECTORY}
        rmdir DUT*

        for i in $(seq 1 ${NUMPCG})
        do
            mkdir "${CGROUP_NAME}${i}"
            chmod -R 777 "${CGROUP_NAME}${i}"
        done
        ;;
    
    "2")

    
    ;;
}
