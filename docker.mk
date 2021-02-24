.PHONY: help setup dependencies clean

PORT_NGINX_HTTP := 80

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup: \
	dependencies \
	.env

dependencies:
	type docker-compose

.env:
	echo "PORT_NGINX_HTTP=$(PORT_NGINX_HTTP)" > $@

clean:
	rm -rf .env
