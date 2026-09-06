#!/bin/bash


###################
#Author : Abhishek
#
#This is log Analyzer
######################


log_file="application.log"
report_file="log-report.txt"
timestamp=$(date "+%Y-%m-%d %H:%M:%S")

echo "================================="
echo "       LOG ANALYZER"
echo "================================="
echo "Analyzing: $log_file"


if [ ! -f "$log_file" ]
then 
	echo "Error Log file does not exist"
	exit 1
fi

echo "Log file Found : $log_file "

error_count=$(grep -c "ERROR" "$log_file")

echo "ERROR count: $error_count"


warning_count=$(grep -c "WARNING" "$log_file")

echo "WARNING count: $warning_count"


error_threshold=3
warning_threshold=5

if [ "$error_count" -ge "$error_threshold" ]
then
    status="CRITICAL"

elif [ "$warning_count" -ge "$warning_threshold" ]
then
    status="WARNING"

else
    status="NORMAL"
fi

echo "================================="
echo "Log Status: $status"
echo "================================="



echo "=================================" > "$report_file"
echo "        LOG ANALYSIS REPORT" >> "$report_file"
echo "=================================" >> "$report_file"


echo "Analysis Time: $timestamp" >> "$report_file"
echo "Log File: $log_file" >> "$report_file"
echo "ERROR Count: $error_count" >> "$report_file"
echo "WARNING Count: $warning_count" >> "$report_file"
echo "Status: $status" >> "$report_file"

echo "" >> "$report_file"

echo "ERROR Details:" >> "$report_file"
grep "ERROR" "$log_file" >> "$report_file"

echo "" >> "$report_file"

echo "WARNING Details:" >> "$report_file"
grep "WARNING" "$log_file" >> "$report_file"
