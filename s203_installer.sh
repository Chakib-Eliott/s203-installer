#!/bin/bash
# Authors : Eliott-B, Chakib

if [ $(id -u) -ne 0 ]
then
   echo "Ce script doit être lancé en tant que root" 
   exit 1
fi

di=$(pwd)

echo "Recherche de HTTPD ..."
rpm -q httpd > /dev/null
if [ $? -eq 1 ]
then
    echo "HTTPD n'est pas installé"
    echo "Installation de HTTPD ..."
    yum install httpd -y > /dev/null
    echo "HTTPD est installé"
else
    echo "HTTPD est déjà installé"
fi
echo ""

echo "Recherche de PHP ..."
rpm -q php > /dev/null
if [ $? -eq 1 ]
then
    echo "PHP n'est pas installé"
    echo "Installation de PHP ..."
    yum install php -y > /dev/null
    echo "PHP est installé"
else
    echo "PHP est déjà installé"
fi
echo ""

echo "Recherche de MySQL ..."
rpm -q mariadb-server > /dev/null
if [ $? -eq 1 ]
then
    echo "MySQL n'est pas installé"
    echo "Installation de MySQL ..."
    yum install mariadb-server -y > /dev/null
    echo "MySQL est installé"
else
    echo "MySQL est déjà installé"
fi
echo ""

echo "Démarage du service HTTPD ..."
systemctl start httpd
echo "Service HTTPD démarré"
echo ""

echo "Démarage du service MySQL ..."
mysqld_safe --skip-grant-tables --skip-networking & &> /dev/null
mysql < .conf/user.sql &> /dev/null
echo 'Entrez S203 pour le mot de passe'
mysqladmin shutdown -p &> /dev/null
systemctl start mariadb
echo "Service MySQL démarré"
echo ""

echo "Copie du dépôt s203 ..."
cd /var/www/html > /dev/null
rm -Rf S203 > /dev/null
git clone https://github.com/Chakib-Eliott/S203.git &> /dev/null
echo "Copie du dépôt s203 terminée"
echo ""

echo "Création de la base de données ..."
cd $di
echo "Entrez S203 pour le mot de passe"
mysql -p < .conf/s203.sql > /dev/null
echo "Création de la base de données terminée"
echo ""

echo "Installation terminée !"

echo ""
echo "Lancement du site ..."
firefox localhost/S203 & &> /dev/null
echo "Lancement du site terminé !"
echo ""

exit 0