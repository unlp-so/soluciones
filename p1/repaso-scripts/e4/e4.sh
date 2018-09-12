#!/bin/bash

renombrar() {
    local dir_orig="$PWD"
    local index=1
    DIR="$1"
    cd "$DIR"
    for fname in $(ls *.jpg); do
        mv "$fname" "${DIR}-${index}.jpg"
        let index++
    done
    cd "$dir_orig"
}

for dname in $(ls); do
    if [ ! -d "$dname" ]; then
        # Si no es directorio pasamos a la siguiente iteración
        continue
    fi
    renombrar "$dname"
done
