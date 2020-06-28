#!/bin/bash

UDP_HOME=etc/openvpn/ovpn_udp
SERVER_EXT=nordvpn.com.udp.ovpn

sudo openvpn /$UDP_HOME/us1800.conf &
