FROM debian:bullseye
RUN apt update -y && apt upgrade -y && apt-get install mysql-server -y
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/mariadbscript.sh /mariadbscript.sh
EXPOSE 3306
ENTRYPOINT ["bash", "/mariadbscript.sh"]
