#!/bin/bash

# nc.traditional precisa el argumento -z para funcionar como
# se quiere en este ejercicio, nc.openbsd no lo requiere pero
# funciona igual.

while read host; do
    # Descarto el error estándar para que no aparezca un error
    # en pantalla en los nombres de dominio que no existan.
    nc -z -w 2 "$host" 80 2> /dev/null
    if [ $? -eq 0 ]; then
        echo $host
    fi
done
