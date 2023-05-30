#!/bin/bash
# Authors : Eliott-B, Chakib

sudo echo > /tmp/s203.log
if ($? == 1)
then
    echo "Il faut être sudo pour lancer ce script" 
    exit 1
fi

echo "Création de la base de données ..."
mysql -u root -p < .conf/s203.sql > /tmp/s203.log
echo "Création de la base de données terminée"

exit 0