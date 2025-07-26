#!/bin/bash 

SERVICE="ssh"

if ! systemctl is-active -q $SERVICE; then
	echo "$SERVICE is not running."
	echo "Starting the $SERVICE."
	systemctl start $SERVICE

else 
	echo "$SERVICE is running."
fi 
