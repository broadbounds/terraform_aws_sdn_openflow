#!/bin/bash

# install dependencies
apt install git automake autoconf gcc uml-utilities libtool build-essential git pkg-config linux-headers-$(uname -r) iperf screen

# download ovs and unzip
wget https://www.openvswitch.org/releases/openvswitch-2.11.0.tar.gz
tar xvf openvswitch-2.11.0.tar.gz
cd openvswitch-2.11.0

# make OVS
./boot.sh
./configure --with-linux="/lib/modules/${uname -r}/build"
make
make install
make modules_install
modprobe openvswitch
