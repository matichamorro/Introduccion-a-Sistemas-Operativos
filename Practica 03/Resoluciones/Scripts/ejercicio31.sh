#!/bin/bash

if [ $# -ge 1 ]; then
    for username in "$@"
    do
        found=0
        for userhome in /home/*
        do
            if [ "$username" = "$(basename $userhome)" ]; then
                echo "Generando archivos y directorios en el directorio /home del usuario $username."
                mkdir -p "$userhome/directorio_iso"/{2025,2026}/{01..12}
                touch "$userhome/directorio_iso"/{2025,2026}/{01..12}/archivo.txt
                found=1
                break
            fi
        done
        if [ $found -eq 0 ]; then
            echo "Aviso: El usuario '$username' no existe en el sistema o su directorio home no es válido." 
        fi
    done
else
    echo "Error: Se espera como minimo un parametro"
    exit 1
fi

exit 0
