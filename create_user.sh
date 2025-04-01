#!/bin/bash

set -e
set -o pipefail

#prompt for user name

if [ "$UID" -eq 0 ]; then
	echo "..Root user.."
else
	echo "Not a root user, using sudo"
fi

read -p  "You are creating a new user, enter the name of the new user: " username
read -p "specify primary group to add the user $username to ? " groupname

if  getent group "$groupname" ; then
	echo "...Added user to group <$groupname>"
else
	echo "Group does not exists or is not avaliable sorry"
	exit 1
fi

# creating user and setting up temporary password
temp_pass=newuser010@@
sudo useradd "-ms" /bin/bash "-g" "$groupname"  "$username"
echo "$username:$temp_pass"  | sudo chpasswd
sudo passwd "-e" "$username"


#print the username and password

echo "You created the user:"  $username
echo "Temporary user password "$temp_pass""
echo "User "$username" will be prompted to create a new 12 character strong password upon next login"
