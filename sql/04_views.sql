-- Projeto acadêmico | Matheus Macêdo Felicio
SET NAMES utf8mb4;

USE biblioteca_musical;

-- Exercício 26
create view relatorio_avaliacoes as
select us.nome as Nome_usuario, m.titulo as Musica_Titulo, a.nota as Nota, a.data_avaliacao as Data_Avaliacao from usuarios us
join avaliacoes a on us.id = a.id_usuario
join musicas m on a.id_musica = m.id;

select * from relatorio_avaliacoes;


-- Exercício 27
create view top_avaliacoes_genero as
select g.nome as Genero, m.titulo as Musica_Titulo, avg(a.nota) as Media from generos g
join musicas m on g.id = m.id_genero
join avaliacoes a on m.id = a.id_musica
group by g.id, g.nome, m.id, m.titulo
having avg(a.nota) > 4;

select * from top_avaliacoes_genero;


-- Exercício 28
create view quantidade_musicas_por_playlist as
select play.nome as Nome_playlist, us.nome as Nome_Usuario, count(mp.id_musica) as Quantidade_de_Musica from playlists play
join usuarios us on play.id_usuario = us.id
join musica_playlist mp on play.id = mp.id_playlist
group by play.id, play.nome, us.nome;

select * from quantidade_musicas_por_playlist;


-- Exercício 29
create view comentarios_recentes as
select us.nome as Nome_Usuario, m.titulo as Musica_Titulo, c.comentario, c.data_comentario from comentarios c
join usuarios us on c.id_usuario = us.id
join musicas m on c.id_musica = m.id
where c.data_comentario >= curdate() - interval 15 day;

select * from comentarios_recentes;


-- Exercício 30
create view avaliadores_frequentes as
select us.nome as Nome_Usuario, count(a.id_musica) as Quantidade
from usuarios us
join avaliacoes a on us.id = a.id_usuario
group by us.id, us.nome
having count(a.id_musica) > 5;

select * from avaliadores_frequentes;


-- Exercício 31
create view duracao_total_album as
select a.titulo as Album, ROUND(SUM(TIME_TO_SEC(m.duracao))/60, 2) as Duracao_Minutos from albuns a
join musicas m on a.id = m.id_album
group by a.id, a.titulo;

select * from duracao_total_album;
