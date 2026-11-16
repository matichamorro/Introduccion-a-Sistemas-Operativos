#!/bin/bash

opciones=(
    "Ejercicio 3"
    "Ejercicio 12c - Calculadora"
    "Ejercicio 13a - Cuadrados del 1 al 100"
    "Ejercicio 13b - Comandos rápidos (Listar, DondeEstoy, QuienEsta)"
    "Ejercicio 13c - Verificar o crear archivo/directorio"
    "Ejercicio 14 - Renombrar archivos (-a / -b)"
    "Ejercicio 16 - Generar reporte de extensión por usuario"
    "Ejercicio 17 - Intercambiar mayusculas y minusculas"
    "Ejercicio 18 - Monitorear logueo de usuario"
    "Salir"
)

select opt in $(ls)
do
    case $opt in 
        "Ejercicio 3")
            ./ejercicio3
            ;;
        "Ejercicio 12c - Calculadora")
            echo "Ingrese una operacion (+, -, *, /):"
            read op
            echo "Ingrese un numero"
            read num1
            echo "Ingrese un numero"
            read num1
            ./ejercicio12 $op $num1 $num2
            ;;
        "Ejercicio 13a - Cuadrados del 1 al 100")
            ./ejercicio13a
            ;;
        "Ejercicio 13b - Comandos rápidos (Listar, DondeEstoy, QuienEsta)")
            ./ejercicio13b
            ;;
        "Ejercicio 13c - Verificar o crear archivo/directorio")
            echo "Ingrese el nombre de un archivo:"
            read file
            ./ejercicio13c $file
            ;;
        "Ejercicio 14 - Renombrar archivos (-a / -b)")
            echo "Ingrese el nombre de un archivo:"
            read file
            echo "Ingrese una opcion -a (after) / -b (before):"
            read param
            echo "Ingrese una cadena:"
            read str
            ./ejercicio14 $file $param $str
            ;;
        "Ejercicio 16 - Generar reporte de extensión por usuario")
            echo "Ingrese una extension a buscar:"
            read ext
            ./ejercicio16 $ext
            ;;
        "Ejercicio 17 - Intercambiar mayusculas y minusculas")
            ./ejercicio17
            ;;
        "Ejercicio 18 - Monitorear logueo de usuario")
            echo "Ingrese el nombre de un usuario:"
            read user
            ./ejercicio18 user
            ;;
        "Salir")
            exit 0
            ;;
    esac
done
