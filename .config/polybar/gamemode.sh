#!/bin/bash

if pgrep -x compton > /dev/null 
then 
	echo -e "\tGamemode"
	exit 0
else
	echo -e "\tWorkmode"
	exit 0
fi
echo N/A
exit -1
