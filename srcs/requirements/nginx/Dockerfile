FROM debian:bullseye
RUN echo "Nginx dockerfile"
RUN apt update -y && apt upgrade -y && apt install nginx -y && apt install openssl -y
RUN mkdir -p /etc/nginx/ssl/
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 777 /var/www/html
#COPY ./conf/default.conf /etc/nginx/http.d/default.conf
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/selfsigned.crt -keyout /etc/nginx/ssl/selfsigned.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"
ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
