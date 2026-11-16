#!/bin/bash

num=(10 3 5 7 9 3 5 4)

function productoria {
    local total=1
    for i in ${num[@]}
    do
        total=$((total * i))
    done
    echo "El producto total es: $total"
    return 0
}