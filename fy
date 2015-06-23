#!/bin/bash
#Date:2015-6-23 Tuesday
#Auther:Yrd
#Description:This sh is used to translate words from parmeters or from standard input.And open firefox into Baidu Fanyi.
if [ $# -gt 0 ];then
	Obj=$*
else
	Obj=$(cat)
fi
#firefox -new-window 'http://fanyi.baidu.com/translate?query=&keyfrom=baidu&smartresult=dict&lang=auto2zh#en/zh/'"$Obj" 
firefox -new-window 'http://fanyi.baidu.com/#en/zh/'"$Obj" 
