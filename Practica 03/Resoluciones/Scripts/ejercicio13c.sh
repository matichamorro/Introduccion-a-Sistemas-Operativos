#!/bin/bash

if [ $# -ne 1 ] ; then
    echo "Error: La cantidad de parametros ingresada debe ser exactamente uno."
    echo "Se espera el nombre de un archivo"
    exit 1
fi

nombre=$1

if [ -f $nombre ]; then 
    echo "El nombre ingresado pertenece a un archivo."
elif [ -d $nombre ]; then 
    echo "El nombre ingresado pertenece a un directorio."
else 
    echo "El nombre ingresado no existe."
    mkdir $nombre
    echo "Directorio '$nombre' creado exitosamente."
fi

exit 0