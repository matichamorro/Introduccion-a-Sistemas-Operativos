#!/bin/bash

array=($(find /home/* -name '*.doc'))

verArchivo() {
    if [ $# -eq 1 ]; then
        local file=$1
        local found=0
        local index=0
        for ((i=0; i < ${#array[@]}; i++))
        do
            if [ $file = $(basename ${array[$i]}) ]; then
                found=1
                index=$i
                break
            fi
        done
        if [ $found -eq 1 ]; then
            cat "${array[$index]}"
        else
            echo "Archivo no encontrado."
            return 5
        fi
    else
        echo "Error: Se espera exactamente un parametro."
        return 1
    fi
    return 0
}

cantidadArchivos() {
    echo "${#array[@]}"
    return 0
}

borrarArchivo() {
    if [ $# -eq 1 ]; then
        local file=$1
        local found=0
        local index=0
        for ((i=0; i < ${#array[@]}; i++))
        do
            if [ $file = $(basename ${array[$i]}) ]; then
                found=1
                index=$i
                break
            fi
        done
        if [ $found -eq 1 ]; then
            echo "Desea borrar solo de forma logica el archivo?: "
            read opt
            case $opt in
                Si)
                    unset array[$index]
                    ;;
                No)
                    rm -f "${array[$index]}"
                    unset array[$index]
                    ;;
                *)
                    echo "Error: Debe ingresar 'Si' o 'No'."
                    return 2
                    ;;
            esac
        else
            echo "Archivo no encontrado."
            return 10
        fi
    else
        echo "Error: Se espera exactamente un parametro."
        return 1
    fi
    return 0
}
