#/bin/bash
#Date:2015-6-5 Firday
#Auther:Yrd
#Description:Get hex sequence.
seq $@ | awk '{printf "%02X",$1}'
echo ""
