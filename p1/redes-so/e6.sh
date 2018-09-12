#!/bin/bash

MODO="$1"
NICK="$2"

# Determinamos si es netcat tradicional u openbsd
# porque usan distintos argumentos
NC=$(realpath $(which nc))

if [ "$(echo "$NC" | grep traditional)" ]; then
    NC_PORT='-p'
else
    NC_PORT=''
fi

run_nc() {
    if [ "$MODO" = s ]; then
        nc -l 127.0.0.1 $NC_PORT 1234
    else
        nc 127.0.0.1 1234
    fi
}

while read line; do
    echo "$(date), $NICK says: $line"
done | run_nc
