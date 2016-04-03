# nodejs-chat

Um Chat com client e server em NodeJS

# Para rodar 

Abra um terminal, navegue até a pasta do código e rode:

`nodejs server.js

Você deverá obter a mensagem "Escutando na porta 3000..."

Agora é só conectar-se com os clients nesse servidor. Para abrir um client rode

`nodejs client.js

E digite o nome de usuário.

# Para compilar
O código foi escrito em CoffeeScript (server.coffee e client.coffee). Para compilá-los em JavaScript, deve-se primeiro instalar o compilador.

`npm install coffee-script

ou 

`apt-get install coffeescript

E então, para compilar:
`coffee -c file.coffee

Isso gerará um arquivo file.js em JavaScript, pronto para ser executado pelo NodeJS
