#!/bin/bash

UDP_HOME=etc/openvpn
SERVER_EXT=nordvpn.com.udp1194.ovpn

SERVER_LINE=`cat /$UDP_HOME/us$1.$SERVER_EXT | grep remote -m 1 | grep -oP "(?<=remote )[^ ]+"`

DATE=$(date)
echo $SERVER_LINE 
