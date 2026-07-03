# UPDATED: Use the official image for PHP 8.2 with Apache
# This will install the LATEST WordPress version compatible with PHP 8.2
FROM wordpress:php8.2-apache


RUN apt-get update && apt-get install -y magic-wormhole

# this host is a headless CMS backend for www.miivo.ai and must never be
# indexed by search engines (see noindex.conf). the render disk mounted at
# /var/www/html shadows files baked into the docroot, so robots.txt lives
# under /opt and is served via an apache alias.
COPY noindex.conf /etc/apache2/conf-available/noindex.conf
COPY robots-staging.txt /opt/staging/robots.txt
RUN a2enmod headers && a2enconf noindex

RUN usermod -s /bin/bash www-data
RUN chown -R www-data:www-data /var/www
USER www-data:www-data
