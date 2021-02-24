FROM nginx:1.19.7

COPY ./docker/nginx/etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./docker/nginx/etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY ./docker/nginx/etc/nginx/conf.d/service.conf /etc/nginx/conf.d/service.conf

RUN ln -s /dev/stdout /var/log/nginx/service.access.log && \
    ln -s /dev/stderr /var/log/nginx/service.error.log
