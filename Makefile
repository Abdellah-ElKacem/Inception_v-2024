DOCKER_COMPOSE = docker compose
DOCKER_COMPOSE_FILE = srcs/docker-compose.yml
VOL_WORDPRESS= mkdir -p /Users/$(USER)/aelkace/data/wp-data && chmod -R 755 /Users/$(USER)/aelkace/data/wp-data
VOL_DATA_BASE= mkdir -p /Users/$(USER)/aelkace/data/db-data && chmod -R 755 /Users/$(USER)/aelkace/data/dp-data
VOL_WORDPRESS_RMV= rm -rf /Users/$(USER)/aelkace/data/wp-data
VOL_DATA_BASE_RMV= rm -rf /Users/$(USER)/aelkace/data/db-data

all:
	$(VOL_WORDPRESS) && $(VOL_DATA_BASE)
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up --build

clean:
	$(VOL_WORDPRESS_RMV) && $(VOL_DATA_BASE_RMV)
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down -v