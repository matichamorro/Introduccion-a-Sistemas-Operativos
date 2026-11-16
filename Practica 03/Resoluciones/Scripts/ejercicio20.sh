#!/bin/bash

stack=()

function push {
    if [ $# -eq 1 ]; then
        stack[${#stack[@]}]=$1
    else
        echo "Error: se espera exactamente un parametro"
        return 1    
    fi
    return 0
}

function pop {
    local len=${#stack[@]}
    if [ "$len" -gt 0 ]; then
        echo "${stack[$((len - 1))]}"
        unset "${stack[$((len - 1))]}"     
    else
        echo "Error: La pila ya se encuentra vacía."
        return 1
    fi
    return 0
}

function length {
    echo "${#stack[@]}"
    return 0
}

function print {
    echo "${stack[@]}"
    return 0
}

for ((i=0; i < 10; i++))
do
    echo "Agregando elemento $i.."
    push $i
done

for ((i=0; i < 3; i++))
do
    echo "Sacando elemento: "
    pop
done

echo -n "Longitud actual: "
length

echo -n "Elementos en la pila: "
print

exit 0