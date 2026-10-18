-- Projeto acadêmico | Matheus Macêdo Felicio
SET NAMES utf8mb4;

CREATE DATABASE biblioteca_musical CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE biblioteca_musical;

CREATE TABLE artistas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    pais_origem VARCHAR(50),
    data_estreia DATE
);

CREATE TABLE generos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT
);

CREATE TABLE albuns (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    id_artista INT,
    data_lancamento DATE,
    FOREIGN KEY (id_artista) REFERENCES artistas(id)
);

CREATE TABLE musicas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    duracao TIME,
    id_album INT,
    id_genero INT,
    FOREIGN KEY (id_album) REFERENCES albuns(id),
    FOREIGN KEY (id_genero) REFERENCES generos(id)
);

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    senha VARCHAR(100)
);

CREATE TABLE playlists (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    id_usuario INT,
    data_criacao DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

CREATE TABLE musica_playlist (
    id_playlist INT,
    id_musica INT,
    PRIMARY KEY (id_playlist, id_musica),
    FOREIGN KEY (id_playlist) REFERENCES playlists(id),
    FOREIGN KEY (id_musica) REFERENCES musicas(id)
);

CREATE TABLE avaliacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_musica INT,
    nota INT CHECK (nota BETWEEN 1 AND 5),
    data_avaliacao DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
    FOREIGN KEY (id_musica) REFERENCES musicas(id)
);

CREATE TABLE seguidores (
    id_usuario INT,
    id_seguindo INT,
    PRIMARY KEY (id_usuario, id_seguindo),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
    FOREIGN KEY (id_seguindo) REFERENCES usuarios(id)
);

CREATE TABLE comentarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_musica INT,
    comentario TEXT,
    data_comentario DATETIME,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
    FOREIGN KEY (id_musica) REFERENCES musicas(id)
);
