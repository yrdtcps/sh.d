#!/bin/bash
OLD_IP=
while :; do
    IP=`./getcuip.sh`
    echo IP=$IP
    if [ "$OLD_IP" != "$IP" ]; then
        OLD_IP=$IP
        echo Send mail...
        echo IP changed to $IP | (heirloom-mailx -s "$IP" yrdtjtk@qq.com)
    fi
    sleep 3
done

exit 0
