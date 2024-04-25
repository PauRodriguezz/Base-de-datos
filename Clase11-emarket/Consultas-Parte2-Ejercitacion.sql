#PARTE 2 (ALIAS, LIMIT y OFFSET.)
#Productos ----------------------------
USE emarket;
#1.Obtener el listado de todos los productos ordenados descendentemente por precio unitario.
SELECT ProductoNombre AS Producto, PrecioUnitario FROM productos
ORDER BY PrecioUnitario DESC;

#2.Obtener el listado de top 5 de productos cuyo precio unitario es el más caro.
SELECT * FROM productos
ORDER BY PrecioUnitario DESC
LIMIT 5;

#3.Obtener un top 10 de los productos con más unidades en stock.
SELECT * FROM productos
ORDER BY UnidadesStock DESC
LIMIT 10;


#FacturaDetalle -----------------------------------
#1.Obtener un listado de FacturaID, ProductoID, Cantidad.
SELECT FacturaID  AS NroFactura, ProductoID AS CodProducto , Cantidad AS Cantidad_Productos 
FROM facturadetalle;

#2.Ordenar el listado anterior por cantidad descendentemente.
SELECT FacturaID, ProductoID, Cantidad 
FROM facturadetalle
ORDER BY Cantidad DESC;

#3.Filtrar el listado solo para aquellos productos donde la cantidad se encuentre entre 50 y 100.
SELECT FacturaID  AS Factura, ProductoID AS Producto , Cantidad AS Cantidad_Productos 
FROM facturadetalle
WHERE Cantidad BETWEEN 50 and 100;


#4.En otro listado nuevo, obtener un listado con los siguientes nombres de columnas: NroFactura (FacturaID), Producto (ProductoID), Total (PrecioUnitario*Cantidad).
SELECT FacturaID  AS NroFactura, ProductoID AS Producto , (PrecioUnitario*Cantidad) AS Total
FROM facturadetalle

