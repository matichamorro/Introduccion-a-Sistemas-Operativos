#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Error: La cantidad de parametros ingresada debe ser exactamente uno."
    echo "Sintaxis esperada: '$0 <usuario>'."
    exit 1
fi

user=$1

while true
do
    sleep 10
    who | grep ${user}
    if [ $? = 0 ]; then
        echo "Usuario ${user} logueado en el sistema"
        break
    fi
done

exit 0