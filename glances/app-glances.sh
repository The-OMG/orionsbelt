#!/bin/bash

# Gloabal Variables
	ECHO="echo -e"
	LOGDATE="date +%Y%m%d%H%M%S"
	LOGPATH="$HOME/logs"
	LOG="| tee -a $LOGPATH/glances$LOGDATE.log"
	LOGROW="$ECHO "" $LOG"

web () {
	webfunction=$( glances --disable-ip --export-graph --webserver \
	--disable-wifi --bind localhost --process-short-name --fahrenheit \
	--enable-history & )
	$ECHO "Starting Glances Webserver on localhost" "$LOG"
	sleep 5
	$LOGROW
	$LOGROW
}
install () {
	$ECHO "Installing Glances via pip" $LOG
	sleep 5
	pip install glances[action,browser,cloud,cpuinfo,chart,export,folders,gpu,ip,raid,snmp,web] $LOG
	$ECHO "Complete" $LOG
	$LOGROW
	$LOGROW
}
stop () {
	$ECHO "Stopping all Glances webservers" $LOG
	killall glances $LOG
	$ECHO "Glances Webserver stopped" $LOG
	$LOGROW
	$LOGROW
}
hlp () {
	$ECHO ""
	$ECHO "Usage: app-glances <option>"
	$ECHO ""
	$ECHO "Available options:"
	$ECHO "-s, --stop		: Stop all glances processes"
	$ECHO "-h, --help		: This help page."
	$ECHO "-i, --install	: Install glances via python pip"
	$ECHO "-w, --web		: Run glances webserver on localhost"
	$ECHO ""
}

while [ ! $# -eq 0 ]; do
	case $1 in
		-i | --install)
			install
			exit 0
			;;
		-w | --web)
			web
			exit 0
			;;
		-s | --stop)
			stop
			exit 0
			;;
		* | -h | --help)
			hlp
			exit 0
			;;
		esac
		shift
done