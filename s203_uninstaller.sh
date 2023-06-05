#!/bin/bash
# Authors : Eliott-B, Chakib

if [ $(id -u) -ne 0 ]
then
   echo "Ce script doit être lancé en tant que root" 
   exit 1
fi

di=$(pwd)

echo "Suppression du site ..."
cd /var/www/html > /dev/null
rm -Rf S203 > /dev/null
echo "Suppression du site terminée"

echo ""

echo "Suppresion de la base de données ..."
cd $di > /dev/null
echo 'Entrez S203 pour le mot de passe'
mysql -p < .conf/delete.sql > /dev/null
echo "Suppression de la base de données terminée"

echo ""

echo "Suppression de ce script ..."
cd .. > /dev/null
rm -Rf s203-installer > /dev/null
echo "Suppression du script terminée"

exit 0