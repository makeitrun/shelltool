#!/bin/sh

LOGID=$1
if [ -z $LOGID ]; then
        echo "usage $0 logid"
        exit 0
fi

LOG_FILE=$2
if [ -z $LOG_FILE ]; then
        LOG_FILE=/home/pirate/rpcfw/log/rpc.log
fi
awk -v logid=$LOGID 'BEGIN{cont = 0}{if($0 ~ "logid:"logid) {print $0;cont =1} else if(cont ==1){ if($0 ~ /^\[/){cont = 0} else{print $0}}}' $LOG_FILE
