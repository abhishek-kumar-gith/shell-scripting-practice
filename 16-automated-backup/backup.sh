#!/bin/bash


###########################
#Author : Abhishek 
#
#This is Automated backup 
#
##########################


if [ "$#" -ne 2 ]
then
    echo "Usage: $0 <source_directory> <backup_directory>"
    exit 1
fi


source_dir="$1"
backup_dir="$2"
log_file="backup.log"

if [ ! -d "$source_dir" ]
then
    echo "Error: Source directory does not exist."
    exit 1
fi



if [ ! -d "$backup_dir" ]
then
    echo "Backup directory does not exist. Creating it..."
    mkdir -p "$backup_dir"
fi


timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
backup_path="$backup_dir/backup_$timestamp"

mkdir -p "$backup_path"
cp -r "$source_dir"/* "$backup_path/"

if [ "$?" -eq 0 ]
then
    echo "Backup completed successfully."
    echo "$(date): Backup successful - $backup_path" >> "$log_file"
else
    echo "Backup failed."
    echo "$(date): Backup failed" >> "$log_file"
    exit 1
fi

backup_size=$(du -sh "$backup_path" | cut -f1)

echo "Backup Size: $backup_size"
echo "Backup Location: $backup_path"
echo "Backup completed successfully."



echo "Backup path: $backup_path"



echo "Source: $source_dir"
echo "Backup Destination: $backup_dir"
