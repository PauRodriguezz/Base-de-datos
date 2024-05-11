USE movies_db;
#Utilizando la base de datos de movies, queremos conocer, por un lado, los títulos y el nombre del género de 
#todas las series de la base de datos.
SELECT s.title AS titulo, g.name AS genero
FROM series AS s, genres AS g
WHERE s.genre_id = g.id;

#Por otro, necesitamos listar los títulos de los episodios junto con el nombre y apellido de los actores que trabajan en cada uno de ellos.
SELECT e.title AS NombreEpisodio , a.first_name AS NombreActor , a.last_name AS ApellidoActor, e.id, a_e.episode_id, a_e.actor_id, a.id
FROM episodes AS e, actor_episode AS a_e, actors AS a 
WHERE a_e.episode_id = e.id AND a_e.actor_id = a.id;

#Para nuestro próximo desafío, necesitamos obtener a todos los actores o actrices (mostrar nombre y apellido) que han trabajado en cualquier película de la saga de La Guerra de las galaxias.
SELECT m.title AS Pelicula, a.first_name AS NombreActor, a.last_name AS ApellidoActor
FROM actor_movie AS am, actors AS a, movies AS m
WHERE m.id = am.movie_id AND am.actor_id = a.id
AND m.title LIKE '%La Guerra de las galaxias%';

#Crear un listado a partir de la tabla de películas, mostrar un reporte de la cantidad de películas por nombre de género.
SELECT g.id, g.name, COUNT(*) AS CantidadPelicula
FROM movies AS m, genres AS g
WHERE m.genre_id = g.id
GROUP BY g.name, g.id;