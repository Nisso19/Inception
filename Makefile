NAME = Inception

all:
	mkdir -p /home/inception/data-wordpress
	mkdir -p /home/inception/data-mariadb
	docker compose -f srcs/docker-compose.yml build
	docker compose -f srcs/docker-compose.yml up

stop:
	docker compose -f srcs/docker-compose.yml stop
dir:
	mkdir -p /home/inception/data-mariadb
	mkdir -p /home/inception/data-wordpress
down:
	docker compose -f ./srcs/docker-compose.yml down
clean:
	docker compose -f ./srcs/docker-compose.yml down --rmi all --volumes --remove-orphans
	sudo rm -rf /home/inception/data-wordpress
	sudo rm -rf /home/inception/data-mariadb

fclean: clean
	sudo rm -rf /home/inception/data-wordpress
	sudo rm -rf /home/inception/data-mariadb
	docker system prune -a

.PHONY: all stop start down re clean fclean
