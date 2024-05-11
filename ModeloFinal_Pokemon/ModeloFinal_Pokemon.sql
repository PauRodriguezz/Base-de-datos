USE pokemondb;
# Where ------------------------------
/*Mostrar el nombre, peso y altura de los pokémon cuyo peso sea mayor a 150.
Tablas: pokemon
Campos: nombre, peso, altura*/
SELECT nombre, peso, altura
FROM pokemon
WHERE peso > 150;


/*Muestra los nombres y potencias de los movimientos que tienen una precisión mayor 90.
Tablas: movimiento
Campos: m.nombre, potencia */
SELECT nombre, potencia, precision_mov
From movimiento
WHERE precision_mov > 90;

#Operadores & joins --------------------
/* Mostrar tipo, nombre y potencia de los movimientos que tienen una potencia mayor igual que 120.
Tablas: movimiento, tipo
Campos: t.nombre, m.nombre, m.potencia
*/
SELECT m.nombre, m.potencia, t.nombre
FROM movimiento AS m
INNER JOIN tipo AS t
ON m.id_tipo = t.id_tipo;

