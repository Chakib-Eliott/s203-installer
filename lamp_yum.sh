#!/bin/bash
# Authors : Eliott-B, Chakib

rpm -q httpd > echo
if [ $? -eq 1 ]
then
    yum install httpd -y
fi
rpm -q php > echo
if [ $? -eq 1 ]
then
    yum install php -y
fi
rpm -q mysql > echo
if [ $? -eq 1 ]
then
    yum install mysql -y
fi
exit 0