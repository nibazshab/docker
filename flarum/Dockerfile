FROM alpine

RUN apk add --no-cache \
    nginx \
    php \
    php-fpm \
    php-curl \
    php-dom \
    php-fileinfo \
    php-gd \
    php-json \
    php-mbstring \
    php-openssl \
    php-pdo_mysql \
    php-tokenizer \
    php-zip \
    php-opcache \
    php-session \
    s6 \
    su-exec \
    composer

COPY rootfs /

RUN chmod +x /init /init.d/*/run /init.d/*/finish

VOLUME ["/flarum", "/start.d"]

ENTRYPOINT ["/init"]
