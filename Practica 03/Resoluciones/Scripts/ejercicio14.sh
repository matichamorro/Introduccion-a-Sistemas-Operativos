#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Error: La cantidad de parametros ingresada debe ser exactamente tres."
    echo "Sintaxis esperada: './renombra <directorio> <-a/-b> <cadena>'."
    exit 1
fi

dir=$1
param=$2
str=$3

if [ -d $dir ]; then 

    if [ "$param" != "-a" ] && [ "$param" != "-b" ]; then
        echo "Error: No existe la opcion $param" 
        echo "Por favor, ingrese -a o -b"
        exit 2
    fi

    case "$dir" in 
        */) ;;
        *) dir="$dir/" ;;
    esac

    for file in "${dir}"*; do

        if [ -f "$archivo" ]; then

            if [ "$param" == "-a" ]; then file_renamed=${dir}${file}${str}
            else file_renamed=${dir}${str}${file}
            fi

            mv ${file} ${file_renamed}
            echo "Se renombro correctamente el archivo '$file' a '$file_renamed'."
         
        fi
    done

    echo "Proceso terminado."

else
    echo "Error: El nombre $dir no corresponde a un directorio existente."
    exit 3
fi
exit 0