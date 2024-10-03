#!/bin/sh

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
    wp config create --dbname=$DB_NAME --dbuser=$DB_USER \
        --dbpass=$DB_PASS --dbhost=$DB_HOST --allow-root --skip-check --path=/var/www/html

    echo "Installing WordPress"
    wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER \
        --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL \
        --allow-root

    echo "Creating a new WordPress user"
    wp user create $WP_AUTHOR_USER $WP_AUTHOR_EMAIL --role=author --user_pass=$WP_AUTHOR_PASS --allow-root

    chmod 777 /var/www/html/wp-content

    wp theme install $WP_THEME --path=/var/www/html --allow-root
    wp theme activate $WP_THEME --path=/var/www/html --allow-root
fi

php-fpm81 -F