#!/bin/bash

# Customer Node
# MGMT 인터페이스(eth1)로 다른 노드들과 통신
# GREEN 인터페이스(eth2)로 vUTM과 통신
sudo ifconfig eth1 10.0.0.101/24 up

echo "1. configure apt-get proxy"
CACHE_SERVER="211.224.204.145:23142"
sudo cat > /etc/apt/apt.conf.d/02proxy <<EOF
Acquire::http { Proxy "http://$CACHE_SERVER"; };
EOF

echo "2. apt-get update"
sudo apt-get update

echo "3. apt-get install vlan iperf"
sudo apt-get install -y vlan iperf
sudo modprobe 8021q