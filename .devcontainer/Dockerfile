FROM php:8.2-apache

# Instala dependencias del sistema y extensiones de PHP
RUN apt-get update && apt-get install -y \
    libzip-dev libpng-dev libjpeg-dev libfreetype6-dev libxml2-dev libicu-dev \
    unzip git curl zlib1g-dev libpq-dev \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install pdo pdo_pgsql zip intl mbstring \
    && a2enmod rewrite

# Instala Composer globalmente
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Crea un usuario no-root para mayor seguridad
ARG UID=1000
ARG GID=1000
RUN groupadd -g ${GID} appuser && useradd -u ${UID} -g appuser -m appuser

# Establece el directorio de trabajo (donde se montará el código Laravel)
WORKDIR /var/www

# Cambia al usuario no-root
USER appuser