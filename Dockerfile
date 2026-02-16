# UPDATED: Use the official image for PHP 8.2 with Apache
# This will install the LATEST WordPress version compatible with PHP 8.2
FROM wordpress:php8.2-apache


RUN apt-get update && apt-get install -y magic-wormhole

RUN usermod -s /bin/bash www-data
RUN chown -R www-data:www-data /var/www
USER www-data:www-data
