#!/bin/bash
#
#this is process checker
############

#process_name="$1"

#read -p "Enter the process name :" process_name
#PROCESS=$(ps -ef | grep "$process_name" | grep -v grep)

if [ -z "$1" ]
then
    read -p "Enter process name: " process_name
else
    process_name="$1"
fi

PROCESS=$(pgrep -x "$process_name")
echo $PROCESS

if [ "$PROCESS" ]
then 
	STATUS="RUNNNING"
	ACTION="kill the process"

else
	STATUS="NOT RUNNING"
	ACTION="Start the process"
fi

printf "%-7s : %s\n" "PROCESS" "$process_name"
printf "%-7s : %s\n" "STATUS" "$STATUS"
printf "%-7s : %s\n" "ACTION" "$ACTION"
