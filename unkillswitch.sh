#!/bin/bash

sudo ufw reset 
sudo ufw allow in to 192.168.1.0/24 
sudo ufw allow out to 192.168.1.0/24
sudo ufw default allow incoming
sudo ufw default allow outgoing
sudo ufw enable 

