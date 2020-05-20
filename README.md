Docker basic instructions
===========

Building
=====
```
cd to Dockerfile
docker build -t thijs/<php:alpine-php-7.3> . 

docker login
docker push thijs/<php:alpine-php-7.3>
```

For PHP Alphine
===
use https://pkgs.alpinelinux.org/package/v3.10/community/x86/php7 the check the sub packages
else use pecl install