#!/bin/bash

CGROUP_NAME1="DUT1"
CGROUP_NAME2="DUT2"
CGROUP_NAME3="DUT3"
CGROUP_NAME4="DUT4"
CGROUP_NAME5="DUT5"
CGROUP_NAME6="DUT6"
CGROUP_NAME7="DUT7"
CGROUP_NAME8="DUT8"
CGROUP_NAME9="DUT9"
CGROUP_NAME10="DUT10"
CGROUP_NAME11="DUT11"
CGROUP_NAME12="DUT12"
CGROUP_NAME13="DUT13"
CGROUP_NAME14="DUT14"
CGROUP_NAME15="DUT15"
CGROUP_NAME16="DUT16"


MOUNT_POINT="/sys/fs/cgroup"

cd $MOUNT_POINT

rmdir DUT*

mkdir -p $CGROUP_NAME1 $CGROUP_NAME2 $CGROUP_NAME3 $CGROUP_NAME4 $CGROUP_NAME5 $CGROUP_NAME6 $CGROUP_NAME7 $CGROUP_NAME8 $CGROUP_NAME9 $CGROUP_NAME10 $CGROUP_NAME11 $CGROUP_NAME12 $CGROUP_NAME13 $CGROUP_NAME14 $CGROUP_NAME15 $CGROUP_NAME16

chmod a+rx $CGROUP_NAME1
chmod a+rx $CGROUP_NAME2
chmod a+rx $CGROUP_NAME3
chmod a+rx $CGROUP_NAME4
chmod a+rx $CGROUP_NAME5
chmod a+rx $CGROUP_NAME6
chmod a+rx $CGROUP_NAME7
chmod a+rx $CGROUP_NAME8
chmod a+rx $CGROUP_NAME9
chmod a+rx $CGROUP_NAME10
chmod a+rx $CGROUP_NAME11
chmod a+rx $CGROUP_NAME12
chmod a+rx $CGROUP_NAME13
chmod a+rx $CGROUP_NAME14
chmod a+rx $CGROUP_NAME15
chmod a+rx $CGROUP_NAME16

echo "Mounting cgroups at $MOUNT_POINT/$CGROUP_NAME1"
echo "Mounting cgroups at $MOUNT_POINT/$CGROUP_NAME2"
echo "Mounting cgroups at $MOUNT_POINT/$CGROUP_NAME3"
echo "Mounting cgroups at $MOUNT_POINT/$CGROUP_NAME4"
echo "Mounting cgroups at $MOUNT_POINT/$CGROUP_NAME5"
echo "Mounting cgroups at $MOUNT_POINT/$CGROUP_NAME6"
echo "Mounting cgroups at $MOUNT_POINT/$CGROUP_NAME7"
echo "Mounting cgroups at $MOUNT_POINT/$CGROUP_NAME8"
echo "Mounting cgroups at $MOUNT_POINT/$CGROUP_NAME9"
echo "Mounting cgroups at $MOUNT_POINT/$CGROUP_NAME10"
echo "Mounting cgroups at $MOUNT_POINT/$CGROUP_NAME11"
echo "Mounting cgroups at $MOUNT_POINT/$CGROUP_NAME12"
echo "Mounting cgroups at $MOUNT_POINT/$CGROUP_NAME13"
echo "Mounting cgroups at $MOUNT_POINT/$CGROUP_NAME14"
echo "Mounting cgroups at $MOUNT_POINT/$CGROUP_NAME15"
echo "Mounting cgroups at $MOUNT_POINT/$CGROUP_NAME16"


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
CORE_VAL9=41
CORE_VAL10=42
CORE_VAL11=43
CORE_VAL12=44
CORE_VAL13=45
CORE_VAL14=46
CORE_VAL15=47
CORE_VAL16=48


echo $CORE_VAL1 > /sys/fs/cgroup/$CGROUP_NAME1/cpuset.cpus
echo $CORE_VAL2 > /sys/fs/cgroup/$CGROUP_NAME2/cpuset.cpus
echo $CORE_VAL3 > /sys/fs/cgroup/$CGROUP_NAME3/cpuset.cpus
echo $CORE_VAL4 > /sys/fs/cgroup/$CGROUP_NAME4/cpuset.cpus
echo $CORE_VAL5 > /sys/fs/cgroup/$CGROUP_NAME5/cpuset.cpus
echo $CORE_VAL6 > /sys/fs/cgroup/$CGROUP_NAME6/cpuset.cpus
echo $CORE_VAL7 > /sys/fs/cgroup/$CGROUP_NAME7/cpuset.cpus
echo $CORE_VAL8 > /sys/fs/cgroup/$CGROUP_NAME8/cpuset.cpus
echo $CORE_VAL9 > /sys/fs/cgroup/$CGROUP_NAME9/cpuset.cpus
echo $CORE_VAL10 > /sys/fs/cgroup/$CGROUP_NAME10/cpuset.cpus
echo $CORE_VAL11 > /sys/fs/cgroup/$CGROUP_NAME11/cpuset.cpus
echo $CORE_VAL12 > /sys/fs/cgroup/$CGROUP_NAME12/cpuset.cpus
echo $CORE_VAL13 > /sys/fs/cgroup/$CGROUP_NAME13/cpuset.cpus
echo $CORE_VAL14 > /sys/fs/cgroup/$CGROUP_NAME14/cpuset.cpus
echo $CORE_VAL15 > /sys/fs/cgroup/$CGROUP_NAME15/cpuset.cpus
echo $CORE_VAL16 > /sys/fs/cgroup/$CGROUP_NAME16/cpuset.cpus


# echo "session started inside $CGROUP_NAME"
# echo $$ | sudo tee /sys/fs/cgroup/$CGROUP_NAME/cgroup.procs
echo "Cgroup V2 Created!"