#!/bin/bash
while true
  do
    DATETIME=$(date)
    if [[ ${DATETIME} == *:00\ * ]]
    then
      echo -e
      echo -ne ${DATETIME}
      echo " Pinging $1"
    fi
    ping -c 1 -w 1 $1 -q 2>&1 >/dev/null
    RET=$?
    if [ ${RET} -eq 0 ]; then
      echo -ne '!'
    else
      echo -ne '.'
    fi
    sleep 1
done
