#!/bin/bash
#
#this script is to automate compression of files and directories in .gz  .tar  .tar.gz
#
#
set -e 
read -p "Enter the file you want to compress < example file.txt>" filename

if [ -f $filename  ] || [ -d $filename ]; then
	echo "File/Directory exists continuing"
else
	echo "THE FILE OR DIRECTORY DOES NOT EXIST!"
fi


directory=$(pwd)
read -p "Your current working directory is "$directory" do you wish to continue in this directory y/n ? : " check

case $check in

        "y")
		echo ".......creating Archive in $directory "
		;;

	"n")
		read -p "Specify path to directory <Note: Include forward slash at the end to indicate the directory> : " cst_directory
		if [ -d $cst_directory ]; then
			echo " Directory exists continuing"
		else
			echo " DIRECTORY DOES NOT EXIST SORRY "
		fi
		;;
	*)
		echo " Invalid input"
		;;
esac

read -p "Specify new archive <name> Note: <Include dot extension to the new name <example newfile.gz/tar/.gz.tar> >: " archive_name
compress=$(tar -caf "$cst_directory/$archive_name" $filename)
$compress
echo "Archive $archive_name has been created successfully, preview in the $cst_directory"

#case $tar_c in

	#".gz")
	#	echo "...... Creating Archive..... "$filename$ext"" 
	#	gzip "-9" -V "$filename$ext"
              #	echo "$filename$ext created successfully"
	#	;;
#	"tar")
#		read -p " Specify a  new archive <name> Note: <Include .tar  extension to the new name> : " tar_c
#		tar -cf "$tar_c" "$filename"
#		echo "..... Creating Archive..... "$filename$ext""
#		tar -cf "$tar_c" "$filename$ext"
				
#		;;
 #       *)

#	        echo "Invalid compression type"
#esac


