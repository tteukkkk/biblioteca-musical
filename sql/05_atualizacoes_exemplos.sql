-- Projeto acadêmico | Matheus Macêdo Felicio
SET NAMES utf8mb4;

USE biblioteca_musical;

-- Opcional: altera os dados de demonstração.

-- Exercício 21
update artistas set pais_origem = 'desconhecido'
where pais_origem = '' OR pais_origem IS NULL;

select * from artistas;


-- Exercício 22
update generos set nome = 'hip-hop'
where nome = 'Hip Hop';

select * from generos;


-- Exercício 23
update avaliacoes set nota = 5
where id_musica = 10;

select * from avaliacoes;


-- Exercício 24
update avaliacoes set nota = nota + 1
where nota < 3;

select * from avaliacoes;


-- Exercício 25
update usuarios set senha = 'EXEMPLO_DIDATICO_NAO_USAR'
where email like '%@teste.com';

select * from usuarios;
