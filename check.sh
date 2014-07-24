#!/bin/bash
# Author: Lucas Ludziejewski / +rehabstudio
# Info: you need all domains to check in one file. Each domain = one line
# zone.file.txt is your file. Feel free to change the name of it.
# It is for hosts running websites and blocked ICMP traffic.
# No response for five seconds = possible dead host/webserver
#########################################################################


for domain in `cat zone.file.txt`;
	do
		echo -n "Checking response code for: $domain ";
		curl --connect-timeout 5 -s -S --head --request GET http://$domain | grep "timed out";
		echo "";
	done


exit 0;
