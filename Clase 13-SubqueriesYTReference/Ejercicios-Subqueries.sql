USE movies_db;
#Utilizando la base de datos de movies, queremos conocer, por un lado, los títulos y el nombre del género de todas las series de la base de datos.
SELECT s.title,
(SELECT g.name FROM genres AS g WHERE s.genre_id = g.id) AS genero
FROM series AS s;

#Por otro, necesitamos listar los títulos de los episodios junto con el nombre y apellido de los actores que trabajan en cada uno de ellos.
SELECT 
	(SELECT a.first_name FROM actors AS a WHERE a.id = ae.actor_id) AS NombreActor,
    (SELECT a.last_name FROM actors AS a WHERE a.id = ae.actor_id) AS ApellidoActor,
    (SELECT e.title FROM episodes AS e WHERE e.id = ae.episode_id) AS TituloEpisodio
FROM actor_episode AS ae;

#Para nuestro próximo desafío, necesitamos obtener a todos los actores o actrices (mostrar nombre y apellido) que han trabajado en cualquier película de la saga de La Guerra de las galaxias.
SELECT
	(SELECT a.first_name FROM actors AS a WHERE a.id = am.actor_id) AS NombreActor,
	(SELECT a.last_name FROM actors AS a WHERE a.id = am.actor_id) AS ApellidoActor,
    (SELECT m.title FROM movies AS m WHERE m.id = am.movie_id AND m.title LIKE '%La Guerra de las galaxias%') AS TituloPelicula
FROM actor_movie AS am;

#Crear un listado a partir de la tabla de películas, mostrar un reporte de la cantidad de películas por nombre de género.
SELECT 
	(SELECT g.name FROM genres AS g WHERE g.id = m.genre_id) AS NombreGenero,
    COUNT(*) AS cantidadPeliculas
FROM movies AS m
GROUP BY NombreGenero;

