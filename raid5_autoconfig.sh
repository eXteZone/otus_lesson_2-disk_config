#!/bin/bash
yum -y install mdadm
mdadm --zero-superblock --force /dev/sd{b,c,d}
wipefs --all --force /dev/sd{b,c,d}
mdadm --create --verbose /dev/md0 -l 5 -n 3 /dev/sd{b,c,d}
mkdir /etc/mdadm
echo "DEVICE partitions" > /etc/mdadm/mdadm.conf
mdadm --detail --scan --verbose | awk '/ARRAY/ {print}' >> /etc/mdadm/mdadm.conf
echo "OK"

