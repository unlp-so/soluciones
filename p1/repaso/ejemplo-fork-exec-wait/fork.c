/*
 * Básicamente fork crea un proceso hijo que es un duplicado exacto del
 * padre excepto en algunos aspectos. El proceso hijo tendrá una "copia"[1]
 * del espacio de memoria del padre.
 *
 * El proceso hijo tendrá su propio PID y su PPID (parent process ID) será
 * el PID del padre.
 *
 * En el proceso padre fork() retorna el PID del proceso hijo (o -1 si no
 * puede crear el proceso hijo).
 *
 * En el proceso hijo fork() retorna 0.
 *
 * Si el proceso hijo termina antes que el padre, queda en estado "Zombie"
 * (utilizando algunos recursos) hasta que el padre ejecute wait() o
 * waitpid(). Si el padre nunca ejecuta wait() o waitpid() y termina, el
 * proceso hijo es heredado por el proceso `init` que automáticamente
 * hará un wait() para liberar los recursos del hijo.
 *
 * Ver la versión en inglés de las páginas del manual de fork() y wait():
 *   `LANG=C man fork`
 *   `LANG=C man 2 wait`
 *
 * [1] En realidad en Linux usa copy-on-write.
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
        printf("Hijo: PID = %d y PPID = %d\n", getpid(), getppid());
    }
    else {
        printf("Padre: PID = %d y PPID = %d\n", getpid(), getppid());

        wait(NULL); // Espero a que todos los procesos hijos terminen
        printf("Padre: El proceso hijo terminó\n");
    }
}
