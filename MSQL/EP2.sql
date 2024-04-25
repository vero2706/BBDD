-- 1. Selecciona los nombres de todos los productos de la tienda.
SELECT * FROM Products;
-- . Selecciona los nombres y los precios de todos los productos de la tienda.
SELECT Name, Price FROM Products;
-- 3. Selecciona el nombre de los productos con un precio menor o igual a $200.
SELECT Name FROM Products WHERE Price <= 200;
-- 4. Selecciona todos los productos con un precio entre $60 y $120.
SELECT * FROM Products WHERE Price BETWEEN 60 AND 120;
-- 5. Selecciona el nombre y el precio en centavos (es decir, el precio debe multiplicarse por 100).
SELECT Name, price * 100 FROM Products;
-- 6. Calcula el precio promedio de todos los productos.
SELECT avg(price) from Products;
-- 7. Calcula el precio promedio de todos los productos con código de fabricante igual a 2.
SELECT avg(price) from Products where Manufacturer = 2;
-- 8. Calcula el número de productos con un precio mayor o igual a $180.
SELECT COUNT(*) AS NumeroProductos FROM Products WHERE Price >= 180;
-- 9. Selecciona el nombre y el precio de todos los productos con un precio mayor o igual a $180 y ordena primero por precio (en orden descendente) y luego por nombre (en orden ascendente).
SELECT Name, price FROM Products where Price >= 180 order by price desc, name asc;
-- 10. Selecciona todos los datos de los productos, incluidos todos los datos del fabricante de cada producto.
SELECT * FROM Products p inner join Manufacturers m on p.Manufacturer= m.code;
-- 11. Selecciona el nombre del producto, el precio y el nombre del fabricante de todos los productos.
SELECT p.Name, price, m.name FROM Products p inner join Manufacturers m on p.Manufacturer= m.code;
-- 12. Selecciona el precio promedio de los productos de cada fabricante, mostrando solo el código del fabricante.
SELECT Manufacturer, AVG(Price) FROM Products GROUP BY Manufacturer;
-- 13. Selecciona el precio promedio de los productos de cada fabricante, mostrando el nombre del fabricante.
SELECT m.Name, AVG(Price) FROM Products p inner join Manufacturers m on p.Manufacturer= m.code  GROUP BY m.name;
-- 14. Selecciona los nombres de los fabricantes cuyos productos tienen un precio promedio mayor o igual a $150.
SELECT Manufacturers.Name FROM Products JOIN Manufacturers ON Products.Manufacturer = Manufacturers.Code GROUP BY Manufacturers.Name HAVING AVG(Price) >= 150;
-- 15. Selecciona el nombre y precio del producto más económico.
SELECT Name, Price FROM Products ORDER BY Price LIMIT 1;
-- 16. Selecciona el nombre de cada fabricante junto con el nombre y el precio de su producto más caro.


 -- 17. Selecciona el nombre de cada fabricante que tenga un precio promedio superior a $145 y contenga al menos 2 productos diferentes.
 -- Mostrar: nombre fabricante, precio promedio y artículos diferentes