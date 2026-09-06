#!/bin/bash



#################################
#Author :Abhisehek Kumar
#
#This is Interactive System Adminstration Menu
#
########################


trap 'echo; echo "Exiting System Admin Menu..."; exit 0' SIGINT


check_cpu() {
    echo "CPU Usage:"
    top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}'
}


check_memory() {
    echo "Memory Usage:"
    free | awk '/Mem:/ {printf "%.0f%%\n", $3/$2 * 100}'
}

check_disk() {
    echo "Disk Usage:"
    df / | awk 'NR==2 {print $5}'
}

check_service() {
    echo "Service Status:"

    service_name="ssh"

    if systemctl is-active --quiet "$service_name"
    then
        echo "$service_name is running."
    else
        echo "$service_name is NOT running."
    fi
}

check_network() {
    echo "Network Status:"

    if ping -c 1 -W 2 8.8.8.8 &>/dev/null
    then
        echo "Network is connected."
    else
        echo "Network is NOT connected."
    fi
}


show_system_info() {
    echo "================================="
    echo "       SYSTEM INFORMATION"
    echo "================================="

    echo "Hostname: $(hostname)"
    echo "Current User: $(whoami)"
    echo "OS: $(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')"
    echo "Kernel: $(uname -r)"
    echo "Uptime: $(uptime -p)"
}

while true 
do
       clear

	echo "==============================="
	echo "      SYSTEM ADMIN MENU"
	echo "==============================="
	echo "1. CPU Status"
    	echo "2. Memory Status"
    	echo "3. Disk Status"
    	echo "4. Service Status"
    	echo "5. Network Status"
    	echo "6. System Information"
    	echo "7. Exit"
    	echo "================================="

	read -p "Enter your choice :" choice
	case "$choice" in
        1)
            check_cpu
            ;;
        2)
            check_disk
            ;;
        3)
            check_memory
            ;;
        4)
            check_service
            ;;
        5)
            check_network
            ;;
        6)
            show_system_info
            ;;
        7)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter 1-7."
            ;;
    esac

    echo

    read -p "Press enter to continue...."
done
