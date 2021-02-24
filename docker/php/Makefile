.PHONY: help setup build clean

CONTAINER ?= $(shell docker-compose --project-directory=../.. ps -q php)

help:
	@cat $(firstword $(MAKEFILE_LIST))

build: \
	usr/local/etc/php-fpm.conf

usr/local/etc/php-fpm.conf: | usr/local/etc
	docker cp $(CONTAINER):/usr/local/etc/php-fpm.conf $@

usr/local/etc usr/local usr: | usr/local usr
	test -d $@ || mkdir $@

clean:
	rm -rf usr/local/etc/php-fpm.conf
