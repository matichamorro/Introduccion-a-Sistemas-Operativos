#!/bin/bash

# Controla que se reciban exactamente 2 parámetros
if [ $# -ne 2 ]; then
    echo "Error: Debe ingresar exactamente dos números como parámetros."
    echo "Uso: $0 <numero1> <numero2>" # $0 guarda el nombre del script
    exit 1 # Al ser distinto de 0, indica error
fi

nro1=$1
nro2=$2

echo "Multiplicacion: $(expr $nro1 \* $nro2)"
echo "Suma: $(expr $nro1 + $nro2)"
echo "Resta: $(expr $nro1 - $nro2)"

if [ $num1 -gt $num2 ]; then
    echo "El mayor es el primer número: $num1"
elif [ $num2 -gt $num1 ]; then
    echo "El mayor es el segundo número: $num2"
else
    echo "Ambos números son iguales."
fi
exit 0