#!/bin/bash

users=($(grep "^users:" /etc/group | cut -d: -f4 | tr ',' ' '))

if [ $# -eq 2 ] && [ $1 = '-b' ]; then 
    pos=$2
    if [ $pos -ge ${#users[@]} ]; then
        echo "Error: no existe la posicion $pos."
        exit 1
    else
        echo "${users[$pos]}" 
    fi

elif [ $# -eq 1 ]; then
    param=$1
    case $param in
        '-l')   
            echo "${#users[@]}"
            ;;
        '-i')
            echo "${users[@]}"
            ;;
        *) 
            echo "Error: Sintaxis esperada: $0 <parametro>"
            echo "Parametros esperados: -b <n> / -l / -i"
    esac
elif [ $# -eq 0 ]; then
    exit 0
else
    echo "Sintaxis esperada: $0 <parametro>"
    echo "Parametros esperados: -b <n> / -l / -i"
    exit 1
fi
exit 0
