#!/bin/bash

getRemoteIP(){
    local remote_ip=`curl -s https://blog.csdn.net/yrdtjtk/article/details/105064258 | grep -Eo '<p>[0-9]{1,3}([.][0-9]{1,3}){3}' | grep -Eo '[0-9.]+'`
    echo $remote_ip
}

getRunningTaskPID(){
    local ptask="`ps aux | grep 'autossh -M 2022' | grep -v 'grep'`"
    if [ -z "$ptask" ]; then
        echo No task need to be killed. >&2
        exit 1
    fi
    #echo Current running task is:$ptask >&2
    local pidtask=`echo $ptask | awk '{print $2}'`
    #echo Current running task pid is $pidtask
    echo $pidtask
    exit 0
}

killRunningTask(){
    pidtask=`getRunningTaskPID`
    if [ $? -eq 0 -a -n "$pidtask" ]; then
        echo Kill the current running task whose pid is $pidtask
        kill $pidtask
    fi
}

OLD_IP=
while :; do
    REMOTE_IP=`getRemoteIP`
    if [ -z "$REMOTE_IP" ]; then
        echo Obtain Remote IP error!
        #exit 1
    elif [ "$OLD_IP" != "$REMOTE_IP" ]; then
        echo Remote IP: $REMOTE_IP
        OLD_IP=$REMOTE_IP
        killRunningTask
        ./expect.sh
        #ssh -NfR 2021:localhost:22 root@$REMOTE_IP -p2020
        autossh -M 2022 -NR 2021:localhost:22 root@$REMOTE_IP -p2020 &
    fi
    #echo ------Remote IP: $REMOTE_IP
    sleep 300
done

exit 0
