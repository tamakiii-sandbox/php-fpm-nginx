.PHONY: help setup build clean

CONTAINER ?= $(shell docker-compose --project-directory=../.. ps -q nginx)

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup:

build: \
	etc/nginx/nginx.conf \
	etc/nginx/conf.d/default.conf

etc/nginx/nginx.conf etc/nginx/conf.d/default.conf: | etc/nginx etc/nginx/conf.d
	docker cp $(CONTAINER):$@ $@

etc/nginx/conf.d etc/nginx etc: | etc etc/nginx
	test -d $@ || mkdir $@

clean:
	rm -rf etc/nginx/conf.d/default.conf
	rm -rf etc/nginx/conf.d/nginx.conf
