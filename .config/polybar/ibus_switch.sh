#!/bin/bash

IM_DEFAULT='xkb:us::eng'

CURRENT_IM=$(ibus engine)
NIM=0
for i in $IM_DEFAULT 'libpinyin' 'xkb:de::ger'; do

	if [[ $NIM -eq 1 ]]; then
		ibus engine $i
		exit 0
	fi

	if [[ $CURRENT_IM == $i ]]; then
		NIM=1
	fi
done

ibus engine $IM_DEFAULT
exit 0

