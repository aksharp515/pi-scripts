#!/bin/bash
ISRUNNING=`ps -ef | grep deluge-web | grep python | wc -l`
if [ $ISRUNNING -eq 0 ] 
then
	`deluge-web&`
fi
