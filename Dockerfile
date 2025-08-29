FROM ubuntu:22.04

WORKDIR /var/www/html

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Sao_Paulo

RUN apt-get update && apt-get install -y \
    apache2 \
    php \
    libapache2-mod-php \
    php-mysql \
    mysql-server \
    curl \
    unzip \
    git \
    tzdata \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


COPY composer.json composer.lock ./

RUN composer install --no-interaction --optimize-autoloader

COPY app/ .

RUN rm /var/www/html/index.html

COPY db/init.sql /docker-entrypoint-initdb.d/

COPY .env .

RUN a2enmod php*

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 80 3306
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]