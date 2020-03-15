#!/bin/bash
TOKEN=`curl "http://192.168.18.1/cu.html" 2>/dev/null | grep -E 'getElementById\("Frm_Logintoken"\)\.value = ' | grep -o -E '[0-9]+'`
#echo TOKEN=$TOKEN
if [ -z $TOKEN ]; then
    echo "TOKEN find err!"
    exit 1
fi

curl -d "Username=CUAdmin&Password=CUAdmin&Frm_Logintoken=$TOKEN&_cu_url=1"  "http://192.168.18.1/cu.html" >/dev/null 2>/dev/null

#echo =======================================================================================================================================================================================================================================================================================================================================================================================================

#curl -s "http://192.168.18.1/getpage.gch?pid=1002&nextpage=status_ethwan_if_t.gch" | grep PPPoE表单信息开始
IP_URL=`curl -s "http://192.168.18.1/getpage.gch?pid=1002&nextpage=status_ethwan_if_t.gch" | grep -A15 'PPPoE</td>' | grep -A2 'IP</td>' | grep -o -E '&[&#;0-9]+;'`
#echo IP_URL = $IP_URL
if [ -z $IP_URL ]; then
    echo "IP_URL find err!"
    exit 2
fi
#echo -----------------------------111
#echo $IP_URL | sed 's/&#//g' | sed 's/;/ /g'
#echo -----------------------------222
IP_STR=
for NUM in `echo $IP_URL | sed 's/&#//g' | sed 's/;/ /g'`;do
#    echo NUM = $NUM
    HEX=`printf %02X $NUM`
    IP_STR=${IP_STR}`printf "\\x$HEX"`
done
#echo IP_STR = ${IP_STR}

#echo ------------------=====================================================================================================================================================================================================================================================================================================================================================================================

curl -d "logout=1"  "http://192.168.18.1/cu.html" >/dev/null 2>/dev/null 
echo -n $IP_STR
exit 0
