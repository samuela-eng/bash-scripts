#!/bin/bash
#
#Script for a file organiser based on the extention

set -e 
set -o pipefail

file(){
	echo "Enter file name"
	read -p "File name:" filename
	read -p "etensionn:" ext
	#read -p  "Specify directory/subdirectory to create your file" d
	x=".txt"
	if [ $ext = $x ]; then
		echo "Creating" "$filename $ext" ".............."
		files= $(touch $filename$ext)
		$files

	else
		echo "Invalid file type. This script only creates .txt files"
	fi	

}

file 








