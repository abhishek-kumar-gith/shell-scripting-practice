#!/bin/bash

############
#Author : Abhishek
#Date   : 08/08/2026
#This is Memory checker 
##############

echo ================================


echo      MEMEORY HEALTH CHECKER 


echo ================================


TOTAL_MEM=$(free | grep "Mem" | awk -F " " '{print $2}')

printf "%-12s : %s MB\n" "TOTAL MEMORY" $TOTAL_MEM 

USED_MEM=$(free | grep "Mem" | awk -F " " ' {print $3}')
printf  "%-12s : %s MB\n"  "USED MEMORY" $USED_MEM


PERCENTAGE_USAGE=$( awk -v used="$USED_MEM"  -v total="$TOTAL_MEM" 'BEGIN {printf "%d\n" , (used/total)*100} ' )

printf "%-12s : %s%%\n" "Memory USAGE" $PERCENTAGE_USAGE


if [ $PERCENTAGE_USAGE -ge 90 ]
then 
	STATUS="CRITICAL"
	ACTION="Immediate investigation required"
elif [ $PERCENTAGE_USAGE -ge 80 ]
then 
	STATUS="Warning"
	ACTION="MEMORY Usage is High"
else 
	STATUS="HEALTHY"
	ACTION="No action required"
fi

printf "%-12s : %s \n" "STATUS" "$STATUS"
printf "%-12s : %s \n"  "ACTON"  "$ACTION"



echo ================================

