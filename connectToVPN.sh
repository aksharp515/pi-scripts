#!/bin/bash

UDP_HOME=etc/openvpn
SERVER_EXT=nordvpn.com.udp1194.ovpn


sudo openvpn /$UDP_HOME/us$1.$SERVER_EXT
