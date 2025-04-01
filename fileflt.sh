#!/bin/bash
#
#Script for a file organiser based on the extention

set -e 
set -o pipefail

file(){
	read -p  "Specify path to directory to create your file in : " d
	if [ -d $d  ]; then
		echo "Specified Directory exists"
	else
	        echo " Specified directory does not exist"
		exit 1
	fi

	read -p " Enter file name to create : " filename

	if [ -d $filename ]; then
		echo " ERROR: DIRECTORY ......ignored"
		exit 1
	else
		:
	fi


	read -p " Specify extension type in format <.targetextension> : " ext

	directory=$d
	file="$filename$ext"


	if [ -e "$directory/$filename$ext" ]; then
		echo " ERROR: FILE ALREADY EXISTS IN THIS DIRECTORY"
		exit 1
	else
		:
	fi

	case $ext  in
		".txt"|".md"|".tmp"| ".env"| ".cfg"| ".log"| ".sh")
			touch "$filename$ext" | mv "$filename$ext"  "$d"
			echo "$filename$ext has been created in the $d directory : "
			;;

		".gz"|".tar"|".tar.gz")
			echo " This file type is out of the scope of this program. Please refer to compress.sh from the remote repo samuela-eng/bash-script for creating archives."
			;;

		*)
			echo "file creation failed extention type not supported"
	esac
		



}

file 








