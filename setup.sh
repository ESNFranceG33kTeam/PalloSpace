#!/bin/bash

echo "================================================================="
echo "Source vars"
echo "================================================================="
source .envrc

echo "================================================================="
echo "Checks"
echo "================================================================="
if ! mysql -u "${WORDPRESS_DB_USER}" -p"${WORDPRESS_DB_PASSWORD}" -e '' 2> /dev/null; then
    echo "Can't connect to mysql."
    exit 1
fi
if ! mysql -u "${WORDPRESS_DB_USER}" -p"${WORDPRESS_DB_PASSWORD}" -e 'use pallospace' 2> /dev/null; then
    echo "Create db ${WORDPRESS_DB_NAME}"
    mysql -u "${WORDPRESS_DB_USER}" -p"${WORDPRESS_DB_PASSWORD}" -e "CREATE DATABASE ${WORDPRESS_DB_NAME};"
fi


echo "================================================================="
echo "Build images"
echo "================================================================="
docker build . -f docker/Dockerfile.wordpress --tag pallospace:latest
docker build . -f docker/Dockerfile.cli --tag wpcli:latest

echo "================================================================="
echo "Init Wordpress"
echo "================================================================="
docker run --rm --name wpcli \
    -v $PWD/html:/var/www/html \
    -e PROJECT_NAME="${PROJECT_NAME}" -e URL_PS="${URL_PS}" -e FORCE_SSL_ADMIN="${FORCE_SSL_ADMIN}" \
    -e WORDPRESS_ADMIN_USER="${WORDPRESS_ADMIN_USER}" -e WORDPRESS_ADMIN_PASSWORD="${WORDPRESS_ADMIN_PASSWORD}" -e WORDPRESS_ADMIN_EMAIL="${WORDPRESS_ADMIN_EMAIL}" \
    -e WORDPRESS_DB_NAME="${WORDPRESS_DB_NAME}" -e WORDPRESS_DB_USER="${WORDPRESS_DB_USER}" -e WORDPRESS_DB_PASSWORD="${WORDPRESS_DB_PASSWORD}" -e WORDPRESS_DB_HOST="${WORDPRESS_DB_HOST}" \
    -e WORDPRESS_PLUGINS_TO_INSTALL="${WORDPRESS_PLUGINS_TO_INSTALL}" -e WORDPRESS_THEME_TO_INSTALL="${WORDPRESS_THEME_TO_INSTALL}" \
    -e WP_CLI_CACHE_DIR="${WP_CLI_CACHE_DIR}" \
    wpcli:latest

echo "================================================================="
echo "Launch Wordpress"
echo "================================================================="
docker rm -f pallospace 2> /dev/null
docker run -d --name pallospace \
    -p 8080:80 \
    -v $PWD/html:/var/www/html \
    pallospace:latest
