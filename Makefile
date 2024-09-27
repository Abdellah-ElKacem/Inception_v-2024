DOCKER_COMPOSE = docker compose
DOCKER_COMPOSE_FILE = srcs/docker-compose.yml
VOL_WORDPRESS= sudo mkdir -p /home/ael-kace/data/wp-data && sudo chmod -R 755 /home/ael-kace/data/wp-data
VOL_DATA_BASE= sudo mkdir -p /home/ael-kace/data/db-data && sudo chmod -R 755 /home/ael-kace/data/db-data
VOL_WORDPRESS_RMV= sudo rm -rf /home/ael-kace/data/wp-data
VOL_DATA_BASE_RMV= sudo rm -rf /home/ael-kace

all:
	$(VOL_WORDPRESS) && $(VOL_DATA_BASE)
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up --build

clean:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down

fclean:
	$(VOL_WORDPRESS_RMV) && $(VOL_DATA_BASE_RMV)
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down -v
