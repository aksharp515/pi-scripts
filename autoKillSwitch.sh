sudo ufw reset
sudo ufw allow in to 192.168.1.0/24
sudo ufw allow out to 192.168.1.0/24
sudo ufw default deny outgoing
sudo ufw default deny incoming
sudo ufw allow out on tun0 from any to any
sudo ufw allow out to 155.94.183.5 port 1194 proto udp
sudo ufw allow in on tun0 from any to any
sudo ufw enable
