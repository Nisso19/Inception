sleep 20
if [ ! -f /var/www/wordpress/wp-config.php ]; then

	wp core download --path='/var/www/html' --allow-root

    	wp core config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb
    	wp core install --allow-root --url=$WP_SITE --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL
    	wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASS --allow-root
    	chown -R www-data:www-data /var/www/html/*
    	find /var/www/html/ -type d -exec chmod 755 {} \;
    	find /var/www/html/ -type f -exec chmod 644 {} \;
	sed -i "s/listen = .*/listen = wordpress:9000/g" /etc/php/7.4/fpm/pool.d/www.conf
fi
echo -e "starting php fpm"
exec php-fpm7.4 -F
