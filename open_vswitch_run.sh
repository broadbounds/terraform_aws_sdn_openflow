#!/bin/bash

# make ovs directory
mkdir /usr/local/etc/openvswitch

# init db
ovsdb-tool create /usr/local/etc/openvswitch/conf.db vswitchd/vswitch.ovsschema

# run ovs db
screen -d -S ovsdb -m bash -c 'ovsdb-server -v --log-file --pidfile --remote=punix:/usr/local/var/run/openvswitch/db.sock'

# run ovs switch
screen -d -S ovsswitch -m bash -c 'ovs-vswitchd --pidfile'
