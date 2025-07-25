#!/bin/bash

LOGFILE=/home/k3suser/BACKUP/disk_usage.log
THRESHOLD_DISK=80 

set -euo pipefail

if [ ! -f "$LOGFILE" ]; then
    touch "$LOGFILE"
fi

log () {
	echo "$(date '+%F-%T') - $1" | tee  -a "$LOGFILE"
}

log "Starting to check Disk Usage"

USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

if [ "$USAGE" -gt "$THRESHOLD_DISK" ]; then  
    log "Disk usage high: $USAGE%"
  else
    log "Disk usage normal: $USAGE%"
  fi

log "Finishing Execution"
