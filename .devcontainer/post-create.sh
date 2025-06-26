#!/bin/bash

echo "Running post-create commands..."

# Navega al directorio de la aplicación Laravel dentro del contenedor 'app'
echo "Installing Laravel dependencies..."
if [ -d "/var/www" ]; then
    cd /var/www
    if [ -f "composer.json" ]; then
        composer install --no-interaction --prefer-dist --optimize-autoloader
    else
        echo "composer.json not found in /var/www. Skipping composer install."
        echo "If you are starting a new Laravel project, you might need to run 'composer create-project laravel/laravel .' here."
    fi
else
    echo "/var/www directory not found. Skipping Laravel dependency installation."
fi

# Instala las dependencias de la aplicación React
echo "Installing React app dependencies..."
# Para ejecutar comandos en otro servicio de docker-compose, usamos 'docker compose exec'
docker compose exec react-app sh -c "
    if [ -d \"/app\" ]; then
        cd /app
        if [ -f \"package.json\" ]; then
            npm install
        else
            echo 'package.json not found in /app. Skipping npm install.'
            echo 'If you are starting a new React project, you might need to run 'npx create-react-app .' or similar here.'
        fi
    else
        echo '/app directory not found. Skipping React app dependency installation.'
    fi
"

echo "Post-create commands finished."