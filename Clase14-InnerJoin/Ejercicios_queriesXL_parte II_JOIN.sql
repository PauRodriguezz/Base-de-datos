USE emarket;
#Generar un listado de todas las facturas del empleado 'Buchanan'. 
SELECT f.FacturaID , f.FechaFactura, e.nombre, e.apellido
FROM facturas AS f
INNER JOIN empleados AS e
ON f.EmpleadoID = e.EmpleadoID
WHERE e.Apellido = "Buchanan";

#Generar un listado con todos los campos de las facturas del correo 'Speedy Express'.
SELECT *
FROM facturas AS f
INNER JOIN correos AS c
ON f.EnvioVia = c.CorreoID
WHERE c.Compania = "Speedy Express";

#Generar un listado de todas las facturas con el nombre y apellido de los empleados.
SELECT f.FacturaID , e.Nombre, e.Apellido
FROM facturas AS f
INNER JOIN empleados AS e 
ON f.EmpleadoID = e.EmpleadoID;

#Mostrar un listado de las facturas de todos los clientes “Owner” y país de envío “USA”.
SELECT f.FacturaID, f.PaisEnvio, c.Titulo
FROM facturas AS f
INNER JOIN clientes AS c
ON f.ClienteID = c.ClienteID
WHERE c.Titulo = "Owner";

#Mostrar todos los campos de las facturas del empleado cuyo apellido sea “Leverling” o que incluyan el producto id = “42”.
SELECT *
FROM facturas AS f
INNER JOIN empleados AS e
ON f.EmpleadoID = e.EmpleadoID
INNER JOIN facturadetalle AS fd
ON f.FacturaID = fd.FacturaID
WHERE e.Apellido = "Leverling" OR fd.ProductoID = "42"; 

#Mostrar todos los campos de las facturas del empleado cuyo apellido sea “Leverling” y que incluya los producto id = “80” o ”42”.
SELECT *
FROM facturas AS f
INNER JOIN empleados AS e
ON f.EmpleadoID = e.EmpleadoID
INNER JOIN facturadetalle AS fd
ON f.FacturaID = fd.FacturaID
WHERE e.Apellido = "Leverling" OR fd.ProductoID = "80" OR fd.ProductoID = "42"; 

#Generar un listado con los cinco mejores clientes, según sus importes de compras total (PrecioUnitario * Cantidad).
SELECT c.ClienteID, c.Compania, SUM(fd.PrecioUnitario * fd.Cantidad) AS ImporteTotal 
FROM clientes AS c
INNER JOIN facturas AS f
ON c.ClienteID = f.ClienteID
INNER JOIN facturadetalle AS fd
ON f.FacturaID = fd.FacturaID
GROUP BY c.ClienteID, c.Compania
ORDER BY ImporteTotal DESC
LIMIT 5;

#Generar un listado de facturas, con los campos id, nombre y apellido del cliente, fecha de factura, país de envío, Total, ordenado de manera descendente por fecha de factura y limitado a 10 filas.
SELECT c.ClienteID, c.Compania AS Nombre, MAX(f.FechaFactura) AS FechaFactura, f.PaisEnvio, COUNT(f.FacturaID) AS TotalFactura
FROM facturas AS f
INNER JOIN clientes AS c
ON f.ClienteID = c.ClienteID
GROUP BY c.ClienteID, c.Compania, f.PaisEnvio
ORDER BY MAX(f.FechaFactura) DESC
LIMIT 10;







