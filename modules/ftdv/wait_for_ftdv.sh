#!/bin/bash
# Backoff in an geometric progression for a total of 1,022 seconds; calculated coz sum = 2^(n+1) - 1 - 2^0
for EXPONENTIAL_BACKOFF in {1..9}; do
    echo "Trying to connect on port 22 to FTD at location $1"
    nc -w 1 -z $1 22 && break;
    DELAY=$((2**$EXPONENTIAL_BACKOFF))
    echo "FTDv not yet available, sleeping for $DELAY seconds"
    sleep $DELAY
done