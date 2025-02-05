#!/bin/bash

add_user(){
	read -p "Enter username: " username
	stty -echo # Turn off echo
	read -p "Enter password: " password 
	stty echo # Turn on echo
	echo      # Move to the next line after the password input
	# Additional user detail input here 
	sudo useradd -m -p $(openssl passwd -1 "$password") "$username"
}

delete_user(){
	read -p "Enter username to delete: " username
	sudo userdel -r "$username"
}

modify_user(){
	read -p "Enter username to modify: " username
	# Additional modification options here 
	sudo usermod "$username"
}

# Main script
echo "User Management Script"
echo "1. Add User"
echo "2. Delete User"
echo "3. Modify User"
read -p "Enter your choice: " choice

case $choice in
    1) add_user ;;
    2) delete_user ;;
    3) modify_user ;;
    *) echo "Invalid choice";;
esac