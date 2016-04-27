#!/bin/bash

#Constants
REMOTE_HOST=192.168.201.2
PORT=123

#Arguments
PROTOCOL=$1
MAX_SPEED=$2
log=$3 || "/tmp/iperf.log"

echo $MAX_SPEED

ssh -t -t root@$REMOTE_HOST "iperf -p $PORT -s" > /dev/null & 
SSH_PROCESS=$!
#echo "SSH process id is SSH_PROCESS or $!"
#echo "Waiting for the server to wake up"
sleep 20

if [ "$PROTOCOL" == "" -o  "$PROTOCOL" == "tcp" ]
  then
    iperf -c $REMOTE_HOST -p $PORT -t 30 -i 0.5 -y $log
    cat $log
    #echo -e "$(awk '/Bandwidth/ {getline}; END{print $7, $8}' $log)"
fi

if [ "$PROTOCOL" == "udp" ]; then
    iperf -c $REMOTE_HOST -p $PORT -t 30 -b $MAX_SPEED -u -i 0.5 -y $log
    cat $log
    #echo -e "\t $(awk '/Bandwidth/ {getline}; END{print $7, $8}' $log)"
fi


#Stop the server
#echo "Killing $SSH_PROCESS"
kill $SSH_PROCESS > /dev/null
exit 1
