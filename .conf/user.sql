UPDATE mysql.user SET Password=PASSWORD('S203') WHERE User='root';
FLUSH PRIVILEGES;
exit