DOCKER_COMPOSE = docker compose
DOCKER_COMPOSE_FILE = srcs/docker-compose.yml
VOL_WORDPRESS= mkdir -p /Users/_kacimo_/ael-kace/data/wp-data
VOL_DATA_BASE= mkdir -p /Users/_kacimo_/ael-kace/data/dp-data
VOL_WORDPRESS_RMV= rm -rf /Users/_kacimo_/ael-kace/data/wp-data
VOL_DATA_BASE_RMV= rm -rf /Users/_kacimo_/ael-kace/data/dp-data

all:
	$(VOL_WORDPRESS) $(VOL_DATA_BASE)
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up

clean:
	$(VOL_WORDPRESS_RMV) $(VOL_DATA_BASE_RMV)
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down
	docker rm -f `docker ps -qa` || true
	docker rmi -f `docker images -qa` || true
	docker volume rm `docker volume ls -q` || true
	docker network rm `docker network ls -q` || true