#!/bin/bash


#prompt for user name

echo "You are creating a new user, enter the name of the new user admin"
read username
#add user
addusr= $(sudo useradd -m -s /bin/bash $username)
$addusr

#add password
read -p "Enter a valid 12 alpha-numerical user password:" password
echo $username $password | chpasswd

#print the username and password

echo "You created the user:"  $username
