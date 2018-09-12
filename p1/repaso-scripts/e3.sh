#!/bin/bash

cantidad() {
    echo ${#EJECUTABLES[@]}
}

archivos() {
    echo ${EJECUTABLES[@]}
}

EJECUTABLES=()

for fname in $(ls); do
    if [ -x "$fname" ]; then
        EJECUTABLES=(${EJECUTABLES[@]} "$fname")
    fi
done

echo "Hay $(cantidad) archivos ejecutables"
echo "Y son los siguientes: $(archivos)"


