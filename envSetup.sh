#!/bin/bash

sudo killall openvpn
sleep 5 

sudo ufw disable
sleep 20

UDP_HOME=etc/openvpn
SERVER_EXT=nordvpn.com.udp1194.ovpn
KILLSWITCHFILE=/home/pi/scripts/autoKillSwitch.sh
LOGFILE=/home/pi/logs/vpnAddresses.txt
DATE=$(date)

SERVER_LINE=`cat /$UDP_HOME/us$1.$SERVER_EXT | grep remote -m 1 | grep -oP "(?<=remote )[^ ]+"`

echo >> "$LOGFILE"
echo $DATE >> "$LOGFILE"
echo Server Address $SERVER_LINE >> "$LOGFILE"
echo Server# $1 >> "$LOGFILE"

echo "sudo ufw reset" > "$KILLSWITCHFILE"
echo "sudo ufw allow in to 192.168.1.0/24" >> "$KILLSWITCHFILE"
echo "sudo ufw allow out to 192.168.1.0/24" >> "$KILLSWITCHFILE"
echo "sudo ufw default deny outgoing" >> "$KILLSWITCHFILE"
echo "sudo ufw default deny incoming" >> "$KILLSWITCHFILE"
echo "sudo ufw allow out on tun0 from any to any" >> "$KILLSWITCHFILE"
echo "sudo ufw allow out to $SERVER_LINE port 1194 proto udp" >> "$KILLSWITCHFILE"
echo "sudo ufw allow in on tun0 from any to any" >> "$KILLSWITCHFILE"
echo "sudo ufw enable" >> "$KILLSWITCHFILE"

chmod 777 "$KILLSWITCHFILE"

sudo openvpn /$UDP_HOME/us$1.$SERVER_EXT &

sleep 10

yes | "$KILLSWITCHFILE" &
