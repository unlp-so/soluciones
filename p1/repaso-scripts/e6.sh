#!/bin/bash

# Esta línea es para hacer pruebas sin utilizar el home, para que el
# este script cumpla con el enunciado literalmente hay que borrar
# la línea de abajo de manera que se utilice el home del usuario.
HOME="$PWD"

cd "$HOME"

mkdir -p backup

for fname in $(ls); do
    if [ -f "$fname" ]; then
        cp "$fname" "backup/$(echo "$fname" | tr 'a-z' 'A-Z')"
    fi
done

