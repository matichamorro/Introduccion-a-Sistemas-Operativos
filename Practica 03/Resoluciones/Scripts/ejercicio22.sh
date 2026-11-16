#!/bin/bash

array=(10 3 5 7 9 3 5 4)
amountOddNum=0
for ((i=0; i < ${#array[@]}; i++))
do
    if [ $((array[i] % 2)) -eq 0 ]; then
        echo "Numero par ${array[i]} encontrado."
    else
        amountOddNum=$((amountOddNum + 1))
    fi
done
echo "Cantidad de numeros impares: $amountOddNum"
exit 0