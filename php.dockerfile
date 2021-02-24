FROM php:8.0.2-fpm

COPY ./docker/php/usr/local/etc/php-fpm.conf /usr/local/etc/php-fpm.conf
COPY ./docker/php/usr/local/etc/php-fpm.d/www.conf /usr/local/etc/php-fpm.d/www.conf

