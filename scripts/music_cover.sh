#!/usr/bin/bash

OUTPUT=/tmp/cover.jpg

ffmpeg -i "/home/alex/Music/$(mpc current -f %file%)" -an -c:v copy "$OUTPUT" -y &> /dev/null
STATUS=$?

if [ "$STATUS" -eq 0 ]; then
	echo "$OUTPUT"
else
	echo "null"
fi
