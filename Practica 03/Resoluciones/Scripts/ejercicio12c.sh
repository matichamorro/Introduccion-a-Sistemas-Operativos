#!/bin/bash

# Chequeo de parametros (exactamente 3)
if [ $# -ne 3 ]; then
    echo "Error: La cantidad de parametros ingresada debe ser exactamente tres."
    echo "Sintaxis esperada: $0 <operacion> <numero 1> <numero 2>"
    echo "Operaciones validas: +, -, *, /"
    exit 1
fi

op=$1
nro1=$2
nro2=$3

case $op in
    "+") echo "Resultado: $(expr $nro1 + $nro2)" ;;
    "-") echo "Resultado: $(expr $nro1 - $nro2)" ;;
    "*") echo "Resultado: $(expr $nro1 \* $nro2)" ;;
    "%")
        if [ $nro2 -eq 0 ]; then
            echo "Error: Se esta intentando dividir por cero"
            exit 2
        fi
        echo "Resultado:"
        echo "Cociente: $(expr $nro1 / $nro2)"
        echo "Resto: $(expr $nro1 % $nro2)"
        ;;
    *)
        echo "Error: Operación '$op' no válida."
        echo "Utilice una de las siguientes: +, -, *, %"
        exit 3
        ;;
esac
exit 0