# Usamos una imagen ligera de servidor web (Nginx)
FROM nginx:alpine

# Copiamos todo el contenido de tu carpeta local a la carpeta del servidor
COPY . /usr/share/nginx/html

# Exponemos el puerto 80
EXPOSE 80