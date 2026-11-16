#!/bin/bash

amountMoves=0

if [ ! -d "$HOME/bin" ]; then
    mkdir "$HOME/bin"
fi

for file in ./*
do
    if [ -f "$file" ] && [ -x "$file" ]; then
        mv "$file" "$HOME/bin"
        echo "Se movio: $file"
        amountMoves=$(expr $amountMoves + 1)
    fi
done

if [ $amountMoves -eq 0 ]; then
    echo "No se ha movido ningún archivo."
else
    echo "Cantidad de movimientos: $amountMoves."
fi

exit 0
