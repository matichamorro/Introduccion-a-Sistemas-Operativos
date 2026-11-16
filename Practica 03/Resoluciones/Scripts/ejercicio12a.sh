#!/bin/bash
echo "Ingrese el primer numero:"
read nro1

echo "Ingrese el segundo numero:"
read nro2

echo "Multiplicacion: $(expr $nro1 \* $nro2)"
echo "Suma: $(expr $nro1 + $nro2)"
echo "Resta: $(expr $nro1 - $nro2)"

if [ $num1 -gt $num2 ]; then
    echo "El mayor es el primer número: $num1"
elif [ $num1 -lt $num2 ]; then
    echo "El mayor es el segundo número: $num2"
else
    echo "Ambos números son iguales."
fi
exit 0