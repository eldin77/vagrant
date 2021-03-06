#!/bin/bash

sudo ifconfig eth1 172.16.250.15/24 up

sudo apt-get install -y vlan iperf
sudo modprobe 8021q
sudo ifconfig eth2 up
sudo vconfig add eth2 2001
sudo ifconfig eth2.2001 192.168.1.1/24 up
