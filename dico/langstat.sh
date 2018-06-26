#!/bin/bash

# un petit display pour savoir quel est le param de départ
echo -e "Vous avez lancé $0, il y a $# paramètres\nLe paramètre 1 est $1"

# condition de vérification que le fichier exist et ai l'extension .txt
if [ ! -e $1 ] || [ !"$1" == "*.txt" ];then
	echo -e 'Un fichier text est requis (extension .txt) pour faire fonctionner le script\nEssayer à nouveau svp'
else
	# display result
	awk -v FS= '{for (i=1;i<=NF;i++) a[tolower($i)]++;};
		END {chars="abcdefghijklmnopqrstuvwxyz";
		for (i=1;i<27;i++) { key=substr(chars,i,1);print a[key] " - " toupper(key) };}' $1 | sort -nr
fi
