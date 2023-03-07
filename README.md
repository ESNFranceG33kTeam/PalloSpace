# PalloSpace
Here is a PalloSpace

## Install locally
To run this docker you need to have a database running. And to create a base named `pallospace`.

The connexion config are to be filled in the [wp-config file](wp-config.php).

### Build

```docker build . -f docker/Dockerfile.wordpress --tag pallospace:latest```
```docker build . -f docker/Dockerfile.cli --tag wpcli:latest```

### Init

```
docker run --rm --name wpcli \
    -v $PWD/wp-content:/var/www/html/wp-content \
    -v $PWD/wp-config.php:/var/www/html/wp-config.php \
    -e ADMIN_PS="admin" -e PROJECT_NAME="pallospace" -e PORT_PS="8080" \
    -e DB_NAME="pallospace" -e DB_USER="root" -e DB_PASSWORD="root" -e DB_HOST="host.docker.internal:3306" \
    wpcli:latest
```

### Run

```
docker run -d --name pallospace \
    -p 8080:80 \
    -v $PWD/wp-content:/var/www/html/wp-content \
    -v $PWD/wp-config.php:/var/www/html/wp-config.php \
    pallospace:latest
```

Now you can open your browser into `http://localhost:8080`

### Generate the correct conf

In order to generate the correct conf to the db, at start you need to go to [this page](http://127.0.0.1:8080/wp-admin/options-general.php?page=wpcfm) and clic `Pull` on the `All Bundles` line.