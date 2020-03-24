#!/bin/bash
REMOTE_IP=`curl -s https://blog.csdn.net/yrdtjtk/article/details/105064258 | grep -Eo 'content="218.68.[0-9.]+"' | grep -Eo '[0-9.]+'`
if [ -z "$REMOTE_IP" ]; then
    echo Obtain Remote IP error!
    exit 1
fi
echo Remote IP: $REMOTE_IP

#ssh -NfR 2021:localhost:22 root@$REMOTE_IP -p2020
autossh -M 2022 -NR 2021:localhost:22 root@$REMOTE_IP -p2020 &

exit 0
