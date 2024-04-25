-- Sacar un listado en el que se vea el número de lineas que consta cada pedido
SELECT OrderID, COUNT(*) AS NumLineas FROM orderdetails
GROUP BY orderID;

-- Sacar un listado con los pedidos que tengan más de 4 elementos.
SELECT OrderID, COUNT(*) AS NumLineas FROM orderdetails
GROUP BY orderID
HAVING COUNT(*) > 4;

-- Sacar un listado con el número de pedidos por cliente con más de 10 pedidos
SELECT CustomerID, COUNT(*) AS NumPedidos FROM orders
GROUP BY CustomerID
HAVING COUNT(*) > 10;

-- Ordenar el anterior listado de forma descendente
SELECT CustomerID, COUNT(*) AS NumPedidos FROM orders
GROUP BY CustomerID
HAVING COUNT(*) > 10
ORDER BY CustomerID DESC;


-- **************
-- Sacar un listado de todos los nombres de los proveedores en mayúsculas
SELECT UPPER(ContactName) AS NombreProveedorEnMayusculas
FROM suppliers;

-- Obtener el mismo listado en mínúsculas
SELECT LOWER(ContactName) AS NombreProveedorEnMinusculas
FROM suppliers;

-- Obtener el Apellido de los empleados y una columna con el número de caracteres de dicho empleados
SELECT LastName, LENGTH(LastName) AS NumCaracteres
FROM Employees;

-- Obtener un listado de los nombres de todos productos junto a una columna que muestre los primeros 3 caracteres de dicho nombre
SELECT ProductName, LEFT(ProductName, 3) AS PrimerosTresCaracteres
FROM Products;

-- Sacar un listado las fechas de pedidos y junto a ella una columna que se le haya añadido 10 días a esta fecha 


-- En NorthWind están muy preocupados por el retraso que están sufriendo los pedidos, por tanto el CEO quiere saber el tiempo que toma cada pedido y qué empleado lo ha atendido


-- Sacar un listado de los pedidos junto con el día de la semana que se hicieron (nota si queremos que la BBDD nos de los resultados de estas funciones en español: SET lc_time_names = 'es_MX';) (ver https://dev.mysql.com/doc/refman/8.0/en/locale-support.html)


-- -- Obtener un listado de las cantidades pedidas por mes (agruparlas por mes y año)


-- Mostrar las órdenes de compra entre las fechas 01/01/1997 al 15/07/1997 
SELECT * FROM Orders WHERE OrderDate BETWEEN '1997-01-01' AND '1997-07-15';

-- Mostrar las órdenes de compra hechas en el año 1997, que pertenecen a los empleados con códigos 1 ,3 ,4 ,8


-- El CEO quiere hacer un estudio de cómo influyen las edades de los empleados con sus ventas. Nos pide sacar un listado con los siguientes datos nombreEmpleado, edad, ventas