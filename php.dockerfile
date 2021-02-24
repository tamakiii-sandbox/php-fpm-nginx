FROM php:8.0.2-fpm

COPY ./docker/php/usr/local/etc/php-fpm.conf /usr/local/etc/php-fpm.conf
COPY ./docker/php/usr/local/etc/php-fpm.d/www.conf /usr/local/etc/php-fpm.d/www.conf
COPY ./docker/php/usr/local/etc/php-fpm.d/docker.conf /usr/local/etc/php-fpm.d/docker.conf
COPY ./docker/php/usr/local/etc/php-fpm.d/www.conf.default /usr/local/etc/php-fpm.d/www.conf.default
COPY ./docker/php/usr/local/etc/php-fpm.d/zz-docker.conf /usr/local/etc/php-fpm.d/zz-docker.conf

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        coreutils \
        procps \
        less \
        && \
    apt-get clean
