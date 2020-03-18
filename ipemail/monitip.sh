#!/bin/bash
OLD_IP=
while :; do
    IP=`./getipfromsohu.sh`
    if [ $? -ne 0 ]; then
        IP=`./getcuip.sh`
    fi
    echo IP=$IP
    if [ -z "$IP" ]; then
        echo "`date` --- IP obtain err!"
    elif [ "$OLD_IP" != "$IP" ]; then
        OLD_IP=$IP
        echo Send mail...
        echo IP changed to $IP | (heirloom-mailx -s "$IP" yrdtjtk@qq.com)
    fi
    sleep 300
done

exit 0
