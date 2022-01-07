const { io } = require('../index')

// Mensagens de sockets 
io.on('connection', client => {
    console.log('Cliente conectado');

    client.on('disconnect', () => {
        console.log('Cliente Desconectado')
    });

    client.on('mensagem', (payload) => {
        console.log('Mensagem', payload)
        io.emit('mensagem', { admin: 'Novo Admin' })
    });

    client.on('emitir-mensagem', (payload) => {
        console.log(payload);
        // io.emit('nova-mensagem', payload)
    })

})