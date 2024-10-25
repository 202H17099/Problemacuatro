# 1. Usar una imagen base oficial de Node.js
FROM node
 
# 2. Cambia la ruta de trabajo para el contenedor que sera asignado gracias al comando wordir 
WORKDIR /usr/src/app
 
# 3. Crea una copa de la ruta local hacia el directorio asignado que seria "/usr/src/app"
COPY package*.json ./
 
# 4. Este comando ejecuta nmp dentro del contenedor, instalado todo en especifico en el archivo anterior mencionado
RUN npm install
 
# 5. Instalamos mysql en el contenedor
RUN apk add --no-cache mysql-client
 
# 6. Intala el servidor MYSQL dentro del contenedor esto es para ejecutar un servidor local
RUN apk add --no-cache mysql mysql-server
 
# 7. creamos una ruta para almacenar los datos del servidor mysql
RUN mkdir -p /var/lib/mysql
 
# 8. Crea una copia de todo el contenido del directorio donde se encuentra el dockerfile y a la ruta trabajada asgnida que es "/usr/src/app"
COPY . .
 
# 9. Configuramos los puerto para el uso para eso estan estos puertos
EXPOSE 3000 3306
 
# 10. Iniciamos el servicio en el contenedor usamos node y Mysql, gracias a este comando se ejecutara cuando inicies el contenedor
CMD [ "npm", "start" ]