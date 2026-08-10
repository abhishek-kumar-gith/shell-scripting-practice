#!/bin/bash
##############
#Author : Abhishek
#Date   :10/08/2026
#This is desk usage checker
###############

echo ================================

echo      DISK USAGE MONITOR

echo ================================

FILESYSTEM=$(df -h / |awk -F " " 'NR==2 {print $1}')


DISK_USAGE=$(df -h / | awk -F " " 'NR==2 {print $5}' | tr -d '%')

#echo $DISK_USAGE

TOTAL_DISK=$(df -h / |awk -F " " 'NR==2 {print $2}')
#echo $TOTAL_DISK

USED_DISK=$(df -h / | awk -F " " 'NR==2 {print $3}')
#echo $USED_DISK

AVAIL_DISK=$(df -h / | awk -F " " ' NR==2 {print $4}')
#echo $AVAIL_DISK

if [ $DISK_USAGE -ge 90 ]
then 
	STATUS="Critical"
	ACTION="Clean the disk"
elif [ $DISK_USAGE -ge 80 ]
then 
	STATUS="Warning"
	ACTION="Disk Almost Full"

else 
	STATUS="Healthy"
	ACTION="No action required"
fi

printf "%-11s : %s\n" "FILESYSTEM" "$FILESYSTEM"
printf "%-11s : %s\n" "TOTAL" "$TOTAL_DISK"
printf "%-11s : %s\n" "USED"   "$USED_DISK"
printf "%-11s : %s\n" "AVAILABLE" "$AVAIL_DISK"
printf "%-11s : %s%%\n" "USAGE" "$DISK_USAGE"
printf "%-11s : %s\n" "STATUS" "$STATUS"
printf "%-11s : %s\n"  "ACTION" "$ACTION"


echo ================================
