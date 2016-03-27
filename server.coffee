PORT = 3000

io = require('socket.io')(PORT)
users = []

io.on 'connect', (socket) ->
  console.log 'Usuário conectado'

  socket.on 'send', (msg) ->
    if msg.type == 'user'
      if users indexOf msg.username < 0
        users.push msg.username
    if msg.type == 'exit'
      users.splice(users.indexOf(msg.username) ,1)

    io.emit 'message', msg

  socket.on 'disconnect', () ->
    console.log 'Usuário desconectado'

console.log "Escutando na porta #{PORT}..."