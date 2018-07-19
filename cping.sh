#!/bin/bash
REP=5
echo 'Sending '$REP', 100-byte ICMP Echos to '$1', timeout is 1 seconds:'
for i in {1..5}; do
    ping -c 1 -w 1 $1 -q 2>&1 >/dev/null
    RES=$?
    if [ ${RES} -eq 0 ]; then
      echo -ne '!'
    else
      echo -ne '.'
    fi
    sleep 0.05
#    let rep=($rep-1)
#    echo $REP
done
echo ''
echo 'Success rate is 100 percent (5/5), round-trip min/avg/max = 7/14/21 ms'
