DROP DATABASE IF EXISTS plataformajogos;
CREATE DATABASE plataformajogos;
USE plataformajogos;

CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    senha VARCHAR(100),
    data_cadastro DATE
);

CREATE TABLE desenvolvedora (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    pais VARCHAR(50),
    ano_fundacao INT
);

CREATE TABLE jogo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    data_lancamento DATE,
    preco DECIMAL(10,2),
    id_desenvolvedora INT,
    FOREIGN KEY (id_desenvolvedora) REFERENCES desenvolvedora(id)
);

CREATE TABLE categoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE jogocategoria (
    id_jogo INT,
    id_categoria INT,
    PRIMARY KEY (id_jogo, id_categoria),
    FOREIGN KEY (id_jogo) REFERENCES jogo(id),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id)
);

CREATE TABLE biblioteca (
    id_usuario INT,
    id_jogo INT,
    data_aquisicao DATE,
    PRIMARY KEY (id_usuario, id_jogo),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    FOREIGN KEY (id_jogo) REFERENCES jogo(id)
);

INSERT INTO usuario (nome, email, senha, data_cadastro) VALUES
('Carlos Silva','carlos.silva@gmail.com','senha123','2023-01-10'),
('Ana Costa','ana.costa@gmail.com','senha123','2023-02-15'),
('Marcos Dias','marcos.dias@gmail.com','senha123','2023-03-20'),
('Luciana Lima','luciana.lima@gmail.com','senha123','2023-04-22'),
('João Pedro','joao.pedro@gmail.com','senha123','2023-05-30'),
('Fernanda Souza','fernanda.souza@gmail.com','senha123','2023-06-05'),
('Bruno Almeida','bruno.almeida@gmail.com','senha123','2023-07-07'),
('Camila Rocha','camila.rocha@gmail.com','senha123','2023-08-11'),
('Pedro Henrique','pedro.henrique@gmail.com','senha123','2023-09-14'),
('Roberta Melo','roberta.melo@gmail.com','senha123','2023-10-18');

INSERT INTO desenvolvedora (nome, pais, ano_fundacao) VALUES
('Valve Corporation','EUA',1996),
('Epic Games','EUA',1991),
('CD Projekt Red','Polônia',2002),
('Rockstar Games','EUA',1998),
('Ubisoft','França',1986),
('Square Enix','Japão',2003),
('Electronic Arts','EUA',1982),
('FromSoftware','Japão',1986),
('Bethesda','EUA',1986),
('Activision Blizzard','EUA',2008);

INSERT INTO jogo (titulo, data_lancamento, preco, id_desenvolvedora) VALUES
('Half-Life','1998-11-19',49.99,1),
('Fortnite','2017-07-25',0.00,2),
('Cyberpunk 2077','2020-12-10',199.99,3),
('GTA V','2013-09-17',119.99,4),
('Assassin’s Creed Valhalla','2020-11-10',149.99,5),
('Final Fantasy XV','2016-11-29',159.99,6),
('The Sims 4','2014-09-02',99.99,7),
('Elden Ring','2022-02-25',249.99,8),
('Skyrim','2011-11-11',79.99,9),
('Call of Duty: Modern Warfare','2019-10-25',199.99,10);

INSERT INTO categoria (nome) VALUES
('Ação'),('Aventura'),('RPG'),('Simulação'),('FPS'),
('Battle Royale'),('Estratégia'),('Terror'),('Sandbox'),('Mundo Aberto');

INSERT INTO jogocategoria VALUES
(1,1),(1,5),(2,6),(3,3),(4,9),(4,10),
(5,2),(6,3),(7,4),(8,1),(8,3),
(9,9),(9,10),(10,1),(10,5);

INSERT INTO biblioteca VALUES
(1,1,'2023-02-10'),
(2,2,'2023-03-01'),
(3,3,'2023-03-21'),
(4,4,'2023-04-23'),
(5,5,'2023-05-31'),
(6,6,'2023-06-06'),
(7,7,'2023-07-08'),
(8,8,'2023-08-12'),
(9,9,'2023-09-15'),
(10,10,'2023-10-19');

SELECT * FROM usuario
WHERE data_cadastro > '2023-03-01';

SELECT * FROM jogo
WHERE preco > 100.00;

SELECT * FROM desenvolvedora
WHERE ano_fundacao > 2000;

SELECT j.titulo
FROM jogo j
JOIN desenvolvedora d ON j.id_desenvolvedora = d.id
WHERE d.nome = 'Valve Corporation';

SELECT AVG(preco) AS preco_medio FROM jogo;

SELECT SUM(j.preco) AS total_gasto
FROM usuario u
JOIN biblioteca b ON u.id = b.id_usuario
JOIN jogo j ON b.id_jogo = j.id
WHERE u.nome = 'Carlos Silva';

SELECT j.titulo, j.preco
FROM jogo j
JOIN desenvolvedora d ON j.id_desenvolvedora = d.id
WHERE d.nome = 'Rockstar Games'
ORDER BY j.preco DESC
LIMIT 1;

SELECT j.titulo
FROM jogo j
JOIN jogocategoria jc ON j.id = jc.id_jogo
JOIN categoria c ON jc.id_categoria = c.id
WHERE c.nome = 'RPG';

SELECT u.nome, j.titulo
FROM usuario u
JOIN biblioteca b ON u.id = b.id_usuario
JOIN jogo j ON b.id_jogo = j.id
ORDER BY u.nome;

SELECT COUNT(j.id) AS total_jogos
FROM jogo j
JOIN desenvolvedora d ON j.id_desenvolvedora = d.id
WHERE d.pais = 'EUA';
