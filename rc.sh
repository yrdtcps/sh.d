#!/bin/bash
#alias xseq 2> /dev/null || alias xseq='/home/yrd/test.d/xseq.sh'
alias xseq &> /dev/null
if [ "$?" != "0" ] ; then
alias xseq='/home/yrd/sh.d/xseq.sh'
echo "--- alias xseq='/home/yrd/sh.d/xseq.sh'"
fi

source /home/yrd/sh.d/chshcolor.sh $1
