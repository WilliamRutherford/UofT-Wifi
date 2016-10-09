#!/bin/bash

DIR=UofTWirelessInfo
FILE="popUp.php?name=00"

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
	echo "no argument"
fi

if [ $1 -lt 10 ]; then
	FILE="$FILE""0""$1"
else
	FILE=$FILE$1
fi

if [ ! -d "$DIR" ]; then

	mkdir "$DIR"
fi

cd "$DIR"

wget -qN  "http://utsc.utoronto.ca/webapps/wirelessmap/$FILE"

cat "$FILE" | grep -o '<CENTER>.*</CENTER>' | sed 's/<CENTER>//' | sed 's:</CENTER>::'

cat "$FILE" | grep -o 'Average number of connections per AP :.*<p' | sed 's/<P.*//'
