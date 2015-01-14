#!/bin/bash

#Title
clear
echo -e "\033[1;31mLanguage statistique script bash\033[0m"
echo

#Test if avec au moins une option presente
if [ -z $1 ]; then
	echo -e "\033[1;31mAu moins une option est nécessaire !\033[0m"
	echo "Voir l'aide avec --help"
	exit 1
else
	echo -e "Lancement de $0, qui comporte $#  parametere(s)"
	echo -e "Le premier parametre est $1"
fi

#Voir l'aide
#NB: Quand il n'y a pas de deuxième option, une erreur est retournées puis supprimer automatiquement
if [ $1 = "--help" ] || [ $2 = "--help" ] 2> /dev/null
then
	echo
	echo -e "\033[1;31mHelp\033[0m"
	echo -e "Options disponibles :"
	echo -e "syntaxe : \033[1m./langstat.sh \033[0;31m \033[0;4mFILE\033[0m [\033[0;4moptions\033[0m]"
	echo
	echo -e "Le fichier à traiter doit être dans le dossier actuel (ex : dico.txt)"
	echo -e "	--second-parametre Resultat par ordre alphabétique"
	echo -e "	--help Pour consulter l'aide"
	echo
	exit 1
fi

#Le ficher à traiter existe vraiement ?
if [ ! -f $1 ] ; then
	echo -e "\033[1;31mLe fichier n'existe pas !\033[0m"
	echo -e "Reéssayer avec un nom de fichier valide"
	exit 1
else
	#Affichage selon option choisit
	if [ -z $2 ]; then
		#Du plus utilisé au moins utilisé
		echo -e "Résultat du caractère le plus utilisé au moins utilisé."
		for letter in {A..Z}; do
			echo "`grep -c $letter $1` - $letter"
		done | sort -rn
	elif [ $2 = "--second-parametre" ]; then
			echo -e "Résultat du caractère le plus utilisé au moins utilisé pour les voyelles."
			for letter in {A,E,I,O,U,Y}; do
				echo "`grep -c $letter $1` - $letter"
			done | sort -rn
	#Si l'option n'existe pas : error returned
	else
		echo -e "\033[1;31m SYNTAX ERROR\033[0m"
	fi
fi
echo
exit 1
