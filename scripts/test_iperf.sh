#!/bin/bash

#Constants
REMOTE_HOST=192.168.201.2
PORT=123

#Arguments
PROTOCOL=$1
MAX_SPEED=$3

ssh root@HostC 'bash -s' <EOL
iperf -p $PORT -Ds
EOL &

if [$PROTOCOL = "" -o  $PROTOCOL = "tcp"]
  then
    iperf -c HostC -p $PORT -t 30
  else
    iperf -c HostC -p $PORT -t 30 -b -u -b $MAX_SPEED
fi

#Stop the server
kill $!
