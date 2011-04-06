#!/bin/bash

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
	ln -sf ${source} ${target}
	printStat "ln -sf ${source} ${target}"
done