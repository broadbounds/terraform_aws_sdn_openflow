#!/bin/bash

# install dependencies
apt install ca-certificates openjdk-8-jdk pkg-config gcc make ant g++ maven git libboost-dev libcurl4-openssl-dev libssl-dev unixodbc-dev libjson0-dev cmake libgtest-dev postgresql-9.5 postgresql-client-9.5 postgresql-client-common postgresql-contrib-9.5 odbc-postgresql cmake libgtest-dev sshpass screen

# set JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

# make Gtest
cp -r /usr/src/gtest ./gtest-work
cd gtest-work
cmake CMakeLists.txt
make
cp *.a /usr/lib
cd ..

# download ODL distribution
wget https://nexus.opendaylight.org/content/repositories/public/org/opendaylight/integration/distribution-karaf/0.6.2-Carbon/distribution-karaf-0.6.2-Carbon.tar.gz
tar xvf /root/odl/distribution-karaf-0.6.2-Carbon.tar.gz
ln -s $(pwd)/distribution-karaf-0.6.2-Carbon /etc/sdn

# run Karaf (ODL main process) in screen
screen -d -S karaf -m bash -c '/etc/sdn/bin/karaf'
