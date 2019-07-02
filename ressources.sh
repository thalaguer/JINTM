#!/bin/bash

read -p "Nous allons installer open JDK8, Git et node.js (LTS), vous confirmez ?  (y/N) " response1

# Si la réponse est vide donne la valeur N à la variable N (réponse par défaut)
if [ -z $response1 ] ; then
response="N"
fi

# Tant que la réponse n'est pas y ou N, boucle pour obtenir une des deux réponse souhaité 
while [[ "$response1" != "y" && "$response1" != "N" ]]
do
echo "Choisissez y ou N"
read -p "Nous allons installer open JDK8, Git et node.js (LTS), vous confirmez ?  (y/N) " response1
done

echo "Nous allons avoir besoin de votre mot de passe root"

# Si la réponse est y installe et met-à-jour les paquets
if [ $response1 == "y" ] ; then
    
    # Connection en root (demande le mot de passe)
    # Lance les commandes root dans un flux et sort
    su -c '
	echo "Mise-à-jour des paquets"
    apt-get update
    echo "Installation des paquets"
    apt-get upgrade -y
    echo "Installation de open JDK"
    apt-get install openjdk-8-jdk -y
    java -version
    javac -version
    echo "Installation de Git"
    apt-get install git -y
    git version
    echo "Curl"
    apt-get install curl software-properties-common -y
    curl -sL https://deb.nodesource.com/setup_10.x | bash -
    echo "Installation de node.js"
    apt-get install nodejs -y
    node -v
    npm -v
    exit'
    
# Sinon affiche un message
else 
	echo "Les paquets ne seront pas installés"
fi