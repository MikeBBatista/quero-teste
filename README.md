# # <center> Teste para Engenheiro de dados </center> :envelope:

## O repositório foi criado com intuito de demonstrar meus conhecimentos quanto a um teste aplicado pela Quero Educação.

### Candidato :computer:

* [Mike Barcelos](https://www.linkedin.com/in/mike-barcelos-b4648016a/)

### Do que se trata?

O desafio era recolher os dados fornecidos por uma API, trata-los e alimentar uma base de dados com eles. Assim como gerar índices para as colunas mais importantes da tabela afim de melhorar a performace de buscas da base de dados.

### Ferramentas :wrench:

Para desenvolver o script foi utilizado:

- PYTHON 2.8.1 :coffee:
- POSTGRESQL 12

### Pré Requisitos :cd:

Para utilizar o script é necessário as seguintes bibliotecas:
- Pandas 1.2.0
- Requests 2.25.1
- SQLAlchemy 1.3.22
- Dotenv 0.15.0

### TUTORIAL :rainbow:

Para que o script rode sem maiores problemas, é necessário criar uma base de dados utilizando do script sql contido no repositório (lembrando que é necessário utilizar do POSTGRESQL 12). Após configurar o banco é necessário criar um arquivo .env e preencher uma variável chamada "DB_CRED", utilizando das credenciais do seu banco de dados como no exemplo:
     		```DB_CRED = 'postgresql://OWNER:PASSWORD@localhost:5432/DATABASE' ```
 
 Com o banco de dados e o ambiente configurado com as bibliotecas necessárias, é necessário apenas rodar o script para puxar os dados públicos fornecidos pela API e inseri-los na tabela em seu banco de dados!
