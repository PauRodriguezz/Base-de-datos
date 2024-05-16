USE pokemondb;
# Where ------------------------------
/*Mostrar el nombre, peso y altura de los pokémon cuyo peso sea mayor a 150.
Tablas: pokemon
Campos: nombre, peso, altura*/
SELECT nombre AS Pokemon, peso, altura
FROM pokemon
WHERE peso > 150;


/*Muestra los nombres y potencias de los movimientos que tienen una precisión mayor 90.
Tablas: movimiento
Campos: m.nombre, potencia */
SELECT nombre AS Pokemon, potencia, precision_mov
From movimiento
WHERE precision_mov > 90;

#Operadores & joins --------------------
/* Mostrar tipo, nombre y potencia de los movimientos que tienen una potencia mayor igual que 120.
Tablas: movimiento, tipo
Campos: t.nombre, m.nombre, m.potencia
*/
SELECT t.nombre AS Tipo, m.nombre AS Movimiento, m.potencia
FROM movimiento AS m
INNER JOIN tipo AS t
ON m.id_tipo = t.id_tipo;

/*Muestra los nombres movimientos y el tipo junto con sus tipos de ataque correspondientes de aquellos cuya potencia sea igual a 0.
Tablas: tipo, tipo_ataque, movimiento
Campos: t.nombre ta.tipo m.potencia
*/
SELECT m.nombre AS Moviemiento, m.potencia, t.nombre AS Tipo
FROM movimiento AS m
INNER JOIN tipo AS t
ON m.id_tipo = t.id_tipo
INNER JOIN tipo_ataque AS ta
ON t.id_tipo_ataque = ta.id_tipo_ataque
WHERE m.potencia = 0;

#Order by -----------------------------------------
/*Muestra los nombres y números de Pokédex de los primeros 10 Pokémon en orden alfabético.
Tablas: pokemon
Campos: numero_pokedex, nombre */
SELECT numero_pokedex, nombre AS Pokemon
FROM pokemon 
ORDER BY Pokemon ASC
LIMIT 10;

/*Muestra los nombres y alturas de los Pokémon de tipo "Eléctrico", ordenados por altura de forma descendente.
Tablas: pokemon, pokemon_tipo, tipo
Campos: nombre, altura */
SELECT p.nombre AS Pokemon, p.altura, t.nombre AS Tipo_Pokemon
FROM pokemon AS p
INNER JOIN pokemon_tipo AS pt
ON p.numero_pokedex = pt.numero_pokedex 
INNER JOIN tipo AS t
ON t.id_tipo = pt.id_tipo
WHERE t.nombre = "Electrico" 
ORDER BY altura DESC;

#Funciones de agregación ----------------------
/*¿Cuál es la suma total de los valores de "Defensa" en todas las estadísticas base?
Tablas: estadisticas_base
Campos: defensa */
SELECT SUM(defensa) AS SumaTotalDefensa
FROM estadisticas_base;

/*¿Cuántos Pokémon tienen el tipo "Fuego"?
	Tablas: pokemon_tipo, tipo
Campos: * */
SELECT COUNT(t.id_tipo) AS Cantidad_Pokemon, t.nombre AS Tipo_Pokemon
FROM pokemon_tipo AS pt
INNER JOIN tipo AS t
ON t.id_tipo = pt.id_tipo
WHERE t.nombre = "Fuego";

#Group by --------------------------------------------
/*Muestra los nombres de los tipos de Pokémon junto con la cantidad de Pokémon de cada tipo.
Tablas: pokemon_tipo, tipo
Campos: nombre, numero_pokedex*/
SELECT t.nombre AS Tipo_Pokemon, COUNT(t.id_tipo) AS Cantidad
FROM tipo AS t
INNER JOIN pokemon_tipo AS pt
ON t.id_tipo = pt.id_tipo
GROUP BY Tipo_pokemon;

/*Muestra los nombres de los tipos de Pokémon junto con el promedio de peso de los Pokémon de cada tipo. Ordena los resultados de manera descendente según el promedio de peso.
Tablas: pokemon, pokemon_tipo, tipo
Campos: t.nombre, p.peso*/
SELECT t.nombre AS Tipo_Pokemon, AVG(p.peso) AS Peso_Promedio 
FROM tipo AS t
INNER JOIN pokemon_tipo AS pt
ON t.id_tipo = pt.id_tipo
INNER JOIN pokemon AS p
ON p.numero_pokedex = pt.numero_pokedex
GROUP BY Tipo_Pokemon
ORDER BY Peso_Promedio DESC;


