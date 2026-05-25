-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/



CREATE DATABASE projetoPessoal;

USE projetoPessoal;

CREATE USER 'teste'@'%' IDENTIFIED BY 'Teste#2026';

GRANT ALL PRIVILEGES ON projetopessoal.* TO 'teste'@'%';
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

INSERT INTO pergunta (pergunta, categoria) VALUES
('Você descobre que uma pessoa muito próxima cometeu um erro grave que pode prejudicar outras pessoas. Ninguém além de você sabe da verdade.', 'Personalidade'),
('Você pode impedir algo ruim de acontecer, mas isso custará uma amizade importante para você.', 'Personalidade'),
('Você recebe a chance de voltar no tempo e corrigir um erro do passado. Porém, mudar isso pode afetar a vida de outras pessoas.', 'Personalidade'),
('Seus poderes possibilitam você a salvar a pessoa que você mais ama da morte, mas isso significa destruir a ordem natural das coisas.', 'Personalidade'),
('Você salvaria a pessoa que ama ou salvaria toda a cidade?', 'Final');

CREATE TABLE alternativa (
id INT PRIMARY KEY AUTO_INCREMENT,
texto VARCHAR(255),
emocao VARCHAR(30),
pontosEmocao INT,
tendencia VARCHAR(20),
pontosTendencia INT,
 fkPergunta INT,
 FOREIGN KEY (fkPergunta) REFERENCES pergunta(id)
);

INSERT INTO alternativa (texto,emocao, pontosEmocao, tendencia, pontosTendencia, fkPergunta) VALUES
('Converso com ela antes de qualquer decisão.','Empatia', 1, 'Emotivo', 1, 1),
('Assumo o risco e exponho tudo imediatamente.','Coragem', 1, 'Racional', 1, 1),
('A verdade deve aparecer, mesmo que machuque alguém.','Justiça', 1, 'Racional', 1, 1),
('Protejo essa pessoa, independentemente das consequências.','Lealdade', 1, 'Emotivo', 1, 1);

INSERT INTO alternativa(texto, emocao, pontosEmocao, tendencia, pontosTendencia, fkPergunta)VALUES
('Tento encontrar uma solução onde ninguém saia ferido.', 'Empatia', 1, 'Emotivo', 1, 2),
('Aceito perder essa amizade para fazer o que precisa ser feito.','Coragem', 1, 'Racional', 1, 2),
('Alguns sacrifícios são necessários pelo bem maior.','Justiça', 1, 'Racional', 1, 2),
('Uma amizade verdadeira vale mais que qualquer consequência.','Lealdade', 1, 'Emotivo', 1, 2);

INSERT INTO alternativa(texto, emocao, pontosEmocao, tendencia, pontosTendencia, fkPergunta) VALUES
('Pensaria primeiro em como isso afetaria todos ao meu redor.','Empatia', 1, 'Emotivo', 1, 3),
('Mesmo com riscos, eu tentaria mudar o passado.','Coragem', 1, 'Emotivo', 1, 3),
('Algumas coisas não devem ser alteradas.','Justiça', 1, 'Racional', 1, 3),
('Voltaria no tempo para salvar alguém importante para mim.','Lealdade', 1, 'Emotivo', 1, 3);

INSERT INTO alternativa(texto, emocao, pontosEmocao, tendencia, pontosTendencia, fkPergunta) VALUES
('Eu sofreria tentando encontrar outra alternativa.', 'Empatia', 1, 'Emotivo', 1, 4),
('Tomaria a decisão mais difícil sem hesitar.','Coragem',1, 'Racional', 1, 4),
('O bem coletivo deve vir primeiro.','Justiça', 1, 'Racional', 1, 4),
('Eu jamais abandonaria quem amo.','Lealdade', 1, 'Emotivo', 1, 4);

INSERT INTO alternativa (texto,tendencia, pontosTendencia, fkPergunta) VALUES
('Escolho salvar a pessoa que mais amo.','Emotivo', 2, 5),
('Escolho salvar a cidade.', 'Racional', 2, 5);

select * from alternativa;
select * from pergunta;
select * from resposta;

CREATE TABLE resposta (
id INT PRIMARY KEY AUTO_INCREMENT,
fkUsuario INT,
fkPergunta INT,
fkAlternativa INT,
dataResposta DATETIME DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (fkUsuario) REFERENCES usuario(id),
FOREIGN KEY (fkPergunta) REFERENCES pergunta(id), 
FOREIGN KEY (fkAlternativa) REFERENCES alternativa(id)
);


