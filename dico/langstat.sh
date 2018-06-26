#!/bin/bash

echo -e '\nBienvenue dans ce petit script bash :'

# le petit bonus un param random pour mettre le bazar dasn les results ;)
if [ $# -ge 2 ] && [ $2 = '--random' ];then
	param='R'
else
	# un petit display pour savoir quel est le param de départ
	echo -e "Vous avez lancé $0, il y a $# paramètres\nLe paramètre 1 est $1"
	param='nr'
fi

# condition de vérification que le fichier exist et ai l'extension .txt
if [ ! $# -ge 1 ];then
	echo -e 'ERROR -- un fichier en premier paramètre est nécessaire pour faire fonctionner le script'
elif [ !  ${1: -4} == ".txt" ];then
	echo -e 'ERROR -- Un fichier text est requis (extension .txt) pour faire fonctionner le script\nEssayer à nouveau svp'
else
	filename=$1
	# display result
	echo '=== RESULTATS DU SCRIPT =='
	awk -v FS= '{for (i=1;i<=NF;i++) a[tolower($i)]++;};
		END {chars="abcdefghijklmnopqrstuvwxyz";
		for (i=1;i<27;i++) { key=substr(chars,i,1);print a[key] " - " toupper(key) };}' $filename | sort -$param
fi
