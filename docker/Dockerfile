FROM wordpress:latest

ENV PROJECT_NAME=PalloSpace

LABEL org.opencontainers.image.title="${PROJECT_NAME}}" \
      org.opencontainers.image.authors=${GITHUB_ACTOR} \
      org.opencontainers.image.vendor=${GITHUB_REPOSITORY} \
      org.opencontainers.image.source="https://github.com/ESNFranceG33kTeam/${PROJECT_NAME}" \
      org.opencontainers.image.url="https://github.com/ESNFranceG33kTeam/${PROJECT_NAME}/tags" \
      org.opencontainers.image.description="Intranet portail." \
      org.opencontainers.image.documentation="https://github.com/ESNFranceG33kTeam/${PROJECT_NAME}/blob/main/README.md" \
      org.opencontainers.image.os="alpine" \
      org.opencontainers.image.version=${GITHUB_REF}

EXPOSE 80

# Bind custom conf and custom themes/plugins
VOLUME /var/www/html/wp-config.php
VOLUME /var/www/html/wp-content