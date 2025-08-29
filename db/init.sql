
CREATE DATABASE IF NOT EXISTS app_db;


CREATE USER IF NOT EXISTS 'appuser'@'%' IDENTIFIED BY 'password';


GRANT ALL PRIVILEGES ON app_db.* TO 'appuser'@'%';

FLUSH PRIVILEGES;

USE app_db;

CREATE TABLE IF NOT EXISTS Clientes (
    Id_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Endereco VARCHAR(255),
    Cidade VARCHAR(100),
    Telefone VARCHAR(20)
);


INSERT INTO Clientes (Nome, Endereco, Cidade, Telefone) VALUES
('Joao Silva', 'Rua das Flores, 123', 'Sao Paulo', '(11) 98765-4321'),
('Maria Oliveira', 'Avenida Paulista, 500', 'Sao Paulo', '(11) 99654-3210'),
('Carlos Pereira', 'Rua XV de Novembro, 250', 'Campinas', '(19) 98876-5432'),
('Ana Santos', 'Rua do Comercio, 1020', 'Rio de Janeiro', '(21) 98888-8888'),
('Paula Costa', 'Rua dos Pescadores, 50', 'Niteroi', '(21) 97453-2110'),
('Lucas Almeida', 'Avenida Brasil, 4000', 'Rio de Janeiro', '(21) 99999-1000'),
('Renato Souza', 'Rua do Sol, 800', 'Belo Horizonte', '(31) 98123-4567'),
('Fernanda Lima', 'Praca Sete, 1200', 'Belo Horizonte', '(31) 99764-8998'),
('Ricardo Costa', 'Rua Barata Ribeiro, 400', 'Rio de Janeiro', '(21) 96321-4321'),
('Mariana Dias', 'Rua das Palmeiras, 85', 'Porto Alegre', '(51) 98765-0102'),
('Felipe Rocha', 'Avenida dos Bandeirantes, 3050', 'Sao Paulo', '(11) 99230-1122'),
('Tatiane Souza', 'Rua Coronel Xavier, 1000', 'Recife', '(81) 98123-7654'),
('Bruna Oliveira', 'Rua das Pedras, 500', 'Florianopolis', '(48) 98876-5544'),
('Eduardo Martins', 'Rua Sao Joao, 230', 'Curitiba', '(41) 99988-7766'),
('Gustavo Gomes', 'Avenida Rio Branco, 800', 'Fortaleza', '(85) 98855-3322'),
('Juliana Pires', 'Rua Dona Mariana, 430', 'Salvador', '(71) 99977-1000'),
('Rafael Pereira', 'Rua Tiradentes, 980', 'Manaus', '(92) 98123-4422'),
('Gabriela Almeida', 'Rua dos Tres Coracoes, 110', 'Belo Horizonte', '(31) 99234-5678'),
('Jose Barbosa', 'Rua Sao Vicente, 300', 'Sao Luis', '(98) 98765-4321'),
('Paulo Henrique', 'Rua da Consolacao, 1200', 'Sao Paulo', '(11) 98822-3344'),
('Simone Costa', 'Rua do Bom Jesus, 420', 'Natal', '(84) 99999-8888'),
('Renata Gomes', 'Rua do Rio, 600', 'Vitoria', '(27) 98354-6789'),
('Claudio Souza', 'Rua da Paz, 450', 'Aracaju', '(79) 98234-5678'),
('Luciana Martins', 'Avenida Santa Cruz, 230', 'Campo Grande', '(67) 99123-1111'),
('Fabio Oliveira', 'Rua da Liberdade, 80', 'Sao Paulo', '(11) 96432-2200'),
('Eliane Rocha', 'Rua de Cima, 150', 'Joao Pessoa', '(83) 98765-5432'),
('Andre Costa', 'Avenida Amazonas, 2400', 'Belo Horizonte', '(31) 99230-1456'),
('Marcelo Dias', 'Rua Principal, 100', 'Campinas', '(19) 99876-1234'),
('Tatiane Lima', 'Rua Verde, 500', 'Recife', '(81) 96321-9087'),
('Luana Pereira', 'Rua dos Alecrins, 1200', 'Porto Alegre', '(51) 99987-6543'),
('Mauricio Barbosa', 'Rua Floriano Peixoto, 850', 'Brasilia', '(61) 99777-1100');