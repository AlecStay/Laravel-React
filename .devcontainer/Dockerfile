# Laravel-React-DvEnvironment/.devcontainer/Dockerfile

FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libxml2-dev \
    libxslt1-dev \
    libicu-dev \
    libonig-dev \
    libpq-dev \
    zlib1g-dev \
    git \
    unzip \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install \
    gd \
    pdo_pgsql \
    mbstring \
    bcmath \
    exif \
    pcntl \
    zip \
    intl \
    xml

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
ARG UID=1000
ARG GID=1000
RUN groupadd -g ${GID} appuser && \
    useradd -u ${UID} -g appuser -m appuser
USER appuser
RUN mkdir -p /var/www
WORKDIR /var/www
COPY laravel/composer.json laravel/composer.lock ./
RUN composer install --no-dev --optimize-autoloader --no-scripts
COPY laravel/. /var/www
RUN chmod -R 777 storage bootstrap/cache
EXPOSE 8000
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]