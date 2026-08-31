#!/bin/bash


###########################
#Author :Abhishek
#
#Log Rotation Script
#
################

log_file="server.log"
max_size=1000

if [ ! -f "$log_file" ]
then
    echo "Log file does not exist. Creating a new log file..."
    touch "$log_file"
fi


current_size=$(stat -c%s "$log_file")


echo "Current log file size: $current_size bytes"

if [ "$current_size" -ge "$max_size" ]
then
     timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

    mv "$log_file" "${log_file}_${timestamp}"

    touch "$log_file"

    echo "Log rotated successfully"
else
    echo "Log file size is within the limit"
fi

find . -name "server.log_*" -type f -mtime +7 -delete
