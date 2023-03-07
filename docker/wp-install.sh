#!/bin/bash

echo "================================================================="
echo "WordPress Installer!!"
echo "================================================================="

# Download & configure Wordpress
echo "================================================================="
echo "Download and configure Wordpress"
echo "================================================================="
wp core download --locale=fr_FR
wp core config --dbhost="${DB_HOST}" --dbname="${DB_NAME}" --dbuser="${DB_USER}" --dbpass="${DB_PASSWORD}"
wp core install --title="${PROJECT_NAME}" --admin_user="wpa" --admin_password="${ADMIN_PS}" --admin_email="wpa@ixesn.fr" --url="${URL_PS}"

# Install plugins & theme
echo "================================================================="
echo "Install plugins & theme"
echo "================================================================="
echo "Installing Plugins & Theme ....."
wp plugin install wp-cfm --activate
wp plugin install authorizer --activate
wp theme install twentytwentytwo --activate

# Pull config from config/ folder
echo "================================================================="
echo "Pull config from config/ folder"
echo "================================================================="
wp config pull all

echo "================================================================="
echo "Installation ok."
echo "================================================================="