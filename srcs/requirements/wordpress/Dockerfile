FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt -y install wget
RUN apt-get install curl wget netcat -y
RUN apt install -y php7.4-fpm php-mysql mariadb-client
RUN apt-get clean
RUN mkdir -p /var/www/wordpress
RUN chown -R root:root /var/www/wordpress
RUN chmod 777 /var/www/wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp core download --path='/var/www/wordpress' --allow-root
COPY tools/start_setup.sh start_setup.sh
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
#RUN chmod +x start_setup.sh
RUN chmod 777 /start_setup.sh
ENTRYPOINT ["bash", "/start_setup.sh"]

#RUN wget https://fr.wordpress.org/wordpress-6.6.1-fr_FR.tar.gz -P /var/www
#RUN cd /var/www && tar -xzf wordpress-6.6.1-fr_FR.tar.gz && rm wordpress-6.6.1-fr_FR.tar.gz
#COPY conf/www.conf /etc/php/7.4/fpm/pool.d/
#RUN wget  https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#RUN chmod +x wp-cli.phar
#RUN mv wp-cli.phar /usr/local/bin/wp
#COPY tools/start_setup.sh /start_setup.sh
#copy conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
#RUN chmod 777 /start_setup.sh
#ENTRYPOINT ["bash", "/start_setup.sh"]
