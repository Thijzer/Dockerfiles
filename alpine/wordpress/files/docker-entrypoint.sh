#!/bin/sh

set -e

chown -R nginx:nginx /DATA

mkdir -p /DATA/htdocs

# start php-fpm
mkdir -p /DATA/logs/php-fpm
# start nginx
mkdir -p /DATA/logs/nginx
mkdir -p /tmp/nginx
chown nginx:nginx /tmp/nginx
chown -R nginx:nginx /DATA

if [ ! -d /DATA/bin ] ; then
  mkdir /DATA/bin
  chown nginx:nginx /DATA/bin
  cp /usr/bin/wp-cli /DATA/bin/wp-cli

  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar 
  mv wp-cli.phar /DATA/bin/wp-cli 
fi

php-fpm7
nginx
