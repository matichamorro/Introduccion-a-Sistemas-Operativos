#!/bin/bash

vector1=( 1 80 65 35 2 )
vector2=( 5 98 3 41 8 )  

if [ ${#vector1[@]} -ge ${#vector2[@]} ]; then
    len=${#vector1[@]}
else
    len=${#vector2[@]}
fi

for ((i=0; i < len; i++))
do
    echo "La suma de los elementos de la posicion $i de los vectores es $((vector1[i] + vector2[i]))"
done
exit 0