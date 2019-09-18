#!/bin/bash

IM=$(ibus engine)
if [[ $IM =~ eng$ ]]; then
	echo  EN
	exit 0
elif [[ $IM =~ pinyin$ ]]; then
	echo  ZH
	exit 0
elif [[ $IM =~ ger$ ]]; then
	echo  DE
	exit 0
fi
echo N/A
exit -1
