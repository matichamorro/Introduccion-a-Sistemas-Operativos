#!/bin/bash

current_dir=$(pwd)
while read -r line
do
    echo $(echo $line | tr -d'aA' | tr 'a-zA-Z' 'A-Za-z') 
done < current_dir

exit 0