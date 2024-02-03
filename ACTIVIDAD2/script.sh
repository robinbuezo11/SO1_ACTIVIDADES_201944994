#!/bin/bash

# Se configura la variable de entorno para su posterior uso
export GITHUB_USER=robinbuezo11

# Se crea la url a consultar leyendo la variable de entorno
url="https://api.github.com/users/${GITHUB_USER}"

# Consulta la url y guarda la información en la variable data
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

# Se configura la ruta completa del script (se debe modificar según las necesidades)
script_path="/home/robin/Documentos/Universidad/2024/1Semestre/SO1/SO1_ACTIVIDADES_201944994/ACTIVIDAD2/script.sh"

# Se define el cronjob
cronjob="*/5 * * * * $script_path"

# Se obtiene el contenido actual del crontab
current_crontab=$(crontab -l 2>/dev/null)

# Verifica si el script ya está en el crontab actual, si no lo agrega
if [[ ! $current_crontab =~ $script_path ]]; then
	new_crontab=$(echo -e "${current_crontab}\n${cronjob}")
	echo "$new_crontab" | crontab -
fi
