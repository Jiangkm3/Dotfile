#!/bin/bash

DAY_SYMBOL=""
NIGHT_SYMBOL=""

if [ "$(pidof redshift)" ]
then
	echo "${NIGHT_SYMBOL}"
else
	echo "${DAY_SYMBOL}"
fi
