#!/bin/bash

wp core download --allow-root

mv wp-config-sample.php wp-config.php

wp config create	--allow-root \
					--dbname=$DB_NAME \
					--dbuser=$USER_NAME \
					--dbpass=$USER_PASSWORD \
					--dbhost=$DB_HOST:3306 \
                    --path=$WP_PATH

wp core install     --allow-root \
                	--url=$URL_WORDPRESS \
                	--title=$TITLE_WORDPRESS \
                	--admin_user=$ADMIN_WORDPRESS \
                	--admin_password=$ADMIN_PASSWORD_WORDPRESS \
                	--admin_email=$ADMIN_EMAIL_WORDPRESS \
                	--path=$WP_PATH

wp user create      --allow-root \
                    $WORDPRESS_USER $WORDPRESS_USER_EMAIL \
                    --user_pass=$WORDPRESS_USER_PASSWORD \
                    --path=$WP_PATH

exec php-fpm7.4 -F