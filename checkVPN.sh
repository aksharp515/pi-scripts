#!/bin/bash
# 0 is connected
# 1 is disconnected
SRC_DIR=`dirname $0`
DISCONNECTED=0
PREV=1
touch /home/pi/logs/continue-checking
cur_time=$(date)
echo STARTING connection check at $cur_time > /home/pi/logs/output.txt 
while [ -f /home/pi/logs/continue-checking ]
do 
	curl ifconfig.me >/dev/null 2>&1
	if [ $? -ne 0 ]; then #if curl exits non-zero
		cur_time=$(date)
		if [ $PREV == 0 ];
			echo $cur_time Fail to obtain IP >> /home/pi/logs/output.txt
		fi
		let DISCONNECTED=1 
		#rm continue-checking
	else  
		let DISCONNECTED=0
		sleep 5
	fi 
	if [ $PREV == 1 ] && [ $DISCONNECTED == 0 ]; then  
		cur_time=$(date)
		echo Connection Re-Established at $cur_time >> /home/pi/logs/output.txt
	fi
	PREV=$DISCONNECTED
done 
	 

