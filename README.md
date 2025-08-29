# Projeto Atividade 04 - Aplicação PHP com Docker

Este é o `README` para a Atividade 04, que consiste em uma aplicação web desenvolvida em PHP, utilizando um banco de dados MySQL e totalmente containerizada com Docker.

Antes de começar, você precisa ter as seguintes ferramentas instaladas na sua máquina:
* [Docker](https://www.docker.com/get-started)
* [Composer](https://getcomposer.org/download/) (Necessário para a instalação inicial de dependências)
* [Git](https://git-scm.com/downloads) (Opcional, para clonar o projeto)

## 🚀 Como Rodar o Projeto

Siga os passos abaixo para construir a imagem e executar o container da aplicação.

### 1. Clone o Repositório (se aplicável)
```bash
git clone <url-do-seu-repositorio>
cd <nome-da-pasta-do-projeto>
```

### 2. Configure as Variáveis de Ambiente
Antes de construir a imagem, você precisa configurar o arquivo `.env`.
1.  Crie um arquivo chamado `.env` na raiz do projeto.
2.  Preencha as variáveis, principalmente as do banco de dados:

    ```env
    DB_HOST=localhost
    DB_DATABASE=app_db
    DB_USERNAME=appuser
    DB_PASSWORD=sua_senha_super_segura
    ```
    **Importante:** A senha (`DB_PASSWORD`) deve ser a mesma que você definiu no arquivo `db/init.sql`.

### 3. Instale as Dependências e Crie o `composer.lock`
Este passo é crucial e só precisa ser feito na primeira vez ou quando as dependências mudarem.
```bash
composer install
```

### 4. Construa a Imagem Docker
Execute o comando abaixo na raiz do projeto (onde o `Dockerfile` está localizado) para construir a imagem da aplicação.

```bash
docker build -t app-php-mysql .
```

### 5. Execute o Container
Após o build ser concluído, suba o container com o seguinte comando. Ele irá iniciar a aplicação e o banco de dados, além de criar um volume para persistir os dados.

```bash
docker run -d --name container-php-mysql -p 8080:80 -p 3306:3306 -v dados-mysql:/var/lib/mysql app-php-mysql
```
* A flag `-d` executa o container em segundo plano.
* A flag `--name` dá um nome fácil de lembrar ao container.
* A flag `-p` mapeia as portas do container para a sua máquina.
* A flag `-v` cria e anexa um volume para salvar os dados do MySQL.

## 💻 Acessando os Serviços

Após executar o comando `docker run`, os serviços estarão disponíveis nos seguintes endereços:

* **Aplicação Web:**
    * Acesse [**http://localhost:8080**](http://localhost:8080) no seu navegador.

* **Banco de Dados (MySQL):**
    * **Host:** `localhost` (ou `127.0.0.1`)
    * **Porta:** `3306`
    * **Usuário:** `appuser` (ou o que você definiu no `.env`)
    * **Senha:** A senha que você definiu nos arquivos de configuração.
    * **Database:** `app_db` (ou o que você definiu no `.env`)

    Você pode usar uma ferramenta como DBeaver, HeidiSQL ou o MySQL Workbench para se conectar ao banco de dados e visualizar os dados.

## 🐳 Comandos Úteis do Docker

* **Listar containers em execução:**
    ```bash
    docker ps
    ```
* **Ver os logs do container em tempo real:**
    ```bash
    docker logs -f container-php-mysql
    ```
* **Parar o container:**
    ```bash
    docker stop container-php-mysql
    ```
* **Iniciar um container já existente:**
    ```bash
    docker start container-php-mysql
    ```
* **Remover o container (precisa estar parado):**
    ```bash
    docker rm container-php-mysql
    ```
* **Resetar o banco de dados (CUIDADO: apaga todos os dados):**
    ```bash
    docker stop container-php-mysql
    docker rm container-php-mysql
    docker volume rm dados-mysql
    ```
