#!/bin/bash
# Created by Nilesh Barot 22nd July 2015

display_usage() {
  echo -e "\nUsage:\n$0 arg1 = number of lines to scan, arg2 = /path/logfile e.g /var/log/file-asset-delivery/file-asset-delivery-init.log, arg3 = number of log entries to send in alert message \n"
  }

# if less than two arguments supplied, display usage 
	if [ $# -le 2  ] 
	then 
		display_usage
		exit 1
	fi 

# check whether user had supplied -h or --help . If yes display usage 
	if [[ ( $# == "--help" ) ||  ( $# == "-h" ) || ( $# == 0 ) ]] 
	then 
		display_usage
		exit 1
	fi 

output=`/usr/bin/tail -$1 $2 | grep -ir error -A $3 `

if [ "$output" == "" ]; then
  echo "OK"
else
  echo "$output"
fi
#if [ "$count" -ne "0" ]; then
#  echo "1"
#else
#  echo "0"
#fi
