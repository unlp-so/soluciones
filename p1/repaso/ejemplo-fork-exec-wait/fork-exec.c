/*
 * Fork solamente nos permite crear "clones" de un proceso, para ejecutar
 * nuevos programas es necesario utilizar `exec`. Exec es una familia
 * de funciones que aceptan distintos parámetros, utilizaremos la que
 * más se aproximaq a la systemcall que es `execve`.
 */

#include <unistd.h>    // fork
#include <sys/wait.h>  // wait
#include <sys/types.h> // pid_t
#include <stdio.h>     // printf
#include <stdlib.h>    // NULL

int main() {
    pid_t pid;
    pid = fork();
    // Si el valor de retorno de pid es -1 no se pudo crear el proceso
    // hijo. Termino el programa.
    if (pid == -1) exit(1);

    if (pid == 0) {
        // Acá ya estoy en el proceso hijo, pero sigue ejecutando una
        // "copia" del código del padre.
        printf("Hijo: PID = %d y PPID = %d\n", getpid(), getppid());

        // Reemplazamos la memoria del proceso actual por un programa
        // a elección utilizando `execve`
        char *argv[] = { "date", NULL };
        char *environ[] = { NULL };
        execve("/bin/date", argv, environ);

        printf("Este código nunca se ejecuta porque `execve` nunca"
               " retorna\n");
    }
    else {
        printf("Padre: PID = %d y PPID = %d\n", getpid(), getppid());

        wait(NULL); // Espero a que todos los procesos hijos terminen
        printf("Padre: El proceso hijo terminó\n");
    }
}
