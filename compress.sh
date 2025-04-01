#!/bin/bash
#
#this script is to automate compression of files and directories in .gz  .tar  .tar.gz
#
#
set -e 
read -p "Enter the file you want to compress" fl

if [ -f $fl  ] || [ -d $fl ]; then
	read -p "Enter the archive extension you prefer .gz .tar .tar.gz?" ex
else
	echo "THE FILE OR DIRECTORY DOES NOT EXIST!"
fi

case ${ex} in
	.gz)
		gzip $fl$ex
		echo ".gz Archive file created successfully: "
		;;
	.tar)
		read -p "Desired name for the backup archive: " b
		tar -cvf $b$ex  $fl
		echo ".tar Archive created sucessfully........"
		;;
	.tar.gz)
		read -p "Desired name for the backup archive: " c
		tar -czf $c$ex $fl
		echo ".tar.gz Archive created sucessfully.........."
		;;
	*)
		echo "Invalid compression type"
esac
