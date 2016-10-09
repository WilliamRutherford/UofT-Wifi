#!/bin/bash
#DIR represents the directory where all request files are saved to.
DIR=UTWI


#WARNING!!! DO NOT MODIFY FILE.
FILE="popUp.php?name=00"

build_to_num(){

	echo "not implemented"	

}

file_to_build(){

	get_file

	cat  "$FILE" | grep -o '<CENTER>.*</CENTER>' | sed 's/<CENTER>//' | sed 's:</CENTER>::' | tr -d "\n"

}

file_to_AP(){

	get_file	

	cat  "$FILE" | grep -o ':.*<p' | sed 's/.*: //' | sed 's/<P.*//' | tr -d "\n"
}

get_file(){


	if [ ! -d "$DIR" ]; then

		mkdir "$DIR"
	fi

	cd "$DIR"

	wget -qN  "http://utsc.utoronto.ca/webapps/wirelessmap/$FILE"

}

#Values of $1:
#1   AA
#2   AC
#3   BW
#4   HW
#5   MW
#6   SL
#7   SY
#8   SW
#9   SRC
#10  IC
#11  CCC
#12  RC
#13  PO
#14  MLH
#15  SR1
#16  SR2
#17  JFH
#18  NR


if [ "$#" -eq 0 ]; then
	echo "no arguments"

elif [ "$#" -eq 1 ]; then
	if [ "$1" = "-f" ]; then
		#returns fastest connection
		echo "unimplemented"
	elif [ "$1" = "-a" ]; then
		#returns all connections
		for i in {1..18}
		do
			./UofT-Wifi.sh -o "$i"
		done
	elif [ "$1" = "-h" ]; then
		#returns help dialogue
		echo "unimplemented"
	fi

elif [ "$#" -eq 2 ]; then
	if [ $1 = "-n" ]; then
	#the case where $2 is a number
		if  [ $2 -lt 10 ]; then
			FILE="$FILE""0"
		fi
		FILE="$FILE$2"

		get_file
		
		file_to_build
		echo "\n"
		echo -n 'Average number of connections per AP : '
		file_to_AP
		echo "\n"
	elif [ "$1" = "-o" ]; then
		
		if  [ $2 -lt 10 ]; then
			FILE="$FILE""0"
		fi
		FILE="$FILE$2"

		get_file
		file_to_build 
		echo -n "     connect/AP:  "
		file_to_AP
		echo -e

	elif [ "$1" = "-b" ]; then
		#the case where $b is a 2 or 3 digit code to represent a building.
		echo "unimplemented"
	fi
fi
