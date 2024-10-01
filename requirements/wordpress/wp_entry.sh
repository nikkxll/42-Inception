#!/bin/sh

MAX_PINGS=10
ping_count=0

while ! mysqladmin ping -h "mariadb" --silent; do
    ping_count=$((ping_count + 1))
    echo "Waiting for MySQL to be ready... (attempt $ping_count)"
    
    if [ "$ping_count" -ge "$MAX_PINGS" ]; then
        echo "Error: MySQL did not start after $MAX_PINGS attempts. Exiting."
        exit 1
    fi
    sleep 2
done

if [ ! -f /var/www/html/wp-config.php ]; then
    echo "Downloading WordPress core files"
    wp core download --allow-root --path=/var/www/html

    echo "Creating wp-config.php"
    wp config create --dbname=wordpress --dbuser=wpuser \
        --dbpass=password --dbhost=mariadb --allow-root --skip-check --path=/var/www/html

    echo "Installing WordPress"
    wp core install --url=https://dnikifor.42.fr --title=inception --admin_user=dnikifor \
        --admin_password=123 --admin_email=admin@admin.com \
        --allow-root

    echo "Creating a new WordPress user"
    wp user create dnikifor dnikifor@test.com --role=author --user_pass=password --allow-root

    wp config set FORCE_SSL_ADMIN 'false' --allow-root

    chmod 777 /var/www/html/wp-content

    wp theme install twentytwentyfour --path=/var/www/html --allow-root
    wp theme activate twentytwentyfour --path=/var/www/html --allow-root
fi

php-fpm81 -F