#Having -------------------------------------------
/*Muestra los nombres de los Pokémon que tienen más de un tipo.
Tablas: pokemon, pokemon_tipo
Campos: nombre*/
SELECT p.nombre AS pokemon
FROM pokemon AS p
INNER JOIN pokemon_tipo AS pt
ON p.numero_pokedex = pt.numero_pokedex
GROUP BY pokemon
HAVING COUNT(id_tipo)>1;

/*Muestra los nombres de los tipos de Pokémon junto con la cantidad de Pokémon de cada tipo que tienen un peso promedio mayor a 50.
Tablas: pokemon, pokemon_tipo, tipo
Campos: nombre, numero_pokedex */
SELECT  t.nombre AS tipo_pokemon, 
		COUNT(t.id_tipo) AS cantidad_pokemon, 
        AVG(p.peso) AS peso_promedio 
FROM tipo AS t
INNER JOIN pokemon_tipo AS pt
ON t.id_tipo = pt.id_tipo
INNER JOIN pokemon AS p
ON p.numero_pokedex = pt.numero_pokedex
GROUP BY tipo_pokemon
HAVING AVG(p.peso) >50;

#Funciones de alteración ----------------------------
/*Muestra los nombres de los movimientos de tipo de ataque "Especial" con una potencia superior a 10 y una descripción que contenga al menos 20 caracteres.
Tablas: movimiento, tipo_ataque
Campos: nombre, potencia, tipo, descripcion */
SELECT m.nombre AS movimiento, 
	   m.potencia,
       m.descripcion,
       ta.tipo AS tipo_ataque
FROM movimiento AS m
INNER JOIN tipo AS t
ON m.id_tipo = t.id_tipo
INNER JOIN tipo_ataque AS ta
ON t.id_tipo_ataque = ta.id_tipo_ataque
WHERE ta.tipo = "Especial"
AND potencia > 10 
AND length(m.descripcion) > 20;


/*Muestra los nombres de los tipos de Pokémon junto con la cantidad de Pokémon de cada tipo que tienen una velocidad promedio superior a 80. Solo incluye tipos que tienen al menos 3 Pokémon con esas características.
	Tablas: tipo, pokemon_tipo, estadisticas_base
Campos: t.nombre, * */
SELECT  t.nombre AS Tipo_Pokemon, 
		COUNT(t.id_tipo) AS Cantidad, 
        AVG(eb.velocidad) AS Velocidad_Promedio
FROM tipo AS t
INNER JOIN pokemon_tipo AS pt
ON t.id_tipo = pt.id_tipo
INNER JOIN pokemon AS p
ON p.numero_pokedex = pt.numero_pokedex
INNER JOIN estadisticas_base AS eb
ON p.numero_pokedex = eb.numero_pokedex
GROUP BY Tipo_pokemon
HAVING  AVG(eb.velocidad) > 80;

#Registros ----------------------------
/*Muestra el nombre de cada Pokémon junto con su tipo, velocidad base y puntos de salud (PS) base. Ordena los resultados por la velocidad base de forma descendente.
	Tablas: pokemon, estadisticas_base, pokemon_tipo, tipo
Campos: p.nombre, t.nombre, eb.velocidad, eb.ps */
SELECT p.nombre AS pokemon, 
	t.nombre AS tipo_pokemon, 
	eb.velocidad, 
    eb.ps
FROM pokemon AS p
INNER JOIN estadisticas_base AS eb
ON p.numero_pokedex = eb.numero_pokedex
INNER JOIN pokemon_tipo AS pt
ON p.numero_pokedex = pt.numero_pokedex
INNER JOIN tipo AS t
ON pt.id_tipo = t.id_tipo 
ORDER BY velocidad DESC;

/*Muestra los nombres de los movimientos de tipo "Agua" junto con los nombres de los Pokémon que pueden aprenderlos y el peso promedio de estos Pokémon.
	Tablas: movimiento, tipo_ataque, pokemon_tipo, tipo, pokemon
Campos: m.nombre, p.nombre, peso*/
SELECT m.nombre AS movimiento, 
	p.nombre AS pokemon, 
    AVG(p.peso) AS peso_promedio
FROM movimiento AS m
INNER JOIN tipo AS t
ON m.id_tipo = t.id_tipo
INNER JOIN pokemon_tipo AS pt
ON t.id_tipo = pt.id_tipo
INNER JOIN pokemon AS p
ON pt.numero_pokedex = p.numero_pokedex
WHERE t.nombre = "Agua"
GROUP BY movimiento, pokemon;









