#!/bin/bash

ETH_CON_SYMBOL=""
WLAN_CON_SYMBOL=""
WLAN_OFF_SYMBOL=" "
DISCONNECT_SYMBOL=" " 
CONNECTING_SYMBOL=" "
NO_SIGNAL_SYMBOL=""

# You know what, I hate USB tethering from now on
ADAPTERS=($(ls --hide=lo --color=never /sys/class/net/ | awk '{ print $1  }'))
WLAN_STATE=$(wifi | awk '{ print $3 }')

for ADAPTER in "${ADAPTERS[@]}"; do
	STATE=$(cat "/sys/class/net/${ADAPTER}/operstate")
	if [[ "$ADAPTER" == enp* ]] && ! [ "$STATE" == "down" ]; then
		echo $ETH_CON_SYMBOL 
		exit 0
	elif [ "$WLAN_STATE" == "on" ] && [[ $ADAPTER == wlp* ]] && ! [ "$STATE" == "down" ]; then
		ip_add=$(nmcli -g ip4.address device show | awk '/./{split($0,a,"/");print a[1];exit}')
		if [ "$ip_add" == "127.0.0.1" ]; then
#			echo "${WLAN_CON_SYMBOL} Connecting"
			echo "${CONNECTING_SYMBOL}"
		else
			if ! [[ "ping -c1 8.8.8.8" ]]; then
				echo "${NO_SIGNAL_SYMBOL}"	
			else
#				echo "${WLAN_CON_SYMBOL} ${ip_add}"
				echo "${WLAN_CON_SYMBOL}"
			fi
		fi
		exit 0
	fi
done

if [ "$WLAN_STATE" == "off" ]; then
#	echo "${WLAN_OFF_SYMBOL} Airplane Mode"
	echo "${WLAN_OFF_SYMBOL}"
else
#	echo "${DISCONNECT_SYMBOL} Disconnected"
	echo "${DISCONNECT_SYMBOL}"
fi
