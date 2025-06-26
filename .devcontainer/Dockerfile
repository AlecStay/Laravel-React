FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    libzip-dev libpng-dev libjpeg-dev libfreetype6-dev libxml2-dev libicu-dev \
    unzip git curl zlib1g-dev libpq-dev && \
    docker-php-ext-install pdo pdo_pgsql zip intl mbstring && \
    a2enmod rewrite

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

ARG UID=1000
ARG GID=1000
RUN groupadd -g ${GID} appuser && useradd -u ${UID} -g appuser -m appuser
USER appuser

WORKDIR /var/www
COPY laravel/composer.json laravel/composer.lock ./
RUN composer install --no-scripts --no-dev || true
COPY laravel/. /var/www
RUN chmod -R 777 storage bootstrap/cache

EXPOSE 8000
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
