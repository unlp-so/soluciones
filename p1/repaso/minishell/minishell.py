#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import sys

if sys.version_info.major != 3:
    sys.stderr.write('Este script requiere Python 3 ejecutar:\n')
    sys.stderr.write('\tpython3 ' + ' '.join(sys.argv) + '\n')
    exit(1)

def help_():
    return '''Comandos internos:
    help\t\tEsta ayuda
    cd dir\t\tCambiar el directorio actual a dir
    pwd\t\t\tDirectorio actual
    exit status\tSalir con el código de error indicado por status'''

def cd(path):
    os.chdir(path)

def pwd():
    return os.getcwd()

while True:
    linea = input(pwd() + '-> ')
    if linea.strip() == '':
        # Si la línea está vacía pedir otro comando
        continue
    args = linea.split()    # Creo una lista con los argumentos
    cmd = args[0]           # El argumento 0 es el comando (esto es útil
                            # para exec así que lo dejo así).
    if cmd == 'help':
        print(help_())
    elif cmd == 'cd':
        cd(args[1])
    elif cmd == 'pwd':
        print(pwd())
    elif cmd == 'exit':
        exit(int(args[1]))
    else:
        if os.fork() == 0:
            os.execlp(cmd, *args)
        else:
            os.wait()

