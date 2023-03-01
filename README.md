# PalloSpace
Here is a PalloSpace

## Install locally
To run this docker you need to have a database running. And to create a base named `pallospace`.

The connexion config are to be filled in the [wp-config file](wp-config.php).

### Build

```docker build . -f docker/Dockefile --tag pallospace:latest```

### Run

```
docker run -d --name pallospace \
    -p 8080:80 \
    -v $PWD/wp-content:/var/www/html/wp-content \
    -v $PWD/wp-config.php:/var/www/html/wp-config.php \
    pallospace:latest
```

Now you can open your browser into `http://localhost:8080`