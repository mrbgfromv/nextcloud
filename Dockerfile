FROM php:7.2-apache

# Download packets for compiling
RUN apt-get update && apt-get install -y libz-dev zlib1g-dev libpng-dev

# Install modules
# zib
RUN docker-php-ext-install -j$(nproc) zlib
# gd
RUN docker-php-ext-install -j$(nproc) gd
# Mysql
RUN docker-php-ext-install -j$(nproc) pdo_mysql

# Info:
# apache user / group: 33/33

EXPOSE 80
CMD ["apache2-foreground"]
