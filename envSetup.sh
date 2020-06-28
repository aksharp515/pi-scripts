#!/bin/bash

UDP_HOME=etc/openvpn
SERVER_EXT=nordvpn.com.udp1194.ovpn

SERVER_LINE=`cat /$UDP_HOME/us$1.$SERVER_EXT | grep remote -m 1 | grep -oP "(?<=remote )[^ ]+"`

DATE=$(date)
echo >> ~/logs/vpnAddresses.txt
echo $DATE >> ~/logs/vpnAddresses.txt
echo Server Address $SERVER_LINE >> ~/logs/vpnAddresses.txt
echo Server# $1 >> ~/logs/vpnAddresses.txt

echo "sudo ufw reset" > /home/pi/scripts/autoKillSwitch.sh
echo "sudo ufw allow in to 192.168.1.0/24" >> /home/pi/scripts/autoKillSwitch.sh
echo "sudo ufw allow out to 192.168.1.0/24" >> /home/pi/scripts/autoKillSwitch.sh
echo "sudo ufw default deny outgoing" >> /home/pi/scripts/autoKillSwitch.sh
echo "sudo ufw default deny incoming" >> /home/pi/scripts/autoKillSwitch.sh
echo "sudo ufw allow out on tun0 from any to any" >> /home/pi/scripts/autoKillSwitch.sh
echo "sudo ufw allow out to $SERVER_LINE port 1194 proto udp" >> /home/pi/scripts/autoKillSwitch.sh
echo "sudo ufw allow in on tun0 from any to any" >> /home/pi/scripts/autoKillSwitch.sh
echo "sudo ufw enable" >> /home/pi/scripts/autoKillSwitch.sh

chmod 777 /home/pi/scripts/autoKillSwitch.sh 

sudo openvpn /$UDP_HOME/us$1.$SERVER_EXT


