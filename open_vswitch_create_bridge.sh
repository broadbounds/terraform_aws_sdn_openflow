ovs-vsctl add-br br0

ovs-vsctl add-port br0 br0-int -- set interface br0-int type=internal
