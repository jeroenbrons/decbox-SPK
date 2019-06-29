#!/bin/bash
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
/home/pi/l2tp.sh
sudo ip tuntap add mode tap choa
sudo ip tuntap add mode tap infsrv

sudo brctl addbr DECnet
sudo brctl stp DECnet off
sudo brctl setfd DECnet 0

sudo brctl addif DECnet l2tpeth0
sudo brctl addif DECnet infsrv
sudo brctl addif DECnet choa
sudo ifconfig DECnet up
sudo ifconfig infsrv up
sudo ifconfig choa up


