FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt -y install wget 
RUN apt-get install curl wget netcat sendmail -y
RUN apt install -y php7.4-fpm php-mysql mariadb-client
RUN apt-get clean
EXPOSE 9000
RUN mkdir -p /var/www/wordpress
RUN chown -R root:root /var/www/wordpress
RUN chmod 777 /var/www/wordpress
RUN rm -f /usr/local/bin/wp
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN chown www-data:www-data /usr/local/bin/wp
COPY tools/start_setup.sh start_setup.sh
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN chmod 777 /start_setup.sh
ENTRYPOINT ["bash", "/start_setup.sh"]


