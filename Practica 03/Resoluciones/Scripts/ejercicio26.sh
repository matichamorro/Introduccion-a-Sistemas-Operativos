#!/bin/bash

inicializar() {
    array=()
}

agregar_elem() {
    if [ $# -eq 1 ]; then
        param=$1
        len=${#array[@]}
        array[$len]=$param
    else
        echo "Error: Se espera exactamente un parametro."
        return 1
    fi
    return 0
}

eliminar_elem() {
    if [ $# -eq 1 ]; then
        if [ $1 -lt ${#array[@]} ]; then
            unset array[$1]
        else
            echo "Error: La posicion recibida no existe en el arreglo"
            return 2
        fi
    else 
        echo "Error: Se espera exactamente un parametro."
        return 1
    fi
}

longitud() {
    echo ${#array[@]}
}

imprimir() {
    echo ${array[@]}
}

inicializar_Con_Valores(){
    if [ $# -eq 2 ]; then
        for ((i=0; i < $1; i++))
        do
            array[$i]=$2
        done
    else
        echo "Error: Se esperan exactamente dos parametros."
    fi
}
