#!/bin/bash

initialize() {
    array_set=()
}

initialize_with() {
    if [ $# -ge 1 ]; then
        array_set=("$@")
    else
        echo "Error: Se necesita un parametro como minimo."
        return 1
    fi
    return 0
}

add() {
    if [ $# -eq 1 ]; then
        local found=0
        local param=$1
        for e in "${array_set[@]}"
        do
            if [ "$param" = "$e" ]; then
                found=1
                break
            fi
        done
        if [ $found -eq 0 ]; then
            array_set[${#array_set[@]}]=$param
        else
            echo "Error: No se puede agregar $param porque ya se encuentra en el set."
            return 2
        fi
    else
        echo "Error: Se necesita un parametro exactamente."
        return 1
    fi
    return 0
}

remove() {
    if [ $# -ge 1 ]; then
        local success=0
        for r in "$@"
        do
            for ((i=0; i < ${#array_set[@]}; i++))  
            do
                if [ $r = ${array_set[$i]} ]; then
                    unset array_set[$i]
                    array_set=("${array_set[@]}")
                    success=1
                    break
                fi
            done
        done
    else
        echo "Error: Se necesita un parametro como minimo."
        return 1
    fi
    if [ $success = 0 ]; then
        echo "Error: No se pudo eliminar ningun elemento pasado por parametro."
        return 2
    fi
    return 0
}

contains() {
    if [ $# -eq 1 ]; then
        local found=0
        local param=$1
        for e in "${array_set[@]}"
        do
            if [ "$param" = "$e" ]; then
                found=1
                break
            fi
        done
        if [ $found -eq 0 ]; then
            echo "No se encuentra el elemento buscado."
            return 2
        fi
    else
        echo "Error: Se necesita un parametro exactamente."
        return 1
    fi
    return 0
}

print() {
    for e in "${array[@]}"
    do
        echo "$e"
    done
}

print_sorted() {
    print | sort -n
}
