#!/bin/bash

cat /etc/passwd | while read line; do
    USER=$(echo "$line" | cut -d: -f1)
    USER_ID=$(echo "$line" | cut -d: -f3)
    if [ $USER_ID -ge 1000 ]; then
        echo $USER
    fi
done > /tmp/usuarios
