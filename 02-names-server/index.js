
const express = require('express');
const path = require('path');
require('dotenv').config();

//App de express
const app = express();

//Node Server 
const server = require('http').createServer(app);
module.exports.io = require('socket.io')(server);

require('./socket/sockets');


// Path publico
const publicPath = path.resolve(__dirname, 'public');

app.use( express.static( publicPath) )

server.listen(3000, (err) => {
    
    if (err) throw new Error(err);

    console.log('Servidor correndo na porta', process.env.PORT );

});