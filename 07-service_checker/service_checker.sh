#!/bin/bash

#######
#Author :Abhishek
#This is service checker
#########
service_name=$1


if [ -z "$service_name" ]
then
	read -p "Enter the name of service:" service_name
fi

if  ! systemctl list-unit-files "$service_name.service" --no-legend >/dev/null 2>&1
   then
           echo "$service_name service doest not exist"
           exit 1
fi


if   systemctl is-active --quiet "$service_name" 
then 
	echo "$service_name  is running"
else
	echo "$service_name  is not running"

fi


if systemctl is-enabled --quiet "$service_name"
then 
	echo "$service_name is enabled"
else
	echo "$service_name is disabled"
fi
