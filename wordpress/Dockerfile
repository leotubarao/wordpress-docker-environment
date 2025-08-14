FROM wordpress:latest

RUN apt-get update && apt-get install -y openssl
RUN a2enmod ssl rewrite
RUN mkdir -p /etc/apache2/ssl
RUN openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout /etc/apache2/ssl/apache.key \
  -out /etc/apache2/ssl/apache.crt \
  -subj "/C=BR/ST=SP/L=Campinas/O=Dev/CN=localhost"

COPY ./apache-ssl.conf /etc/apache2/sites-available/000-default.conf
COPY ./execute.sh /usr/local/bin/execute.sh

RUN chmod +x /usr/local/bin/execute.sh

CMD ["execute.sh"]

EXPOSE 80 443