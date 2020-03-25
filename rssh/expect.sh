#!/usr/bin/expect

spawn ssh root@111.165.46.34 -p 2020
expect "The authenticity*yes/no*" 
send "yes\r"
#send "no\r"

spawn sleep 3

send "exit\r"
#interact
#pwd
#ll
#exit
