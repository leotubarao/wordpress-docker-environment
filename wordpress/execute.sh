#!/bin/bash
set -e

echo "Ajustando permissões da pasta wp-content..."

chown -R www-data:www-data /var/www/

mkdir -p /var/www/html/wp-content

chmod -R 777 /var/www/html/wp-content
chown -R www-data:www-data /var/www/html/wp-content

# Executa o comando original do container (Apache do WordPress)
exec apache2-foreground
