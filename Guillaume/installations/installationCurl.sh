#!/bin/bash

# Ce script permet d'installer Curl

read -p "Voulez-vous installer Curl  (y/N) " response1

# Si la réponse est vide donne la valeur N à la variable N (réponse par défaut)
if [ -z $response1 ] ; then
response="N"
fi

# Tant que la réponse n'est pas y ou N, boucle pour obtenir une des deux réponse souhaité 
while [[ "$response1" != "y" && "$response1" != "N" ]]
do
echo "Choisissez y ou N"
read -p "Voulez-vous installer Curl (y/N) " response1
done

echo "Nous allons avoir besoin de votre mot de passe root"

# Si la réponse est y met-à-jour et installe le paquet
if [ $response1 == "y" ] ; then
    
    # Connection en root (demande le mot de passe)
    # Lance les commandes root dans un flux 
    # Installe tous les paquets et donne les versions
    su -c '
    echo "##################################"
	echo "#### Mise-à-jour des paquets #####"
    echo "##################################"
    apt-get update
    echo "##################################"
	echo "#### Installation des paquets ####"
    echo "##################################"
    apt-get upgrade -y
    echo "##################################"
	echo "####### Installation Curl ########"
    echo "##################################"
    apt-get install curl software-properties-common -y
    curl -sL https://deb.nodesource.com/setup_10.x | bash -
    echo "##################################"
	echo "######## Curl en version #########"
    echo "##################################"
    curl --version
    exit'
else 
	echo "OpenJDK8 n'a pas été installé"
fi
