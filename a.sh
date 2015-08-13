#!/bin/bash
# Created by Nilesh Barot 22nd July 2015

display_usage() {
  echo -e "\nUsage:\n$0 arg1 = number of lines to scan, arg2 = /path/logfile  e.g /var/log/file-asset-delivery/file-asset-delivery-init.log \n"
  }

# if less than two arguments supplied, display usage 
	if [  $# -le 1 ] 
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

count=`/usr/bin/tail -$1 $2 | grep -ir error  | wc -l `
echo "Number of error are" $count

if [ "$count" -ne "0" ]; then
  echo "1"
else
  echo "0"
fi
