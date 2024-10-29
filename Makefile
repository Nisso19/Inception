NAME = Inception
DOCKERCOMPOSE = docker compose -f srcs/docker-compose.yml
DBPATH = /home/inception
all:${NAME}

${NAME}:
	rm -rf ${DBPATH}/data-mariadb
	rm -rf ${DBPATH}/data-wordpress
	mkdir -p ${DBPATH}/data-mariadb
	mkdir -p ${DBPATH}/data-wordpress
	${DOCKERCOMPOSE} build
	${DOCKERCOMPOSE} up

clean:
	${DOCKERCOMPOSE} down
	docker-compose -f srcs/docker-compose.yml down --volumes
	rm -rf ${HOME}/data-mariadb
	rm -rf ${HOME}/data-wordpress
