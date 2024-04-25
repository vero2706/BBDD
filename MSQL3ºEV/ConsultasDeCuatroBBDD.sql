-- BANCOS

-- 1. Contar el número total de cajeros automáticos por banco
SELECT bank_id, COUNT(atm_id) AS totalCajeros
FROM atms
GROUP BY bank_id;


-- 2. Calcular el saldo promedio de todas las cuentas en cada banco
SELECT bank_id, AVG(balance) AS SaldoPromedio
FROM accounts
GROUP BY bank_id;


-- 3. Identificar el banco con el mayor número de cuentas
SELECT bank_id, COUNT(*) AS NumCuentas
FROM accounts
GROUP BY bank_id
order by count(*) desc;


-- 4. Mostrar el numero de clientes en cada banco
SELECT bank_id, COUNT(*) AS NumClientes 
FROM users u inner join accounts a on u.user_id = a.user_id 
GROUP BY bank_id;


-- 5. Saldo mínimo, máximo y promedio por cliente
SELECT user_id, 
MIN(balance) AS SaldoMinimo, 
MAX(balance) AS SaldoMaximo
FROM accounts
GROUP BY user_id;

-- ---------------------------------------------------------------------------------

-- COCHES CLÁSICOS

-- 1. Cantidad total de productos en stock por línea de producto
SELECT productLine, SUM(quantityInStock) AS totalStock
FROM Products
GROUP BY productLine;


-- 2. Muestra el promedio de productos por pedido
SELECT AVG(quantityOrdered) AS cantidadPromedio
FROM OrderDetails;


-- 3. Cuenta la cantidad de pedidos realizados por año.
SELECT YEAR(orderDate) AS year, COUNT(*) AS numDePedidos
FROM Orders
GROUP BY YEAR(orderDate);


-- 4. Cantidad de empleados por ciudad
SELECT o.city, COUNT(*) AS numEmpleados
FROM Offices o INNER JOIN Employees e 
ON o.officeCode = e.officeCode
GROUP BY o.city;


-- 5. Busca todas las ordenes realizadas en el año 2005 y ordenalas en orden ascendente

SELECT orderNumber, orderDate
FROM Orders
WHERE YEAR(orderDate) = 2005
ORDER BY orderDate ASC;


-- ---------------------------------------------------------------------------------------

-- LIBRERÍA

--  1. Cantidad total de ventas por empleado
SELECT idempleado, COUNT(*) AS totalVentas
FROM venta
GROUP BY idempleado;


-- 2. Fecha de la primera venta de cada empleado
SELECT idempleado, MIN(fecha) AS primeraVenta
FROM venta
GROUP BY idempleado;


-- 3. Stock de publicaciones por tipo
SELECT idtipo, SUM(stock) AS totalStock
FROM publicacion 
GROUP BY idtipo;


-- 4. Empleado con más ventas hechas
SELECT idempleado, COUNT(*) AS totalDeVentas
FROM venta
GROUP BY idempleado
ORDER BY totalDeVentas DESC LIMIT 1;


-- 5. Ventas realizadas por día
SELECT fecha, COUNT(*) AS ventas_por_dia
FROM venta
GROUP BY fecha;


-- -----------------------------------------------------------------------------

-- VIDEOCLUB

-- 1. Promedio de la longitud de las películas sin decimales
SELECT round(AVG(length),0) AS promedioLongitud FROM film;


-- 2. Total de Películas cuya categoría es "Comedy"
SELECT COUNT(*) AS cantidadComedia
FROM film_category fc
INNER JOIN category c ON fc.category_id = c.category_id
WHERE c.name like 'Comedy';


-- 3. Año de estreno más reciente de una película
SELECT MAX(release_year) AS estrenoReciente 
FROM film;


-- 4. Total de actores diferentes que han participado en películas
SELECT COUNT(DISTINCT actor_id) AS totalActores
FROM film_actor;


-- 5. total de peliculas por año 
SELECT release_year, COUNT(*) AS totalPeliculas
FROM film
GROUP BY release_year;



