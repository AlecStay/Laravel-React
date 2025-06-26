FROM node:18

# Establece el directorio de trabajo (donde se montará el código React)
WORKDIR /app

# No copiamos package.json aquí si estás empezando "desde cero"
# La instalación de dependencias se hará en postCreateCommand

# Exponer el puerto (aunque docker-compose también lo gestiona)
EXPOSE 3000

# Comando por defecto para mantener el contenedor ejecutándose
CMD ["tail", "-f", "/dev/null"]