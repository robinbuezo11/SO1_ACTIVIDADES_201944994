#include <stdio.h>
#include <unistd.h>
#include <pthread.h>

void *thread_function(void *arg) {
    printf("Thread created\n");
    return NULL;
}

int main() {
    pid_t pid;

    pid = fork();
    if (pid == 0) { /* child process */
        fork();
        pthread_t thread;
        pthread_create(&thread, NULL, thread_function, NULL);
    }
    fork();

    sleep(1); // Esperar a que todos los procesos e hilos se creen

    return 0;
}