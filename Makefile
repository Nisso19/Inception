NAME = Inception

all: up 
	
	
up:
	sudo mkdir -p /home/inception/data-wordpress
	sudo mkdir -p /home/inception/data-mariadb
	docker compose -f srcs/docker-compose.yml up -d --build
start:
	docker compose -f srcs/docker-compose.yml start
stop:
	docker compose -f srcs/docker-compose.yml stop
down:
	docker compose -f ./srcs/docker-compose.yml down
clean:
	docker compose -f ./srcs/docker-compose.yml down --rmi all --volumes --remove-orphans
	sudo rm -rf /home/inception/data-wordpress
	sudo rm -rf /home/inception/data-mariadb

fclean: clean
	docker system prune -f -a --volumes

.PHONY: all stop start down re clean fclean
