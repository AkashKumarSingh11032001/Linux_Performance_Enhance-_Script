#!/bin/bash

CGROUP_NAME=$1
MOUNT_POINT="/sys/fs/cgroup"

sudo su
cd $MOUNT_POINT
sudo mkdir -p $CGROUP_NAME
sudo chmod a+rx $CGROUP_NAME
echo "Mounting cgroups at $MOUNT_POINT/$CGROUP_NAME"
echo "Aviable controller types:"
sudo cat cgroup.controllers
echo "Default controller"
sudo cat cgroup.subtree_control

sudo bash -c 'echo '+cpu' > cgroup.subtree_control'
sudo bash -c 'echo '+cpuset' > cgroup.subtree_control'

# assign core to cpusets
CORE_VAL=$2
sudo echo $CORE_VAL > /sys/fs/cgroup/$CGROUP_NAME/cpuset.cpus


echo "session started inside $CGROUP_NAME"
echo $$ | sudo tee /sys/fs/cgroup/$CGROUP_NAME/cgroup.procs
echo "Cgroup V2 Created!"