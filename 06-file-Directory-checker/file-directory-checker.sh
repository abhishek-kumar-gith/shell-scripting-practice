#!/bin/bash


#################
#Author : Abhishek
#Date   : 10/08/26
#This is file & Directory checker 
################

if [ -z "$1" ]
then
	read -p "Enter the name of file or Folder" file_folder
else 
	file_folder="$1"

fi

echo   "PATH :" "$file_folder"

# [ -e "$file_folder" ] && echo "Exiss"
if [ -e "$file_folder" ]
then
    echo "Exists  : YES"
else
    echo "Does not exist"
    exit 1
fi



# [ -f "$file_folder" ] && echo "file"

#[ -d "$file_folder" ] && echo "Directory"

if [ -f "$file_folder" ]
then
    echo "Type : File"
elif [ -d "$file_folder" ]
then
    echo "Type : Directory"
fi
#[ -r "$file_folder" ] && echo "Readable"


if [ -r "$file_folder" ] 
then
	echo "READABLE : Yes"
else
	echo "READABLE : NO"
fi	


#[ -w  "$file_folder" ] && echo "Writeable"


if [ -w "$file_folder" ]
then
        echo "WRITABLE : Yes"
else
        echo "WRITABLE : NO"
fi


#[ -x "$file_folder" ] && echo "Exectuable"


if [ -x "$file_folder" ]
then
        echo "EXECUTABLE : Yes"
else
        echo "EXECUTABLE : NO"
fi
