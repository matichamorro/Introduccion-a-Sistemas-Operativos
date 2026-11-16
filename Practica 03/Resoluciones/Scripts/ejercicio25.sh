#!/bin/bash

if [ $# -ge 1 ]; then 
    args=("$@")
    amountNonExist=0

    for ((i=0; i < ${#args[@]}; i++))    
    do
        if [ $(expr $i % 2) -eq 0 ]; then #evaluo que sean pares porque lo guarde en un array, el cual empieza con indice 0
            if [ -f ${args[$i]} ]; then
                echo "${args[$i]} es un archivo."
            elif [ -d ${args[$i]} ]; then
                echo "${args[$i]} es un directorio."
            else
                echo "${args[$i]} no existe o no es valido."
                amountNonExist=$(expr $amountNonExist + 1)
            fi
        fi
    done
    echo "Cantidad de arhcivos o directorios inexistentes: $amountNonExist"

else
    echo "Error: se espera como minimo una ruta absoluta como parametro."
    exit 1
fi
exit 0
