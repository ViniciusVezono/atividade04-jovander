FROM ubuntu:22.04

# Atualiza pacotes e instala dependências
RUN apt-get update && apt-get install -y \
    apache2 \
    php \
    libapache2-mod-php \
    php-mysql \
    mysql-server \
    nano \
    unzip \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copia aplicação PHP
COPY app/ /var/www/html/

# Copia script SQL
COPY db/init.sql /docker-entrypoint-initdb.d/

# Copia .env para dentro do container
COPY .env /var/www/.env

# Habilita PHP no Apache
RUN a2enmod php* && service apache2 restart

# Copia script de inicialização
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Expor portas Apache e MySQL
EXPOSE 80 3306

# Ponto de entrada
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
