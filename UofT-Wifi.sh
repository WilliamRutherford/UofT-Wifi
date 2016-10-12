#/bin/bash
#DIR represents the directory where all request files are saved to.
DIR="$(cat .UofT-Wifi.conf | grep "DIR" | sed 's/DIR=//')/"
NAME="$(cat .UofT-Wifi.conf | grep "NAME" | sed 's/NAME=//')/"


#WARNING!!! DO NOT MODIFY FILE.
FILE="popUp.php?name=00"


file_to_build(){

	get_file
	cd "$DIR$NAME"
	cat  "$FILE" | grep -o '<CENTER>.*</CENTER>' | sed 's/<CENTER>//' | sed 's:</CENTER>::' | tr -d "\n"
	cd ..
}

num_to_build(){

	cd "$DIR$NAME"
	BUILD=$(cat buildings.txt | grep "^$1:" | sed 's/.*://')
	echo -n "$BUILD"
	cd ..
}

build_to_num(){

	cd "$DIR$NAME"
	BUILD=$(cat buildings.txt | grep "$1" | sed 's/:.*//')
	echo -n "$BUILD"
	cd ..
}

file_to_AP(){

	get_file	
	cd "$DIR$NAME"
	cat  "$FILE" | grep -o ':.*<p' | sed 's/.*: //' | sed 's/<P.*//' | tr -d "\n"
	cd ..
}

num_to_AP(){

	/UofT-Wifi.sh -c "$1"
}

get_file(){

	cd "$DIR"
	if [ ! -d "$NAME" ]; then

		mkdir "$NAME"
	fi

	cd "$DIR$NAME"

	wget -qN  "http://utsc.utoronto.ca/webapps/wirelessmap/$FILE"
	cd ..
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
		FAST=1 #stores the number of the fastest connection
		CURR=1 #stores the current connection to check
		FASTSPEED=100
		CURRSPEED=100
		for i in {2..18}
		do
			CURR="$i"
			CURRSPEED=$(num_to_AP "$CURR")
			FASTSPEED=$(num_to_AP "$FAST")
			if [ "$CURRSPEED" -lt "$FASTSPEED" ]; then
				FAST="$CURR"
			fi 
		done	
		num_to_build "$FAST"
		num_to_AP "$FAST"	

	elif [ "$1" = "-a" ]; then
		#returns all connections
		for i in {1..18}
		do
			num_to_build "$i"
			echo -n "  "
			"$DIR"UofT-Wifi.sh -c "$i"
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
		echo -e
		echo -n 'Average number of connections per AP : '
		file_to_AP
		echo -e
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
	
	elif [ "$1" = "-c" ]; then
		#returns JUST the con/AP for the number $2
		
		if  [ $2 -lt 10 ]; then
			FILE="$FILE""0"
		fi
		FILE="$FILE$2"

		get_file
		file_to_AP
		echo -e	

	elif [ "$1" = "-b" ]; then
		#the case where $b is a 2 or 3 digit code to represent a building.
		NUM=$(build_to_num "$2")
		./UofT-Wifi.sh -n "$NUM"
	fi
fi
