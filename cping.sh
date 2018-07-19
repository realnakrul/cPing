#!/bin/bash
rep=5
while [ $rep -gt 0 ]; do
    ping -c 1 -w 1 $1 -q 2>&1 >/dev/null
    RES=$?
    if [ ${RES} -eq 0 ]; then
      echo -ne '!'
    else
      echo -ne '.'
    fi
    sleep 0.05
    let rep=($rep-1)
#    echo $rep
done
echo ''
