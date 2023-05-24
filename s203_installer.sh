#!/bin/bash
# Authors : Eliott-B, Chakib

if [ $(id -u) -ne 0 ]
then
   echo "Ce script doit être lancé en tant que root" 
   exit 1
fi

echo "Recherche de HTTPD ..."
rpm -q httpd > /tmp/s203.log
if [ $? -eq 1 ]
then
    echo "HTTPD n'est pas installé"
    echo "Installation de HTTPD ..."
    yum install httpd -y > /tmp/s203.log
    echo "HTTPD est installé"
else
    echo "HTTPD est déjà installé"
fi
echo ""

echo "Recherche de PHP ..."
rpm -q php > /tmp/s203.log
if [ $? -eq 1 ]
then
    echo "PHP n'est pas installé"
    echo "Installation de PHP ..."
    yum install php -y > /tmp/s203.log
    echo "PHP est installé"
else
    echo "PHP est déjà installé"
fi
echo ""

echo "Recherche de MySQL ..."
rpm -q mysql > /tmp/s203.log
if [ $? -eq 1 ]
then
    echo "MySQL n'est pas installé"
    echo "Installation de MySQL ..."
    yum install mysql -y > /tmp/s203.log
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
cd /var/www/html > /tmp/s203.log
rm -Rf S203 > echo
git clone https://github.com/Chakib-Eliott/S203.git &> /tmp/s203.log
echo "Copie du dépôt s203 terminée"
echo ""

echo "Installation terminée !"

echo ""
echo "Lancement du site ..."
firefox localhost/S203 & &> /tmp/s203.log
echo "Lancement du site terminé !"
echo ""

exit 0