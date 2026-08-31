#!/bin/bash


####################
#Author :Abhishek
#
#
#File Organizer
#
###########



source_dir="test-files"



mkdir -p "$source_dir/Images"
mkdir -p "$source_dir/Documents"
mkdir -p "$source_dir/Scripts"
mkdir -p "$source_dir/Others"



for file in "$source_dir"/*
do
    
if [ -f "$file" ]
then
	
case "$file" in
    *.jpg|*.png)
        mv "$file" "$source_dir/Images/"
        ;;

    *.txt|*.pdf|*.csv)
        mv "$file" "$source_dir/Documents/"
        ;;

    *.sh)
        mv "$file" "$source_dir/Scripts/"
        ;;

    *)
        mv "$file" "$source_dir/Others"
        ;;

			

esac
fi
done
