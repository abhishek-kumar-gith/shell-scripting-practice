!/bin/bash


####################
#Author : Abhishek
#
#This is user manganemt In this You  can add user,Delete User,Check User,Exit
#######################



echo "=========User Management System======="


echo "1.Add User"
echo "2.Delete User"
echo "3.Check User"
echo "4.Exit"



read -p "Enter Your Choice :" choice

case $choice in 
	1)
		read -p "Enter Username to add:" username

		if id "$username" &>/dev/null
		then 
			echo "User $username already exists"
		else
			sudo useradd -m "$username"
			echo "User $username added Successfully"
		fi
		;;
	2)
		read -p "Enter the Username to delete :"  username

		if id "$username" &>/dev/null
		then
			sudo userdel -r "$username"
			echo "User $username deleted Sucessfully"
		else
			echo "User $username does not exist"
		fi
		;;
	3)
		read -p "Enter Username to Check :" username

		if id "$username" &>/dev/null
		then
			echo "USer $username exists"
		else
			echo "User $username does not exists"
		fi
		;;

	4)
		
    		echo "Exiting User Management System..."
    			exit 0
    
		;;
	*)

		echo "Invalid Choice PLease Enter 1 to 4"
		;;
esac
