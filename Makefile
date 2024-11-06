
all:
	mkdir -p /home/inception/data-wordpress
	mkdir -p /home/inception/data-mariadb
	docker compose -f ./srcs/docker-compose.yml up

stop:
	docker compose -f ./srcs/docker-compose.yml stop

start:
	docker compose -f ./srcs/docker-compose.yml start
dir:
	mkdir -p /home/inception/data-mariadb
	mkdir -p /home/inception/data-wordpress
down:
	docker compose -f ./srcs/docker-compose.yml down

re:
	docker-compose -f ./srcs/docker-compose.yml up --build -d

clean:
	docker compose -f ./srcs/docker-compose.yml down --rmi all --volumes --remove-orphans

fclean: clean
	sudo rm -rf /home/inception/data-wordpress
	sudo rm -rf /home/inception/data-mariadb
	docker system prune -a

.PHONY: all stop start down re clean fclean
