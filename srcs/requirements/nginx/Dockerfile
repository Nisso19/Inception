FROM debian:bullseye
RUN echo "Nginx dockerfile"
RUN apt update -y && apt upgrade -y && apt install nginx -y && apt install openssl -y && apt install net-tools
RUN mkdir -p /etc/nginx/ssl/
RUN mkdir -p /etc/nginx/conf.d/
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 777 /var/www/html
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42Network/OU=42Paris/CN=yaainouc.42.fr"
EXPOSE 443
ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
