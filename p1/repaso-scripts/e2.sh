#!/bin/bash

PROC=$1

procs() {
    list=$(ps axc | tr -s ' ' | cut -d' ' -f5)
    echo "$list" | grep "^$1$" | wc -l
}

while true; do
    procs "$PROC"
    sleep 15
done
