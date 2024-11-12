sleep 30

echo $MYSQL_DATABASE
echo $MYSQL_USER
echo $MYSQL_PASSWORD
if [ ! -f /var/www/wordpress/wp-config.php ]; then

	#wp core download --path='/var/www/wordpress' --allow-root
	sleep 20
	./wp-cli.phar config create --allow-root \
    	#wp config create --allow-root \
		--dbname='SQL_Inception' \
		--dbuser='yaainouc' \
	       	--dbpass='changeme' \
	       	--dbhost='mariadb:3306' \
		--path='/var/www/wordpress' \
		--skip-check
	sleep 10
	if [ ! -f /var/www/wordpress/wp-config.php ]; then
		echo "wp-config.php n'est pas creer"
	else
	wp core install --allow-root \
		--url=$WP_SITE \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN \
		--admin_password=$WP_ADMIN_PASSWORD \
		--admin_email=$WP_ADMIN_EMAIL \
		--path='/var/www/wordpress'
    	wp user create $WP_USER \
		$WP_USER_EMAIL \
		--role=author \
		--user_pass=$WP_USER_PASS \
		--allow-root \
		--path='/var/www/wordpress'
	fi
fi
echo -e "starting php fpm"
exec php-fpm7.4 -F
