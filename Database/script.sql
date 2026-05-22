DROP DATABASE IF EXISTS BSD;
CREATE DATABASE IF NOT EXISTS BSD;
USE BSD;

CREATE TABLE usuario(
idUsuario int primary key AUTO_INCREMENT,
nome VARCHAR(100),
email VARCHAR(100),
senha VARCHAR(100) );

CREATE TABLE autor(
id_autor int primary key AUTO_INCREMENT,
nome_Autor VARCHAR(100),
fk_usuario int,
foreign key (fk_usuario) REFERENCES usuario (idUsuario));

INSERT INTO autor (id_autor, nome_Autor) VALUES 
(1,'Chuuya Nakahara'),
(2,"Dazai Osamu");

CREATE TABLE livro(
id INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(100),
Ano YEAR,
Descriçao VARCHAR(100),
fkEscritor INT,
FOREIGN KEY (fkEscritor) REFERENCES Autor(id_autor));

INSERT INTO livro (id,nome,ano,descriçao,fkescritor) VALUES
(1,"Declinio de um Homem",1948,"Uma obra-prima do desespero existencial",2),
(2, "O Sol Poente",1947,"O declínio da aristocracia japonesa",2),
(3,"Schoolgirl",1939,"Um dia na vida de uma estudante",2),
(4,"Os Poemas De Nakahara Chuuya", 1934,"Coletânea de poesias líricas",1),
(5, "Canção Da Cabra",1928,"Versos de melancolia e beleza",1),
(6,"Mt. Fuji",1926,"Poemas sobre natureza e solidão",1);


select * from usuario;

CREATE TABLE Pergunta(
id INT PRIMARY KEY AUTO_INCREMENT,
Pergunta VARCHAR(100));

INSERT INTO pergunta (id,pergunta) VALUES
(1,"O que mais te atrai em uma história?"),
(2,"Qual estilo de escrita você prefere?"),
(3,"Que tipo de protagonista te interessa?");


CREATE TABLE opcao (
id_opcao INT AUTO_INCREMENT PRIMARY KEY,
Opçao VARCHAR(100),
fkPergunta INT,
fkAutor INT,
FOREIGN KEY (fkAutor) REFERENCES Autor(id_autor),
FOREIGN KEY (fkPergunta) REFERENCES pergunta(id));


INSERT INTO opcao (id_opcao,Opçao,fkPergunta,fkAutor) VALUES 
(1, "Profundidade psicológica e questionamentos existenciais",1,2),
(2,"Beleza lírica e expressão emocional",1,1),
(3,"Prosa introspectiva e sombria",2,2),
(4,"Versos poéticos e melódicos",2,1),
(5,"Prosa introspectiva e sombria",3,2),
(6,"Versos poéticos e melódicos",3,1);

CREATE TABLE Resposta (
idResposta INT AUTO_INCREMENT,
fkUsuario INT,
fkPergunta INT,
fkOpcao INT,
hora_data DATETIME DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (idResposta,fkUsuario,fkPergunta,fkOpcao),
FOREIGN KEY(fkUsuario) REFERENCES usuario (idUsuario),
FOREIGN KEY(fkopcao) REFERENCES opcao(id_opcao),
FOREIGN KEY(fkPergunta) REFERENCES pergunta (id));

SELECT fkUsuario ;

select * FROM Resposta;

SELECT Pergunta,Opçao,nome_Autor,nome FROM      Reposta
JOIN Pergunta ON id = fkPergunta
JOIN Autor ON id_autor = fkAutor
JOIN usuario ON id_Usuario = fk;

INSERT INTO Resposta (fkUsuario,fkPergunta,fkopcao,fkAutor) VALUES 
(?,?,?);


SELECT 
usuario.nome,
Pergunta.pergunta,
opcao.Opçao,
autor.nome_Autor

FROM Resposta

JOIN usuario
ON usuario.idUsuario = Resposta.fkUsuario

JOIN Pergunta
ON Pergunta.id = Resposta.fkPergunta

JOIN opcao
ON opcao.id_opcao = Resposta.fkOpcao

JOIN autor
ON autor.id_autor = opcao.fkAutor;

