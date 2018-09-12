#!/bin/bash

if [ -z "$DISPLAY" ]; then
    echo 'Este script requiere interfaz gráfica'
    exit 1
fi

if [ ! -e /usr/bin/x-terminal-emulator ]; then
    echo 'No se puede encontrar /usr/bin/x-terminal-emulator'
    exit 2
fi

# Determinamos si es netcat tradicional u openbsd
# porque usan distintos argumentos
NC=$(realpath $(which nc))

if [ "$(echo "$NC" | grep traditional)" ]; then
    x-terminal-emulator -T 'Servidor' -e $NC -l 127.0.0.1 -p 1234 &
else
    x-terminal-emulator -T 'Servidor' -e $NC -l 127.0.0.1 1234 &
fi

x-terminal-emulator -T 'Cliente' -e $NC 127.0.0.1 1234

