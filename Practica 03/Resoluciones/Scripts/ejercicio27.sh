#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Error: Se espera exactamente un parametro."
    exit 1
else
    if [ -d $1 ]; then
        dir=$1
        amount_r=0
        amount_w=0
        for f in "${dir}"/*
        do
            if [ -f $f ]; then
                if [ -r $f ]; then
                    amount_r=$(expr $amount_r + 1)
                fi
                if [ -w $f ]; then
                    amount_w=$(expr $amount_w + 1)
                fi
            fi
        done
        echo "La cantidad de archivos con permisos de lectura es: $amount_r."
        echo "La cantidad de archivos con permisos de escritura es: $amount_w"
        
    else
        echo "Error: no existe el directorio pasado por parametro"
        exit 4
    fi
fi
exit 0 
