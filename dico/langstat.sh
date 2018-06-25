#!/bin/bash

filename='hello'

echo "this is test : ${filename}"

echo "Vous avez lancé $0, il y a $# paramètres"
echo "Le paramètre 1 est $1"i

char='A'

filename='dico.txt'
echo Start
while read p; do
    echo $p
done < $filename
