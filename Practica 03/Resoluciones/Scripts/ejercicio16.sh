#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Error: La cantidad de parametros ingresada debe ser exactamente uno."
    echo "Sintaxis esperada: '$0 <extension>'."
    exit 1
fi
ext=$1
if [ $(echo "$ext" | cut -c1-1) != "." ]; then
    echo "Error: La extension debe comenzar con un punto."
    exit 2
fi
if [ $(echo "$ext" | cut -d" " -f1) != "$ext" ]; then
    echo "Error: La extension no debe tener espacios."
    exit 3
fi

echo "Usuario -- Cantidad de archivos '$ext'" > "test/reporte.txt"
echo "----------------------------------------" >> "test/reporte.txt"

for i in /home/*; 
do
    user_name=$(echo ${i} | cut -d/ -f3)
    user_home=$i


    if [ -d ${user_home} ]; then
        echo "Espera un momento... Escribiendo datos..."
        amountOfFiles=$(find $user_home -name "*${ext}" 2> /dev/null | wc -l)
        echo "$user_name -- $amountOfFiles" >> "test/reporte.txt"
    fi
done

exit 0