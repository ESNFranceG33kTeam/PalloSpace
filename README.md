# PalloSpace
Here is the PalloSpace.

## Install locally
To run this docker you need to have a database server and docker running.
You also need to file the variable [.envrc](.envrc)

### Automatically

To setup your installation automatically, you can launch the script [`./setup.sh`](setup.sh)

### Manually

#### Build

```docker build . -f docker/Dockerfile.wordpress --tag pallospace:latest```
```docker build . -f docker/Dockerfile.cli --tag wpcli:latest```

#### Init

```
docker run --rm --name wpcli \
    -v $PWD/html:/var/www/html \
    -e PROJECT_NAME="${PROJECT_NAME}" -e URL_PS="${URL_PS}" -e FORCE_SSL_ADMIN="${FORCE_SSL_ADMIN}" \
    -e WORDPRESS_ADMIN_USER="${WORDPRESS_ADMIN_USER}" -e WORDPRESS_ADMIN_PASSWORD="${WORDPRESS_ADMIN_PASSWORD}" -e WORDPRESS_ADMIN_EMAIL="${WORDPRESS_ADMIN_EMAIL}" \
    -e WORDPRESS_DB_NAME="${WORDPRESS_DB_NAME}" -e WORDPRESS_DB_USER="${WORDPRESS_DB_USER}" -e WORDPRESS_DB_PASSWORD="${WORDPRESS_DB_PASSWORD}" -e WORDPRESS_DB_HOST="${WORDPRESS_DB_HOST}" \
    -e WP_CLI_CACHE_DIR="${WP_CLI_CACHE_DIR}" \
    wpcli:latest
```

#### Launch

```
docker run -d --name pallospace \
    -p 8080:80 \
    -v $PWD/html:/var/www/html \
    pallospace:latest
```

Now you can open your browser into `http://localhost:8080`

## Version control

The configuration, block, and other structural modification about your website are store in the db. In order to version control them and to install them automatically at startup we need to track them.
To do that, we use the plugin [WP-CFM](https://fr.wordpress.org/plugins/wp-cfm/), it allow to register the db modification as `json` files in [html/wp-content/config/](html/wp-content/config/).
The modification are class into `Bundles`, feel free to create more or add options to some but keep them as categorize as possible.

To track your modifications go to [this page](http://127.0.0.1:8080/wp-admin/options-general.php?page=wpcfm) :
- Click `Diff` to see your modifications
- Click `Pull` if you want to update the db
- Click `Push` if you want to update the `json` files