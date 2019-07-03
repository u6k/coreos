#!/bin/bash -eu

source /home/u6k/.env

docker run --rm \
	-v "${DOCKER_VOLUMES}/redmine/db:/pg_data" \
	-v "/mnt/data/backup/redmine/backup:/backup" \
	-e "PGHOST=${DOCKER_REDMINE_DB_HOST}" \
	-e "PGUSER=${DOCKER_REDMINE_DB_USERNAME}" \
	-e "PGPASSWORD=${DOCKER_REDMINE_DB_PASSWORD}" \
	-e "PGDATABASE=${DOCKER_REDMINE_DB_DATABASE}" \
	--net=production \
	--link "redmine_db_1:redmine_db_1" \
	u6kapps/docker-pg_rman $@
