USE musimundos;
#cantidad de clientes que son de Brazil.
SELECT COUNT(*) AS cantidad
FROM clientes
WHERE pais = "Brazil";

#hacé una consulta a la base de datos que traiga el id del género y la cantidad de canciones que posee. 
SELECT COUNT(*) AS Cantidad_Canciones, generos.id
FROM canciones, generos
WHERE canciones.id_genero = generos.id
GROUP BY generos.id; 

#queremos saber cuánto dinero llevan gastados los clientes en nuestra empresa
SELECT SUM(total)
FROM facturas;

#Obtiene una lista de todos los álbumes y su duración (milisegundos) promedio.
SELECT a.id,a.titulo, AVG(c.milisegundos)
FROM albumes AS a, canciones AS c
WHERE c.id_album = a.id AND a.titulo = "Let There Be Rock"
GROUP BY a.id, a.titulo;

#Hace una consulta a la base de datos para saber cuál es el archivo de cancion con menor peso en bytes.
SELECT MIN(canciones.bytes)
FROM canciones;

#Hacé una consulta a la base de datos que nos traiga por id_cliente la suma total de sus facturas. 
#Filtra aquellos que la suma del total sea 45. ¿Cuál es la suma total del cliente con id = 6?
SELECT c.id, SUM(f.total) AS TotalFacturacion
FROM facturas AS f, clientes AS c
WHERE f.id_cliente = c.id 
GROUP BY c.id
HAVING SUM(f.total) >45 AND c.id =6;

