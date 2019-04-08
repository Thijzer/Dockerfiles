FROM php:7-alpine3.8

RUN apk --no-cache add --virtual unzip

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer 

RUN curl --silent --fail --location --retry 3 --output /tmp/master.zip --url https://github.com/thijzer/sauron/archive/master.zip \
    && mkdir -p /app \
    && unzip /tmp/master.zip -d /app/ \
    && cd /app/sauron-master && ./run/install.sh \
    && rm -f /tmp/master.zip

VOLUME /project

WORKDIR /app/sauron-master
