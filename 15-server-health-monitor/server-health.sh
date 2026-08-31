#!/bin/bash



############################
#Author : Abhishek 
#
#This is server health Checker 
#
################################



echo "================================="
echo "       SERVER HEALTH MONITOR"
echo "================================="

status="HEALTHY"

check_cpu() {
    echo "CPU Usage:"

    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

    echo "$cpu_usage%"


    if (( $(echo "$cpu_usage >= 80" | bc -l) ))
    then
        echo "WARNING: High CPU usage!"
	status="WARNING"
    else
        echo "CPU usage is normal."
    fi
}


check_memory() {
    echo "Memory Usage:"

    memory_usage=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')

    echo "$memory_usage%"

    if [ "$memory_usage" -ge 80 ]
    then
        echo "WARNING: High Memory usage!"
	status="WARNING"
    else
        echo "Memory usage is normal."
    fi
}


check_disk() {
    echo "Disk Usage:"

    disk_usage=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

    echo "$disk_usage%"

    if [ "$disk_usage" -ge 80 ]
    then
        echo "WARNING: High Disk usage!"
	status="WARNING"
    else
        echo "Disk usage is normal."
    fi
}


check_service() {
    echo "Service Status:"

    service_name="ssh"

    if systemctl is-active --quiet "$service_name"
    then
        echo "$service_name is running."
    else
        echo "$service_name is NOT running."
	status="CRITICAL"
    fi
}



check_network() {
    echo "Network Status:"

    if ping -c 1 -W 2 8.8.8.8 &>/dev/null
    then
        echo "Network is connected."
    else
        echo "Network is NOT connected."
	status="CRITICAL"
    fi
}


check_cpu

check_memory

check_disk

check_service

check_network



echo "================================="
echo "Overall Server Status: $status"
echo "================================="
