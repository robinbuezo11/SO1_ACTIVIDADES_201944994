## ACTIVIDAD 5 - PROCESOS E HILOS

1. **¿Cuántos procesos únicos son creados?**

    En el código proporcionado, se crean nuevos procesos mediante la llamada a `fork()`. La función `fork()` crea una copia del proceso actual, incluido el contexto de ejecución del proceso padre. Entonces, después de la primera llamada a `fork()`, habrá dos procesos (padre e hijo). Después de la segunda llamada a `fork()` en el proceso hijo, habrá dos procesos más (uno para cada hijo). Entonces, en total, habrá 4 procesos únicos creados.

1. **¿Cuántos hilos únicos son creados?**

    Se crean dos hilos únicos en total:

    - Se crea un hilo en el proceso hijo 1 después de la llamada a pthread_create().
    - Se crea un hilo en el proceso hijo 2 después de la segunda llamada a fork().