PORT = 3000

readline = require 'readline'
rl = readline.createInterface process.stdin, process.stdout
io = require 'socket.io-client'
colour = require('ansi-color').set

#Set up
PROMPT = 'MSG > '
rl.setPrompt PROMPT, PROMPT.length
socket = io "http://localhost:#{PORT}"

socket.on 'message', (msg) ->
  if msg.type == 'chat' && msg.user != username
    leader = colour "<#{msg.user}>" , 'green'
    console_out "#{leader} #{msg.message}"
  else if msg.type == 'notice'
    console_out colour(msg.message, 'cyan')


#Pergunta o nome do usuário
username = null
rl.question 'Nome de usuário: ', (answer) ->
  if answer.trim() != ''
    username = answer
    msg = "#{username} entrou no chat!"
    socket.emit 'send', {type: 'notice', message: msg}
    rl.prompt true

rl.prompt()

rl
.on 'line', (msg) ->
  socket.emit 'send', {type: 'chat', message: msg, user: username}
  rl.prompt true

.on 'close', () ->
  console_out 'Saindo do chat...'
  socket.emit 'send', {type: 'exit', user: username}
  rl.prompt false
  process.exit 0

console_out = (msg) ->
  process.stdout.clearLine();
  process.stdout.cursorTo(0);
  console.log msg;
  rl.prompt true