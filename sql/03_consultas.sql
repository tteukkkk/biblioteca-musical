-- Projeto acadêmico | Matheus Macêdo Felicio
SET NAMES utf8mb4;

USE biblioteca_musical;

-- Exercício 1
select nome from artistas where pais_origem = 'Brazil';


-- Exercício 2
select titulo, duracao from musicas where duracao > '00:03:00';


-- Exercício 3
select titulo from albuns where year(data_lancamento) > 2015;


-- Exercício 4
select * from playlists
where nome like 'A%';


-- Exercício 5
select nome, email from usuarios
order by nome;


-- Exercício 6
select m.titulo as Nome_Musica, ab.titulo as Nome_Album , art.nome as Nome_Artista from musicas m
join albuns ab on m.id_album = ab.id
join artistas art on ab.id_artista = art.id;


-- Exercício 7
select us.nome, p.nome as Titulo_Playlist from usuarios us
join playlists p on us.id = p.id_usuario;


-- Exercício 8
select m.titulo as Titulo_Musica, g.nome as Genero, ar.nome as Artista from musicas m
join generos g on m.id_genero = g.id
join albuns a on m.id_album = a.id
join artistas ar on a.id_artista = ar.id;


-- Exercício 9
select us.nome as Nome, m.titulo as Musica, c.comentario as Comentario, c.data_comentario as Data_Comentario from comentarios c
join usuarios us on c.id_usuario = us.id
join musicas m on c.id_musica = m.id;


-- Exercício 10
select m.titulo as Nome_Musica from musicas m
join musica_playlist mp on m.id = mp.id_musica
join playlists p on mp.id_playlist = p.id
where p.nome = 'favoritas';


-- Exercício 11
select g.nome as Genero, count(m.id) as Quantidades from generos g
join musicas m on g.id = m.id_genero
group by g.id, g.nome;


-- Exercício 12
select m.titulo as Titulo_Musica, avg(a.nota) as Media from musicas m
join avaliacoes a on m.id = a.id_musica
group by m.id, m.titulo;


-- Exercício 13
select g.nome as Genero, SEC_TO_TIME(ROUND(AVG(TIME_TO_SEC(m.duracao)))) as Media_Duracao from musicas m
join generos g on m.id_genero = g.id
group by g.id, g.nome;


-- Exercício 14
select us.nome as Nome_Usuario, count(s.id_seguindo) as Seguidores from usuarios us
join seguidores s on us.id = s.id_seguindo
group by us.id, us.nome;


-- Exercício 15
select count(*) as Total_de_Musicas from musica_playlist;


-- Exercício 16
select us.nome from usuarios us
join playlists play on us.id = play.id_usuario
where play.data_criacao >= curdate() - interval 2 year;


-- Exercício 17
select art.nome as Nome_artista, datediff(curdate(), data_estreia)/365 as Data_estreia from artistas art
join albuns ab on art.id = ab.id_artista
where datediff(curdate(), data_estreia) > 3650;


-- Exercício 18
select m.titulo as Nome_Musica from musicas m
join comentarios c on m.id = c.id_musica
where c.data_comentario >= curdate() - interval 30 day;


-- Exercício 19
select us.nome, datediff(curdate(), max(a.data_avaliacao)) as Avaliacao_Mais_Recente from usuarios us
join avaliacoes a on us.id = a.id_usuario
group by us.id, us.nome;


-- Exercício 20
select us.nome as Nome_Usuario, datediff(curdate(), max(play.data_criacao)) as Dias from usuarios us
join playlists play on us.id = play.id_usuario
group by us.id, us.nome;
