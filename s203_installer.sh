#!/bin/bash
# Authors : Eliott-B, Chakib

if [ $(id -u) -ne 0 ]
then
   echo "Ce script doit être lancé en tant que root" 
   exit 1
fi

echo "Recherche de HTTPD ..."
rpm -q httpd > echo
if [ $? -eq 1 ]
then
    echo "HTTPD n'est pas installé"
    echo "Installation de HTTPD ..."
    yum install httpd -y > echo
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
    yum install php -y > echo
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
    yum install mysql -y > echo
    echo "MySQL est installé"
else
    echo "MySQL est déjà installé"
fi
echo ""

echo "Démarage du service HTTPD ..."
systemctl start httpd
echo "Service HTTPD démarré"
echo ""

echo "Copie du dépôt s203 ..."
cd /var/www/html > echo
rm -Rf S203 > echo
git clone https://github.com/Chakib-Eliott/S203.git &> echo
echo "Copie du dépôt s203 terminée"
echo ""

echo "Installation terminée !"

echo ""
echo "Lancement du site ..."
firefox localhost/S203 & &> echo
echo "Lancement du site terminé !"
echo ""

exit 0