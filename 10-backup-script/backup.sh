#!/bin/bash


#################
#Author : Abhishek 
#
#This is BackUp Script
#
#################



source_path=$1

if [ -z "$source_path" ]
then

	read -p "Enter the file or directory path to backup :" source_path
	
fi


if [ ! -e "$source_path" ]
then 
	echo "File or directory does not exit"
	exit 1
fi

backup_dir="$HOME/backups"

if [ ! -d "$backup_dir" ]
then
    mkdir -p "$backup_dir"
fi

#cp -r "$source_path" "$backup_dir"

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

cp -r "$source_path" "$backup_dir/backup_$timestamp"

echo "Backup completed successfully"
