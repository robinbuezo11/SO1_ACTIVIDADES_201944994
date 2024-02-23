## ACTIVIDAD 3 - SYSTEMD UNIT TIPO SERVICIO
Es esta actividad se creó un systemd unit de tipo servicio que inicia con el sistema y ejecuta un script que imprime un saludo y la hora actual. A continuación están los pasos realizados.

1. **Creación del script:**
    
    Lo primero que se necesita hacer es crear el script al cual llamaremos *saludo.sh*

    ~~~
    #!/bin/bash

    while true; do
        echo "Hola, hoy es $(date)"
        sleep 1
    done
    ~~~

2. **Creación del archivo systemd:**

    Ahora podemos crear el servicio systemd unit en el directorio */etc/systemd/system/* con el nombre *saludo.service*

    ~~~
    [Unit]
    Description=Servicio de saludo
    After=network.target

    [Service]
    Type=simple
    ExecStart=/path/saludo.sh
    Restart=always
    RestartSec=1

    [Install]
    WantedBy=multi-user.target
    ~~~

3. **Habilitar el servicio:**

    Ahora vamos a habilitar el servicio para que se inicie junto con el sistema. Esto lo haremos con el siguiente comando.

    `sudo systemctl enable saludo.service`

4. **Iniciar el servicio:**

    Dado que nuestro servicio iniciará automáticamente hasta que nuestro sistema inicie la siguiente vez, vamos a iniciarlo esta vez de forma manual con el siguiente comando.

    `sudo systemctl start saludo.service`

5. **Verificar estado del servicio:**

    Podemos verificar el estado de nuestro servicio con el siguiente comando.

    `sudo systemctl status saludo.service`

    El cual nos devolverá un mensaje parecido a este en caso de que todo esté funcionando correctamente.

    ~~~
    ● saludo.service - Servicio de saludo
     Loaded: loaded (/etc/systemd/system/saludo.service; enabled; vendor preset: enabled)
     Active: active (running) since Thu 2024-02-22 23:28:02 CST; 6min ago
   Main PID: 52606 (saludo.sh)
      Tasks: 2 (limit: 18301)
     Memory: 560.0K
        CPU: 1.219s
     CGroup: /system.slice/saludo.service
             ├─52606 /bin/bash /path/saludo.sh
             └─55015 sleep 1

    feb 22 23:34:03 Equipo saludo.sh[52606]: Hola, hoy es jue 22 feb 2024 23:34:03 CST
    feb 22 23:34:04 Equipo saludo.sh[52606]: Hola, hoy es jue 22 feb 2024 23:34:04 CST
    feb 22 23:34:05 Equipo saludo.sh[52606]: Hola, hoy es jue 22 feb 2024 23:34:05 CST
    feb 22 23:34:06 Equipo saludo.sh[52606]: Hola, hoy es jue 22 feb 2024 23:34:06 CST
    feb 22 23:34:07 Equipo saludo.sh[52606]: Hola, hoy es jue 22 feb 2024 23:34:07 CST
    feb 22 23:34:08 Equipo saludo.sh[52606]: Hola, hoy es jue 22 feb 2024 23:34:08 CST
    feb 22 23:34:09 Equipo saludo.sh[52606]: Hola, hoy es jue 22 feb 2024 23:34:09 CST
    feb 22 23:34:10 Equipo saludo.sh[52606]: Hola, hoy es jue 22 feb 2024 23:34:10 CST
    feb 22 23:34:11 Equipo saludo.sh[52606]: Hola, hoy es jue 22 feb 2024 23:34:11 CST
    feb 22 23:34:12 Equipo saludo.sh[52606]: Hola, hoy es jue 22 feb 2024 23:34:12 CST

    ~~~

6. **Verificar los logs del servicio:**

    También podemos revisar los logs de nuestro servicio con el siguiente comando.

    `sudo journalctl -u saludo.service`

    El cual nos devolverá las salidas del script y los mensajes relacionados al servicio.

    ~~~
    feb 22 23:28:02 Equipo systemd[1]: Started Servicio de saludo.
    feb 22 23:28:02 Equipo saludo.sh[52606]: Hola, hoy es jue 22 feb 2024 23:28:02 CST
    feb 22 23:28:03 Equipo saludo.sh[52606]: Hola, hoy es jue 22 feb 2024 23:28:03 CST
    feb 22 23:28:04 Equipo saludo.sh[52606]: Hola, hoy es jue 22 feb 2024 23:28:04 CST
    feb 22 23:28:05 Equipo saludo.sh[52606]: Hola, hoy es jue 22 feb 2024 23:28:05 CST
    feb 22 23:28:06 Equipo saludo.sh[52606]: Hola, hoy es jue 22 feb 2024 23:28:06 CST
    feb 22 23:28:07 Equipo saludo.sh[52606]: Hola, hoy es jue 22 feb 2024 23:28:07 CST
    ...
    ~~~

7. **Detener el servicio:**

    Si queremos detener el servicio podemos hacerlo con el siguiente comando.

    `sudo systemctl stop saludo.service`

8. **Deshabilitar el servicio:**

    Si queremos deshabilitar el servicio para que ya no inicie con el sistema podemos usar el siguiente comando.

    `sudo systemctl disable saludo.service`
