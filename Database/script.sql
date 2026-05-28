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
nome_Autor VARCHAR(100)
);

INSERT INTO autor (id_autor, nome_Autor) VALUES 
(1,'Chuuya Nakahara'),
(2,"Dazai Osamu");

CREATE TABLE livro(
id INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(100),
Ano YEAR,
Descriçao VARCHAR(100),
fkEscritor INT,
FOREIGN KEY (fkEscritor) REFERENCES autor(id_autor)
);

INSERT INTO livro (id,nome,ano,descriçao,fkescritor) VALUES
(1,"Declinio de um Homem",1948,"Uma obra-prima do desespero existencial",2),
(2, "O Sol Poente",1947,"O declínio da aristocracia japonesa",2),
(3,"Schoolgirl",1939,"Um dia na vida de uma estudante",2),
(4,"Os Poemas De Nakahara Chuuya", 1934,"Coletânea de poesias líricas",1),
(5, "Canção Da Cabra",1928,"Versos de melancolia e beleza",1),
(6,"Mt. Fuji",1926,"Poemas sobre natureza e solidão",1);


select * from usuario;

CREATE TABLE pergunta(
id INT PRIMARY KEY AUTO_INCREMENT,
Pergunta VARCHAR(100));

INSERT INTO pergunta (id,pergunta) VALUES
(1,"O que mais te atrai em uma história?"),
(2,"Qual estilo de escrita você prefere?"),
(3,"Que tipo de protagonista te interessa?");


CREATE TABLE alternativa (
id_alternativa INT AUTO_INCREMENT PRIMARY KEY,
opcao VARCHAR(100),
fkPergunta INT,
fkAutor INT,
FOREIGN KEY (fkAutor) REFERENCES autor(id_autor),
FOREIGN KEY (fkPergunta) REFERENCES pergunta(id));


INSERT INTO alternativa (id_alternativa,opcao,fkPergunta,fkAutor) VALUES 
(1, "Profundidade psicológica e questionamentos existenciais",1,2),
(2,"Beleza lírica e expressão emocional",1,1),
(3,"Prosa introspectiva e sombria",2,2),
(4,"Versos poéticos e melódicos",2,1),
(5,"Prosa introspectiva e sombria",3,2),
(6,"Versos poéticos e melódicos",3,1);




CREATE TABLE resposta (
idresposta INT PRIMARY KEY AUTO_INCREMENT,
fkUsuario INT,
fkAutor INT,
data_resposta DATETIME DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
FOREIGN KEY (fkAutor) REFERENCES autor(id_Autor)
);

select * from usuario;


INSERT INTO resposta (fkUsuario, fkAutor) VALUES
(1, 2);



SELECT 
autor.nome_Autor,
COUNT(resposta.fkAutor) AS total
FROM resposta
JOIN autor
ON resposta.fkAutor = autor.id_autor
GROUP BY autor.nome_Autor;




