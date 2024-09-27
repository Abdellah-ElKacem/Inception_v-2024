#!/bin/bash

service mariadb start

sleep 5

mariadb -u root -e "
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER_NAME'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER_NAME'@'%';
FLUSH PRIVILEGES;
"

service mariadb stop

mysqld_safe
