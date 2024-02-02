#!/bin/bash

# Lee la variable GITHUB_USER
read -p "Ingrese el nombre de usuario de GitHub: " GITHUB_USER

# Consulta la url y guarda la información en la variable data
url="https://api.github.com/users/${GITHUB_USER}"
data=$(curl -s "$url")

# Obtener los datos del JSON y almacenarlos en variables
user=$(echo "$data" | jq -r ".login")
id=$(echo "$data" | jq -r ".id")
created=$(echo "$data" | jq -r ".created_at")

# Se crea la cadena de salida y se imprime
salida="Hola ${user}. User ID: ${id}. Cuenta fue creada el: ${created}."
echo $salida

# Se crea el archivo log
fecha=$(date +"%Y%m%d")
ruta="/tmp/${fecha}"
if [ ! -d "$ruta" ]; then
	mkdir -p "$ruta"
fi

echo "$salida" >> "/tmp/${fecha}/saludos.log"

# Se crea el cronjob para ejecutar el script cada 5min (Se debe modificar el path según sea necesario)
cronjob="*/5 * * * * /home/robin/Documentos/Universidad/2024/1Semestre/SO1/SO1_ACTIVIDADES_201944994/ACTIVIDAD2/script.sh"
(crontab -l 2>/dev/null; echo "$cronjob") | crontab -
