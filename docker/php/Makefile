.PHONY: help setup build clean

CONTAINER ?= $(shell docker-compose --project-directory=../.. ps -q php)

help:
	@cat $(firstword $(MAKEFILE_LIST))

build: \
	usr/local/etc/php-fpm.conf \
	etc/php-fpm-7.3.conf \
	etc/php-fpm-7.3.d/www.conf \
	etc/php-fpm-7.3.d/php-fpm.conf

etc/php-fpm-7.3.conf: | etc
	docker cp $(CONTAINER):$@ $@

etc/php-fpm-7.3.d/www.conf: | etc/php-fpm-7.3.d
	docker cp $(CONTAINER):$@ $@

etc/php-fpm-7.3.d/php-fpm.conf: | etc/php-fpm-7.3.d
	docker cp $(CONTAINER):$@ $@

etc/php-fpm.conf: | etc
	docker cp $(CONTAINER):$@ $@

etc/php-fpm-7.3.d: | etc
	test -d $@ || mkdir $@

usr/local/etc: | usr/local
	test -d $@ || mkdir $@

usr/local: | usr
	test -d $@ || mkdir $@

usr: | usr
	test -d $@ || mkdir $@

etc/php-fpm.d: | etc
	test -d $@ || mkdir $@

etc:
	test -d $@ || mkdir $@

clean:
	rm -rf usr/local/etc/php-fpm.conf
