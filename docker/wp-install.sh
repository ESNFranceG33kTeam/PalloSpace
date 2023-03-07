#!/bin/bash

echo "================================================================="
echo "WordPress Installer!!"
echo "================================================================="

# Download & configure Wordpress
echo "================================================================="
echo "Download and configure Wordpress"
echo "================================================================="
wp core download --locale=fr_FR
wp core config --skip-check \
        --dbhost="${WORDPRESS_DB_HOST}" \
        --dbname="${WORDPRESS_DB_NAME}" \
        --dbuser="${WORDPRESS_DB_USER}" \
        --dbpass="${WORDPRESS_DB_PASSWORD}" \
        --extra-php <<PHP
define('FORCE_SSL_ADMIN', ${FORCE_SSL_ADMIN});
if (!empty(\$_SERVER['HTTP_X_FORWARDED_PROTO']) && \$_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https') {
    \$_SERVER['HTTPS'] = 'on';
    \$_SERVER['SERVER_PORT'] = 443;
}
if (!empty(\$_SERVER['HTTP_X_FORWARDED_HOST'])) {
    \$_SERVER['HTTP_HOST'] = \$_SERVER['HTTP_X_FORWARDED_HOST'];
}
PHP


wp core install --title="${PROJECT_NAME}" --admin_user="${WORDPRESS_ADMIN_USER}" --admin_password="${WORDPRESS_ADMIN_PASSWORD}" --admin_email="${WORDPRESS_ADMIN_EMAIL}" --url="${URL_PS}"

# Install plugins & theme
echo "================================================================="
echo "Install plugins & theme"
echo "================================================================="
echo "Installing Plugins & Theme ....."
IFS=' ' read -r -a plugins <<< "${WORDPRESS_PLUGINS_TO_INSTALL}"
for plugin in "${plugins[@]}"; do
    wp plugin install "${plugin}" --activate
done
# Wait for the esn theme
wp theme install "${WORDPRESS_THEME_TO_INSTALL}" --activate

# Pull config from config/ folder
echo "================================================================="
echo "Pull config from config/ folder"
echo "================================================================="
wp config pull all

echo "================================================================="
echo "Installation ok."
echo "================================================================="