# php-fpm-nginx

## How to use
```sh
make -f docker.mk setup
docker-compose build
docker-compose up
```

## Usages
```sh
make -f docker.mk -B .env PORT_NGINX_HTTP=8080
```
