#!/bin/bash

LOGFILE=/home/k3suser/BACKUP/health_check.log

if [ ! -f "$LOGFILE" ]; then
    touch "$LOGFILE"
fi

log () {
	echo "$(date '+%F-%T') - $1" | tee  -a "$LOGFILE"
}

log "Checking system resources"

DISK_FREE=$(df -h | awk '$6 == "/" {print $4}' | tr -d 'G')
AVAILABLE=$(free -m  | awk '/^Mem:/ {print $4}')

#echo $DISK_FREE
#echo $AVAILABLE

if [ $DISK_FREE -lt 3 ] &&  [ $AVAILABLE -lt 512 ];
then echo WARNING: Low System Resources Available 
     exit 1
fi


if [ $DISK_FREE -lt 3 ]; 
then echo WARNING: Low Disk Space Available 
     exit 2
fi


if [ $AVAILABLE -lt 512 ]; 
then echo WARNING: Low Memory Available
     exit 3
fi

echo System Resources Are Fine

log "Check Complete"



