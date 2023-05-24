#!/bin/bash
# Authors : Eliott-B, Chakib

if [ $(id -u) -ne 0 ]
then
   echo "Ce script doit être lancé en tant que root" 
   exit 1
fi

di=$(pwd)

echo "Suppression du site ..."
cd /var/www/html > /tmp/s203.log
rm -Rf S203 > /tmp/s203.log
echo "Suppression du site terminée"

echo ""

echo "Suppression de ce script ..."
cd $di > /tmp/s203.log
cd .. > /tmp/s203.log
rm -Rf s203-installer > /tmp/s203.log
echo "Suppression du script terminée"

exit 0