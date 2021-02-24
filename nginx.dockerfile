FROM nginx:1.19.7

COPY ./docker/nginx/etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./docker/nginx/etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY ./docker/nginx/etc/nginx/conf.d/service.conf /etc/nginx/conf.d/service.conf
COPY ./docker/nginx/etc/nginx/conf.d/service_ssl.conf /etc/nginx/conf.d/service_ssl.conf

RUN ln -s /dev/stdout /var/log/nginx/service.access.log && \
    ln -s /dev/stderr /var/log/nginx/service.error.log && \
    ln -s /dev/stdout /var/log/nginx/service_ssl.access.log && \
    ln -s /dev/stderr /var/log/nginx/service_ssl.error.log

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        coreutils \
        procps \
        less \
        && \
    apt-get clean

# --

FROM amazonlinux:2018.03.0.20180827

RUN yum update -y

RUN yum install -y nginx

RUN yum install -y make less which

RUN rm -rf /var/cache/yum/* && \
    yum clean all

RUN ln -s /dev/stdout /var/log/nginx/access.log && \
    ln -s /dev/stderr /var/log/nginx/error.log && \
    ln -s /dev/stdout /var/log/nginx/service.access.log && \
    ln -s /dev/stderr /var/log/nginx/service.error.log && \
    ln -s /dev/stdout /var/log/nginx/service_ssl.access.log && \
    ln -s /dev/stderr /var/log/nginx/service_ssl.error.log

COPY ./docker/nginx/etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./docker/nginx/etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY ./docker/nginx/etc/nginx/conf.d/service.conf /etc/nginx/conf.d/service.conf
COPY ./docker/nginx/etc/nginx/conf.d/service_ssl.conf /etc/nginx/conf.d/service_ssl.conf

CMD ["nginx", "-g", "daemon off;"]
