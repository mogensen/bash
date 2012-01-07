#!/bin/bash

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)

ATTR_RESET=$(tput sgr0)

function printStat {
	if [ $? == 0 ]; then
		echo "[${GREEN}   OK   ${ATTR_RESET}]" $1
	else
		echo "[${RED} FAILED ${ATTR_RESET}]" $1
	fi
}

for i in _*
do 
	source="${PWD}/$i"
	target="${HOME}/${i/_/.}"
	if [ -f $target ]; then
	    echo "${target} already exists" 
	else
	    ln -sf ${source} ${target}
	    printStat "ln -sf ${source} ${target}"
	fi
done
