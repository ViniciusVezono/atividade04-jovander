#!/bin/bash
set -e

# Carrega variáveis do .env
if [ -f /var/www/.env ]; then
    export $(grep -v '^#' /var/www/.env | xargs)
fi

# Inicia MySQL em background
service mysql start

# Cria banco e usuário se não existir
mysql -uroot <<-EOSQL
    CREATE DATABASE IF NOT EXISTS ${DB_DATABASE};
    CREATE USER IF NOT EXISTS '${DB_USERNAME}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
    GRANT ALL PRIVILEGES ON ${DB_DATABASE}.* TO '${DB_USERNAME}'@'%';
    FLUSH PRIVILEGES;
EOSQL

# Executa script inicial se existir
if [ -f /docker-entrypoint-initdb.d/init.sql ]; then
    mysql -u${DB_USERNAME} -p${DB_PASSWORD} ${DB_DATABASE} < /docker-entrypoint-initdb.d/init.sql
fi

# Inicia Apache em foreground
apachectl -D FOREGROUND
