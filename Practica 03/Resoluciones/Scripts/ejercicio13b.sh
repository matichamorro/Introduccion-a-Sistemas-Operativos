#!/bin/bash

select opcion in "Listar" "DondeEstoy" "QuienEsta"
do
    case $opcion in
        "Listar")
            ls -l 
            ;;
        "DondeEstoy")
            pwd
            ;;
        "QuienEsta")
            who
            ;;
        *) 
            echo "Opción inválida. Por favor, elija una opción válida."
            ;;
    esac
done

exit 0