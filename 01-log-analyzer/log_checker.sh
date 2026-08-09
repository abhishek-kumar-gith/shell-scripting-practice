#!/bin/bash

################
#Author : Abhishek 
#Date :08/2026
#this is a log checker cout the number of error ,ot info present 
###############

echo "========================="

echo "     SERVER LOG REPORT    "

echo "========================="



INFO_COUNT=$(grep -c "INFO" server.log)

#echo " INFO     : $INFO_COUNT"

printf "%-8s : %s\n" "INFO"  "$INFO_COUNT"


WARNING_COUNT=$(grep -c "WARNING" server.log)

#echo " Warning :$WARNING_COUNT"

printf  "%-8s : %s\n" "WARNING" "$WARNING_COUNT"

ERROR_COUNT=$(grep -c "ERROR" server.log)

#echo " ERROR   :$ERROR_COUNT"
 
printf "%-8s : %s\n" "ERROR" "$ERROR_COUNT"

if [ $ERROR_COUNT -gt 0 ]
then 
       #echo "STATUS : CRITICAL"
	echo "STATUS : CRITICAL"
	echo "---------ERROR DETAILS----------"
	grep "ERROR" server.log

else 
	echo "status is healthy"

fi

echo "================================="

#NAME_ERROR=$(grep "ERROR" server.log)

#echo $NAME_ERROR
