# API-Linguagens
Criado para o projeto do Instituto Mauá de Tecnologia para a materia ecm251-lab3

Integrantes: 
- André Monteiro Sanches Garcia - 19.01230-6
- Arthur Castanheda Sarnadas - 19.00756-6
- Giovanni Brandini Blanco Benuthe - 19.00043-0

## Database

![banco de dados](https://user-images.githubusercontent.com/71029970/142736009-f56926a6-0ee9-499c-be15-4d02d9ee7a68.jpg)

Nome do arquivo: aplicacao.db
Conectado com: SQlite
Tipo de conexão: Local
Tabelas: Games, Users, Reviews
- Colunas de Games: id(PK), name, desc, image 
- Colunas de Users: id(PK), name, email
- Colunas de Reviews: id(PK), id_name(FK), id_game(FK), comment, rating

## Back-End

###### DAO
Todos os métodos da GenericDAO foram aplicados a cada DAO das tabelas, de modo a executar todas as solicitações SQL necessárias para as operações no banco.

###### Models
Implementar as classes de dados para cada tabela, tornando-os serializáveis.

###### Plugins
O Routing é a classe kotlin que configura as rotas do site, configurando as solicitações GET e POST.

_**Quanto às solicitações GET, elas conectam ao banco e fazem as requisições através do front e back, porém a tabela "Reviews", por trabalhar com chaves estrangeiras, não fomos capazes de fazer sua visualização fosse correta no front, mais especificamente do id_name e id_game, que vêm de outras tabelas.**_

**_Já as solicitações POST foram testadas, porém pareciam não conseguir fazer a inserção no banco, logo resolvemos manter somente "postGame". O grupo discutiu o possível problema, chegando à uma conclusão que o "currentGame", presente no front-end, apesar de ser sido transformado em JSON, Mapa ou objeto, ao ser passado para a solicitação POST do back-end no routing de "/Jogos" não foi reconhecido (dois exemplos foram "500 internal server error" e "ClassCastException" pedindo um obj. Companion). Imaginamos que estaríamos passando um tipo errado para a função em sua transferência._**

###### Main
Estabelece a conexão com o servidor e instala o json() para a serialização.

## Front-End

Dividimos em 6 telas, com 2 designs principais.
###### Inserção de dados
4 das 6 telas presentes eram responsáveis por isso (conta nova, review nova, login de acesso, jogo novo).
Adquirimos as informações através de diversos TextEditingController(), estes controladores podem ser visualizados no form.dart.

![site em execução para inserção de dados](https://user-images.githubusercontent.com/71029970/142736060-e9cdfc6c-48be-4062-8ed2-f46481be9ff7.jpg)


###### Visualização de Dados

Criamos uma tela para a visualização dos jogos presentes e outra para os reviews feitos.
Ambos foram feitas a partir de um ListView.builder(). 

**_Quando os dados estavam conectados somente ao front-end, estavam funcionando corretamente. Porém, quando fomos realizar a conexão HTTP, não conseguimos adicionar os dados 
inseridos no banco, apenas visualizá-los. Por este motivo foi necessário colocar os dados a partir do back-end para sua execução._**


![site em execução para visualização de dados](https://user-images.githubusercontent.com/71029970/142736079-625dd96c-685a-46aa-a9af-dea2628630de.jpg)

## Execução na máquina própria

1. Abrir o banco de dados a partir de uma conexão SQLite, e mudar o jdbc de conexão (url do banco) na classe "SharedPath.kt" presente no projeto "Back-end";
2. Colocar a "main.kt" do projeto "Back-end" para rodar, ativando a base de dados;
3. Rodar a "main.dart" do projeto "Front-end", colocando o seguinte código no terminal: "flutter run -d chrome --web-renderer html";
4. Desta forma, o site será aberto no Chrome.

## Considerações finais

  O grupo como um todo aprendeu muito com o projeto, um desafio que nos fez buscar novos conhecimentos através de diferentes métodos (desde como funciona uma Rest API até como 
realizar uma UI). Apesar de termos encontrado dificuldades que nos fizeram não finalizar o projeto como queríamos, estamos muito orgulhosos dos resultados que obtivemos.
  Nossas grandes dificuldades se concentraram em realizar a conexão HTTP para inserção de dados no banco, mostrando que a junção das partes do Back-end, Front-end e Banco de 
dados foi o principal obstáculo para a conclusão do projeto.
