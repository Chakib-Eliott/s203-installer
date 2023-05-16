#!/bin/bash
# Authors : Eliott-B, Chakib

echo "Recherche de HTTPD ..."
rpm -q httpd > echo
if [ $? -eq 1 ]
then
    echo "HTTPD n'est pas installé"
    echo "Installation de HTTPD ..."
    yum install httpd -y
    echo "HTTPD est installé"
else
    echo "HTTPD est déjà installé"
fi
echo ""

echo "Recherche de PHP ..."
rpm -q php > echo
if [ $? -eq 1 ]
then
    echo "PHP n'est pas installé"
    echo "Installation de PHP ..."
    yum install php -y
    echo "PHP est installé"
else
    echo "PHP est déjà installé"
fi
echo ""

echo "Recherche de MySQL ..."
rpm -q mysql > echo
if [ $? -eq 1 ]
then
    echo "MySQL n'est pas installé"
    echo "Installation de MySQL ..."
    yum install mysql -y
    echo "MySQL est installé"
else
    echo "MySQL est déjà installé"
fi
echo ""

echo "Copie du dépôt s203 ..."
cd /var/www/html
rm -Rf S203
git clone https://github.com/Chakib-Eliott/S203.git
echo "Copie du dépôt s203 terminée"

echo "Installation terminée !"
exit 0