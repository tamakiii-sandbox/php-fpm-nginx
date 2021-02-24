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

RUN rm -rf /usr/local/etc/php-fpm.d/www.conf.default /usr/local/etc/php-fpm.d/zz-docker.conf

CMD ["php-fpm", "--nodaemonize"]

# ---

FROM amazonlinux:2018.03.0.20180827

RUN yum update -y

RUN yum install -y \
        php73 \
        php73-common \
        php73-cli \
        php73-fpm \

RUN yum install -y \
        make \
        less \
        which

RUN rm -rf /var/cache/yum/* && \
    yum clean all

RUN groupadd nginx && \
    useradd -g nginx nginx

COPY ./docker/php/usr/local/etc/php-fpm.conf /etc/php-fpm.conf
COPY ./docker/php/usr/local/etc/php-fpm.d/www.conf /etc/php-fpm.d/www.conf
COPY ./docker/php/etc/php-fpm-7.3.conf /etc/php-fpm-7.3.conf
COPY ./docker/php/etc/php-fpm-7.3.d/php-fpm.conf /etc/php-fpm-7.3.d/php-fpm.conf
COPY ./docker/php/etc/php-fpm-7.3.d/www.conf /etc/php-fpm-7.3.d/www.conf

CMD ["php-fpm", "--nodaemonize"]
