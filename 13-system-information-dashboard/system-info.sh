#!/bin/bash


######################
#Author : Abhishek
#
#This is System Information
#
#####################


echo "================================="
echo "      SYSTEM INFORMATION"
echo "================================="


show_basic_info(){

	echo "Hostname: $(hostname)"
	echo "Current User : $(whoami)"
	 echo "OS: $(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '\"')"
    	echo "Kernel: $(uname -r)"
}

show_uptime() {
    echo "Uptime: $(uptime -p)"
}


show_memory() {
    echo "Memory Usage:"
    free -h
}

show_disk() {
    echo "Disk Usage:"
    df -h /
}


show_cpu() {
    echo "CPU Information:"
    echo "CPU Model: $(grep "model name" /proc/cpuinfo | head -n 1 | cut -d: -f2 | xargs)"
    echo "CPU Cores: $(nproc)"
}

show_basic_info
echo "---------------------------------"

show_uptime
echo "---------------------------------"

show_memory
echo "---------------------------------"
show_disk
echo "---------------------------------"

show_cpu
echo "================================="

echo "System information collected successfully."
