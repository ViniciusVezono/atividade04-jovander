#!/bin/bash

set -e

echo "Iniciando o serviço do MySQL..."
service mysql start

sleep 5

echo "Executando script de configuração completa do banco de dados..."
mysql -u root < /docker-entrypoint-initdb.d/init.sql
echo "Banco de dados configurado e populado com sucesso."

echo "Iniciando o Apache2..."
apachectl -D FOREGROUND