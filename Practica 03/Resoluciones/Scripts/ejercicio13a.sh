#!/bin/bash

for ((i=1; i <= 100; i++)); 
do 
    echo "Numero $i, y su cuadrado: $(expr $i \* $i)"; 
done

exit 0