#!/bin/bash


#################
#Author: Abhishek
#
#This is Cpu - Monitor
####################


cpu_usage=$(top -bn1 | grep "Cpu(s)" |awk '{print 100 - $8}')


echo "Current CPU Usage: $cpu_usage"


if (( $(echo "$cpu_usage > 80" | bc -l) ))
then 
	echo "Warning :High Cpu Usages!"
fi
