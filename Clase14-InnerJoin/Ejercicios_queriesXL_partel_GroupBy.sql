USE emarket;
#Clientes -----------------------------
#¿Cuántos clientes existen?
SELECT COUNT(ClienteID)
FROM clientes;

#¿Cuántos clientes hay por ciudad?
SELECT Ciudad, COUNT(clienteID)
FROM clientes
GROUP BY Ciudad;

#Facturas -----------------------------
#¿Cuál es el total de transporte?
SELECT sum(Transporte) AS TotalTransporte
FROM facturas;

#¿Cuál es el total de transporte por EnvioVia (empresa de envío)?
SELECT EnvioVia, SUM(Transporte) AS TotalTransporte
FROM facturas
GROUP BY EnvioVia;

#Calcular la cantidad de facturas por cliente. Ordenar descendentemente por cantidad de facturas.
SELECT ClienteID, COUNT(FacturaID) AS CantidadFacturas
FROM facturas
GROUP BY ClienteID
ORDER BY CantidadFacturas DESC;

#Obtener el Top 5 de clientes de acuerdo a su cantidad de facturas.
SELECT ClienteID, COUNT(FacturaID) AS CantidadFacturas
FROM facturas
GROUP BY ClienteID
ORDER BY CantidadFacturas DESC
LIMIT 5;

#¿Cuál es el país de envío menos frecuente de acuerdo a la cantidad de facturas?
SELECT PaisEnvio, COUNT(FacturaID) AS CantidadFacturas
FROM facturas
GROUP BY PaisEnvio
ORDER BY CantidadFacturas
LIMIT 1;

#Se quiere otorgar un bono al empleado con más ventas. ¿Qué ID de empleado realizó más operaciones de ventas?
SELECT EmpleadoID, COUNT(FacturaID) AS CantidadFacturas
FROM facturas
GROUP BY EmpleadoID
ORDER BY CantidadFacturas DESC
LIMIT 1;

#Factura detalle -----------------------------
#¿Cuál es el producto que aparece en más líneas de la tabla Factura Detalle?
SELECT ProductoID, COUNT(*) AS CantidadLineas
FROM facturadetalle
GROUP BY ProductoID
ORDER BY CantidadLineas DESC
LIMIT 1;

#¿Cuál es el total facturado? Considerar que el total facturado es la suma de cantidad por precio unitario.
SELECT SUM(PrecioUnitario * Cantidad) AS TotalFacturado
FROM facturadetalle;

#¿Cuál es el total facturado para los productos ID entre 30 y 50?
SELECT ProductoID, SUM(PrecioUnitario * Cantidad) AS TotalFacturado
FROM facturadetalle
WHERE ProductoID BETWEEN "30" AND "50"
GROUP BY ProductoID;

#¿Cuál es el precio unitario promedio de cada producto?
SELECT ProductoID, AVG(PrecioUnitario) AS PromedioPrecioUnitario
FROM facturadetalle
GROUP BY ProductoID;

#¿Cuál es el precio unitario máximo?
SELECT ProductoID, MAX(PrecioUnitario) AS PrecioMax
FROM facturadetalle
GROUP BY ProductoID
ORDER BY PrecioMax DESC
LIMIT 1;
