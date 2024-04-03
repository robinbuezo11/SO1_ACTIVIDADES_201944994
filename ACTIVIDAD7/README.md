## ACTIVIDAD 7 - Completely Fair Scheduler (CFS) de Linux

El Completely Fair Scheduler (CFS) es utilizado luego de la versión 2.5 del kernel de Linux. Su principal objetivo es asignar el CPU a los procesos de manera justa y equitativa.

Entre sus principales características podemos destacar que el un algoritmo justo ya que no cuenta con ninguna prioridad sobre procesos, es decir, todos los procesos son tratados por igual. A todos los procesos se les asigna una cantidad de tiempo para ejecutarse antes de que se cambie al siguiente en la cola.

Este algoritmo gestiona los procesos con una estructura de *árbol negro-rojo* es decir que los procesos son ordenados de una manera eficiente para evitar tiempos de búsqueda extensos.

El CFS trata en cierta forma de que los procesos que utilizan menos tiempo de ejecución puedan ser atendidos rapidamente y así poder liberar procesos.

En sistemas multicore, el CFS funciona de una forma muy eficiente dado las características anteriores ya que puede asignar procesos a los diferentes procesadores de una forma justa, equitativa y también muy eficiente.

Por ultimo podemos agregar que el CSF es una opción bastante robusta en sistemas multitarea en donde no se puede concentrar el uso del CPU en una sola tarea de una forma delibera, ya que esto provocaría que los demás procesos se puedan sentir lentos, haciendo que el sistema se vuelva ineficientel.