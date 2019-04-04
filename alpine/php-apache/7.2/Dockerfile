FROM thijs/php:alpine-php-7.2

RUN \
 echo "**** install runtime packages ****" && \
 apk add --no-cache --upgrade \
    php-apache2 && \
    rm -rf /tmp/* && \
echo "**** configure apache ****" && \
    sed -i \
    -e 's#^DocumentRoot ".*#DocumentRoot "/app"#g' \
    -e 's#AllowOverride none#AllowOverride All#' \
    /etc/apache2/httpd.conf

EXPOSE 80

COPY httpd-foreground /usr/local/bin/

# VOLUME /app
WORKDIR /app

CMD ["httpd-foreground"]
