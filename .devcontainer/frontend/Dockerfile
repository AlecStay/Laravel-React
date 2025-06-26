# .devcontainer/frontend/Dockerfile
FROM node:18

WORKDIR /app

# PASO 1: Copia solo los archivos de dependencias primero.
# Esto es para aprovechar el caché de Docker. Si solo cambian los archivos de código,
# y no package.json/package-lock.json, Docker no reinstalará las dependencias.
COPY package*.json ./

# PASO 2: Instala las dependencias.
# Ahora que package.json está en /app, npm install funcionará.
RUN npm install

# PASO 3: Copia el resto de los archivos de la aplicación (código fuente).
COPY . .

EXPOSE 3000

# PASO 4: Define el comando de inicio de la aplicación.
# Usa "/bin/sh -c" para mayor compatibilidad con la resolución del PATH de 'npm'.
CMD ["/bin/sh", "-c", "npm start"]  