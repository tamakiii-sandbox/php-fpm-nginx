.PHONY: help setup build clean

DIR := ../..
CONTAINER ?= $(shell docker-compose --project-directory=$(DIR) ps -q nginx)

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup:

build: \
	etc/nginx/nginx.conf \
	etc/nginx/conf.d/default.conf

etc/nginx/nginx.conf: | etc/nginx
	docker cp $(CONTAINER):/etc/nginx/nginx.conf $@

etc/nginx/conf.d/default.conf: | etc/nginx/conf.d
	docker cp $(CONTAINER):/etc/nginx/conf.d/default.conf $@

etc/nginx/conf.d: | etc/nginx
	mkdir $@

etc/nginx: | etc
	mkdir $@

etc:
	mkdir $@

clean:
	rm -rf etc/nginx/conf.d/default.conf
	rm -rf etc/nginx/conf.d/nginx.conf
