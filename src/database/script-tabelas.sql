-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/


CREATE DATABASE projetoPessoal;

USE projetoPessoal;

GRANT ALL PRIVILEGES ON projetopessoal.* TO 'usuario'@'%';
FLUSH PRIVILEGES;

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50)
);

CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
);


insert into usuario (nome, email,senha) values ('Giulia', 'giulia@gmail.com','123456');
insert into usuario (nome, email,senha) values ('Caua', 'Caua@gmail.com','abcdef');

select * from  usuario;

CREATE TABLE pergunta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pergunta VARCHAR(255),
    categoria VARCHAR(50)
);

CREATE TABLE alternativa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fkPergunta INT,
    texto VARCHAR(255),
    pontuacao INT,
    perfil VARCHAR(50),

    FOREIGN KEY (fkPergunta)
        REFERENCES pergunta(id)
);

CREATE TABLE resposta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fkUsuario INT,
    fkPergunta INT,
    fkAlternativa INT,
    dataResposta DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (fkUsuario)
        REFERENCES usuario(id),

    FOREIGN KEY (fkPergunta)
        REFERENCES pergunta(id),

    FOREIGN KEY (fkAlternativa)
        REFERENCES alternativa(id)
);

