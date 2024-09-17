#!/bin/bash

service mariadb start

sleep 5

mariadb -u root -e "CREATE DATABASE IF NOT EXISTS '$DB_NAME';"

mariadb -u root -e "CREATE USER '$USER_NAME'@'%' IDENTIFIED BY '$USER_PASSWORD';"

mariadb -u root -e "CREATE USER '$USER2_NAME'@'%' IDENTIFIED BY '$USER2_PASSWORD';"

mariadb -u root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$USER_NAME'@'%';"

mariadb -u root -e "FLUSH PRIVILEGES;"

service mariadb stop

mysqld_safe
