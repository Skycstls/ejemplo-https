const express = require('express');
const https = require('https');
const fs = require('fs');
const path = require('path');

const app = express();
const port = 3000;

// Configuración de las opciones HTTPS
const options = {
    key: fs.readFileSync(path.join(__dirname, 'privkey.pem')),
    cert: fs.readFileSync(path.join(__dirname, 'fullchain.pem'))
};

// Ruta principal
app.get('/', (req, res) => {
    res.send('Hola Mundo');
});

// Crear servidor HTTPS
https.createServer(options, app).listen(port, () => {
    console.log(`Servidor HTTPS escuchando en https://cyberbunny.online:${port}`);
});
