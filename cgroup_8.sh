#!/bin/bash

CGROUP_NAME1="DUT1"
CGROUP_NAME2="DUT2"
CGROUP_NAME3="DUT3"
CGROUP_NAME4="DUT4"
CGROUP_NAME5="DUT5"
CGROUP_NAME6="DUT6"
CGROUP_NAME7="DUT7"
CGROUP_NAME8="DUT8"


MOUNT_POINT="/sys/fs/cgroup/"

cd $MOUNT_POINT

mkdir -p $CGROUP_NAME1 $CGROUP_NAME2 $CGROUP_NAME3 $CGROUP_NAME4 $CGROUP_NAME5 $CGROUP_NAME6 $CGROUP_NAME7 $CGROUP_NAME8

chmod a+rx $CGROUP_NAME1
chmod a+rx $CGROUP_NAME2
chmod a+rx $CGROUP_NAME3
chmod a+rx $CGROUP_NAME4
chmod a+rx $CGROUP_NAME5
chmod a+rx $CGROUP_NAME6
chmod a+rx $CGROUP_NAME7
chmod a+rx $CGROUP_NAME8

echo "Mounting cgroups at $MOUNT_POINT/$CGROUP_NAME1"
echo "Mounting cgroups at $MOUNT_POINT/$CGROUP_NAME2"
echo "Mounting cgroups at $MOUNT_POINT/$CGROUP_NAME3"
echo "Mounting cgroups at $MOUNT_POINT/$CGROUP_NAME4"
echo "Mounting cgroups at $MOUNT_POINT/$CGROUP_NAME5"
echo "Mounting cgroups at $MOUNT_POINT/$CGROUP_NAME6"
echo "Mounting cgroups at $MOUNT_POINT/$CGROUP_NAME7"
echo "Mounting cgroups at $MOUNT_POINT/$CGROUP_NAME8"

echo "Aviable controller types:"
cat cgroup.controllers

echo "Default controller"
cat cgroup.subtree_control

bash -c 'echo '+cpu' > cgroup.subtree_control'
bash -c 'echo '+cpuset' > cgroup.subtree_control'

# assign core to cpusets
CORE_VAL1=33
CORE_VAL2=34
CORE_VAL3=35
CORE_VAL4=36
CORE_VAL5=37
CORE_VAL6=38
CORE_VAL7=39
CORE_VAL8=40

echo $CORE_VAL1 > /sys/fs/cgroup/$CGROUP_NAME1/cpuset.cpus
echo $CORE_VAL2 > /sys/fs/cgroup/$CGROUP_NAME2/cpuset.cpus
echo $CORE_VAL3 > /sys/fs/cgroup/$CGROUP_NAME3/cpuset.cpus
echo $CORE_VAL4 > /sys/fs/cgroup/$CGROUP_NAME4/cpuset.cpus
echo $CORE_VAL5 > /sys/fs/cgroup/$CGROUP_NAME5/cpuset.cpus
echo $CORE_VAL6 > /sys/fs/cgroup/$CGROUP_NAME6/cpuset.cpus
echo $CORE_VAL7 > /sys/fs/cgroup/$CGROUP_NAME7/cpuset.cpus
echo $CORE_VAL8 > /sys/fs/cgroup/$CGROUP_NAME8/cpuset.cpus


# echo "session started inside $CGROUP_NAME"
# echo $$ | sudo tee /sys/fs/cgroup/$CGROUP_NAME/cgroup.procs
echo "Cgroup V2 Created!"

# BDF -> NVME DEVICE -> CORE_VAL

# b8:00.0 -> nvme10n1 ->  53
# b9:00.0 -> nvme11n1 ->  49
# a8:00.0 -> nvme12n1 ->  45
# a9:00.0 -> nvme13n1 ->  41
# d9:00.0 -> nvme14n1 ->  37
# d8:00.0 -> nvme15n1 ->  33
# c8:00.0 -> nvme8n1  ->  61
# c9:00.0 -> nvme9n1  ->  57




