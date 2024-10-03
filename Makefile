DOCKER_COMPOSE = docker-compose
COMPOSE_FILE = srcs/docker-compose.yml

all: up

create:
	@echo "Creating data directories"
	# mkdir -p /home/${USER}/data/wordpress
	# mkdir -p /home/${USER}/data/mariadb

up: build
	@echo "Starting all containers"
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) up

down:
	@echo "Stopping all containers"
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down

build: create
	@echo "Building/Rebuilding containers"
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) build

re: fclean all

clean:
	@echo "Removing all containers"
	@docker system prune -f

fclean: clean
	@echo "Removing all containers and volumes"
	@docker system prune -f --volumes
	@rm -rf /home/${USER}/data/wordpress
	@rm -rf /home/${USER}/data/mariadb

.PHONY: all create up down re clean fclean