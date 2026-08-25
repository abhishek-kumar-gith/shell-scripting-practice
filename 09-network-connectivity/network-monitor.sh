#!/bin/bash


####################
#Author : Abhishek
#
#This is network connectivity checker
#
######################


if [ -z "$1 " ]
then
	read -p  "Enter the name of service:" service_name
else
	host_name=$1
fi


if [ -z "$host_name" ]
then 
	echo "Please enter valid service name"
	exit 1

fi




echo "Checking Internet Connection........."

ping -c 1 "$host_name" > /dev/null 2>&1

if [ $? -eq 0 ]
then
	echo "Internet is connected"
else
	echo "Internet is not connected"
fi
