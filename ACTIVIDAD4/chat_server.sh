#!/bin/bash

# Definir los nombres de los pipes
SERVER_CLIENT=/home/robin/Documentos/Universidad/2024/1Semestre/SO1/SO1_ACTIVIDADES_201944994/ACTIVIDAD4/server_client
CLIENT_SERVER=/home/robin/Documentos/Universidad/2024/1Semestre/SO1/SO1_ACTIVIDADES_201944994/ACTIVIDAD4/client_server

# Crear los pipes
rm -f $SERVER_CLIENT
rm -f $CLIENT_SERVER
mkfifo $SERVER_CLIENT
mkfifo $CLIENT_SERVER

while true; do
	respuesta=$(cat $CLIENT_SERVER)
	echo "Otro: $respuesta"

	read -p "Tú: " mensaje
	echo "$mensaje" > $SERVER_CLIENT
done
