#!/bin/bash

CGROUP_NAME1="DUT1"
CGROUP_NAME2="DUT2"
CGROUP_NAME3="DUT3"
CGROUP_NAME4="DUT4"

MOUNT_POINT="/sys/fs/cgroup/"

cd $MOUNT_POINT

mkdir -p $CGROUP_NAME1 $CGROUP_NAME2 $CGROUP_NAME3 $CGROUP_NAME4

chmod a+rx $CGROUP_NAME1
chmod a+rx $CGROUP_NAME2
chmod a+rx $CGROUP_NAME3
chmod a+rx $CGROUP_NAME4

echo "Mounting cgroups at $MOUNT_POINT/$CGROUP_NAME1"
echo "Mounting cgroups at $MOUNT_POINT/$CGROUP_NAME2"
echo "Mounting cgroups at $MOUNT_POINT/$CGROUP_NAME3"
echo "Mounting cgroups at $MOUNT_POINT/$CGROUP_NAME4"

echo "Aviable controller types:"
cat cgroup.controllers

echo "Default controller"
cat cgroup.subtree_control

bash -c 'echo '+cpu' > cgroup.subtree_control'
bash -c 'echo '+cpuset' > cgroup.subtree_control'

# assign core to cpusets
CORE_VAL1=0
CORE_VAL2=1
CORE_VAL3=2
CORE_VAL4=3
echo $CORE_VAL1 > /sys/fs/cgroup/$CGROUP_NAME1/cpuset.cpus
echo $CORE_VAL2 > /sys/fs/cgroup/$CGROUP_NAME2/cpuset.cpus
echo $CORE_VAL3 > /sys/fs/cgroup/$CGROUP_NAME3/cpuset.cpus
echo $CORE_VAL4 > /sys/fs/cgroup/$CGROUP_NAME4/cpuset.cpus


# echo "session started inside $CGROUP_NAME"
# echo $$ | sudo tee /sys/fs/cgroup/$CGROUP_NAME/cgroup.procs
echo "Cgroup V2 Created!"