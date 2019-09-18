#!/bin/bash

if  pgrep -x compton > /dev/null 
then 
	killall compton
	killall conky
	killall dunst
	killall clipit
	killall xautolock
	killall polybar
	killall ibus-daemon
	libinput-gestures-setup stop
	notify-send 'Game mode initiated' 'Super+Control+Shift+r to log out'
	exit 0
else
	compton & disown
	conky -q & disown
	exit 0
fi
exit -1
