#!/bin/bash


##############################
#Author : Abhishek 
#
#This is Service Monitor 
#
###############################


#!/bin/bash

service_name="$1"
interval="$2"
log_file="service-monitor.log"
max_retries=3
retry_count=0

trap 'echo; echo "Service monitoring stopped."; exit 0' SIGINT

if [ "$#" -ne 2 ]
then
    echo "Usage: $0 <service_name> <interval_seconds>"
    exit 1
fi

echo "================================="
echo "      SERVICE MONITOR"
echo "================================="
echo "Monitoring service: $service_name"

while true
do
    echo "Checking service: $service_name"
     echo "$(date): Checking service $service_name" >> "$log_file"

    if systemctl is-active --quiet "$service_name"
    then
     
	    echo "Service $service_name is running."
        echo "$(date): Service $service_name is running" >> "$log_file"
	    retry_count=0

    else
        echo "Service $service_name is NOT running."
	echo "$(date): Service $service_name is NOT running" >> "$log_file"
        echo "Attempting to restart $service_name..."
	echo "$(date): Restart attempt $retry_count/$max_retries" >> "$log_file"

        retry_count=$((retry_count + 1))

        echo "Restart attempt: $retry_count/$max_retries"

        sudo systemctl restart "$service_name"

        if systemctl is-active --quiet "$service_name"
        then
            echo "Service $service_name restarted successfully."
	    echo "$(date): Service $service_name restarted successfully" >> "$log_file"
            retry_count=0

        else
            echo "Failed to restart $service_name."
	    echo "$(date): Failed to restart $service_name" >> "$log_file"

            if [ "$retry_count" -ge "$max_retries" ]
            then
                echo "Maximum restart attempts reached."
		echo "$(date): Maximum restart attempts reached" >> "$log_file"
                echo "Service could not be recovered."
                exit 1
            fi
        fi
    fi

    sleep "$interval"
done
