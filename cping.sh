#!/bin/bash
REPEAT=5
SUCCESS=0
SIZE=100
PERCENT=0
echo 'Sending '$REPEAT', '$SIZE'-byte ICMP Echos to '$1', timeout is 2 seconds:'
i=1
while [ $i -le $REPEAT ]; do
    ping -c 1 -w 2 -W 2 -s $SIZE $1 -q 2>&1 >/dev/null
    RESULT=$?
    if [ ${RESULT} -eq 0 ]; then
      echo -ne '!'
      let SUCCESS=($SUCCESS+1)
    else
      echo -ne '.'
    fi
    sleep 0.05
    i=$(($i + 1))
#    let rep=($rep-1)
#    echo $REP
done
echo ''
let PERCENT=$(( $SUCCESS*100/$REPEAT ))
echo 'Success rate is '$PERCENT' percent ('$SUCCESS'/'$REPEAT'), round-trip min/avg/max = RTT_MIN/RTT_AVG/RTT_MAX ms'
