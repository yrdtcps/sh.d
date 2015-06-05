#!/bin/bash
#alias xseq 2> /dev/null || alias xseq='/home/yrd/test.d/xseq.sh'
alias xseq &> /dev/null
if [ "$?" != "0" ] ; then
alias xseq='/home/yrd/test.d/xseq.sh'
echo "--- alias xseq='/home/yrd/test.d/xseq.sh'"
fi

#echo "b--PS1=$PS1"

if [ "${PS1:${#PS1}-3:3}" == "\\\$ " ]; then
PS1='\[\e[32;1m\]'$PS1'\[\e[0m\]'
echo "--- PS1='$PS1'"
fi

#echo "a--PS1=$PS1"
