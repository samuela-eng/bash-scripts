#!/bin/bash
set -e 
# Script to automate user delete recursively]

 

system_user_del(){
	echo "specify user you would like to delete"
	read  username
	echo "User about to be deleted, are you sure you want to delete the user $username and it's files?"
	read ans
	if [ $ans = yes ]; then
	        delusr=$(sudo userdel -r $username)
		echo "The user" $username "has been sucessfuly deleted"
	fi
}

system_user_del
