#!/bin/bash

DIR=UofTwifiInfo
FILE="popUp.php?name=0010"

if [ ! -d "$DIR" ]; then

	mkdir "$DIR"
fi

cd "$DIR"

if [ "$FILE" ]; then

	rm "$FILE"
fi

wget -q  "http://utsc.utoronto.ca/webapps/wirelessmap/$FILE"

cat "$FILE" | grep -o '<CENTER>.*</CENTER>' | sed 's/<CENTER>//' | sed 's:</CENTER>::'

cat "$FILE" | grep -o 'Average number of connections per AP :.*<p' | sed 's/<P.*//'
