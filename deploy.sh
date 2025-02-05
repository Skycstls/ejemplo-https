#!/bin/bash

# Actualizar los paquetes
apt update

# Instalar dependencias necesarias
apt install npm nodejs certbot python3-certbot-nginx -y

# Instalar dependencias del proyecto
npm install

# Generar certificados SSL usando Certbot
certbot certonly --standalone -d cyberbunny.online --non-interactive --agree-tos -m tu-email@dominio.com

# Copiar los certificados generados a la ubicación esperada por tu aplicación
cp /etc/letsencrypt/live/cyberbunny.online/fullchain.pem ./cert.pem
cp /etc/letsencrypt/live/cyberbunny.online/privkey.pem ./key.pem