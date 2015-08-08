#!/bin/bash
#Auther: Yang Ruidong
#Date: 2015年 07月 19日 星期日 11:02:03 CST
#Description: Change the color style of bash prompt string by modify the PS1 variable.

#echo "b--PS1=$PS1"
Proc_DspColor () {
for STYLE in 0 1 2 3 4 5 6 7 8 9; do
  for FG in 30 31 32 33 34 35 36 37 38 39; do
    for BG in 40 41 42 43 44 45 46 47 48 49; do
      CTRL="\033[${STYLE};${FG};${BG}m"
      echo -en "${CTRL}"
      echo -n "${STYLE};${FG};${BG}"
      echo -en "\033[0m"
    done
    echo
  done
  echo
done
# Reset
echo -e "\033[0m"
}
Proc_ErrTip () {
	echo "Parameter invalid!"
}
ExitFlag=0
if [ -n "$1" ]; then
	if [ "$1" == "--list" ]; then
		Proc_DspColor
		#exit 0
		ExitFlag=1
	elif [ "${1##[0-9;]*}" == "" ]; then
		ColorCtl='\[\e['$1'm\]'
	else
		Proc_ErrTip
		#exit 1
		ExitFlag=1
	fi
else
	ColorCtl='\[\e[32;1m\]'
fi
if [ $ExitFlag == 0 ];then
	CtlEnd='\[\e[0m\]'
	#if [ "${PS1:${#PS1}-3:3}" == "\\\$ " ]; then
	#if [ "${PS1: -3:3}" == "\\\$ " ]; then
	if [ "${PS1: -9:9}" != $CtlEnd ]; then
		PS1=$ColorCtl$PS1$CtlEnd 
	else
		PS1=$ColorCtl${PS1#'\[\e['[0-9;]*m'\]'}
	fi
		echo "--- PS1='$PS1'"
	#echo "a--PS1=$PS1"
fi
