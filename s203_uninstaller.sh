#!/bin/bash
# Authors : Eliott-B, Chakib

if [ $(id -u) -ne 0 ]
then
   echo "Ce script doit être lancé en tant que root" 
   exit 1
fi

pwd > $pwd

echo "Suppression du site ..."
cd /var/www/html > echo
rm -Rf S203 > echo
echo "Suppression du site terminée"

echo ""

echo "Suppression de ce script ..."
cd .. > echo
cd $pwd > echo
cd .. > echo
rm -Rf s203-installer > echo
echo "Suppression du script terminée"

exit 0