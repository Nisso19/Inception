
all:
	docker compose -f ./srcs/docker-compose.yml up

stop:
	docker compose -f ./srcs/docker-compose.yml stop

start:
	docker compose -f ./srcs/docker-compose.yml start

down:
	docker compose -f ./srcs/docker-compose.yml down

re:
	docker-compose -f ./srcs/docker-compose.yml up --build -d

clean:
	docker compose -f ./srcs/docker-compose.yml down --rmi all --volumes --remove-orphans

fclean: clean
	docker system prune -a

.PHONY: all stop start down re clean fclean
