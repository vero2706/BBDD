-- 1--Sacar un listado de los proveedores y el número de productos que nos suministra cada uno

SELECT SupplierID, count(ProductID) as numeroProductos from Products 
group by SupplierID;

-- 2-- Sacar un listado de los nombres de los barcos y cuantas veces los hemos utilizado para llevar a cabo envíos

SELECT ShipName, count(OrderID) as numeroDeVeces from Orders
group by ShipName;

-- 3-- contar el numero de empleados que hay por ciudad 

SELECT City, COUNT(EmployeeID) as NumeroEmpleados FROM Employees
GROUP BY City;

-- 4-- Sacar un listado de los puestos de trabajo (title) por ciudad

SELECT Title, city, COUNT(*) FROM Employees
group by Title, city;
 
-- Nota: observad la diferencia entre agrupar por título y agrupar por título y ciudad

-- 5-- Sacar un listado de cuantos pedidos se envían a cada país.

SELECT ShipCountry, COUNT(OrderID) FROM orders group by ShipCountry;

-- 6-- Sacar un listado de cuantos pedidos se envían a cada ciudad

SELECT ShipCity, COUNT(OrderID) FROM orders group by ShipCity;

-- 7-- Sacar un listado de fechas  y cuantos pedidos se han hecho en cada fecha (orderdate)
SELECT OrderDate, COUNT(OrderID) as NumOrders FROM Orders 
GROUP BY OrderDate;

-- 8-- sacar un listado con el número de pedidos que se hacen a cada proveedor (supplier)
SELECT SupplierID, COUNT(OrderID) as NumOrders FROM Products
GROUP BY SupplierID;

-- 9-- sacar un listado con el número de pedidos que ha hecho cada empleado (sacar el listado con el formato nombre empleado - número pedidos)
SELECT p.SupplierID, COUNT(OrderID) as NumeroDePedidosProveedor from products p inner join orderdetails od
on od.productID =p.productID
group by p.SupplierID;

-- 10-- Sacar un listado del número de productos que tienen el mismo precio
SELECT UnitPrice, COUNT(ProductID) as NumProducts FROM Products
GROUP BY UnitPrice;

-- 11-- Sacar un listado con el número de proveedores por país
SELECT Country, COUNT(SupplierID) as NumSuppliers FROM Suppliers
GROUP BY Country;

-- 12-- Hacer un listado del número de pedidos por fecha
SELECT OrderDate, COUNT(OrderID) as NumOrders FROM Orders
GROUP BY OrderDate;

-- 13-- Hacer un listado de las cantidades que se han vendido de cada producto

SELECT productID, SUM(quantity) as CantidadesVendidas
FROM orderdetails
GROUP BY productoID;

-- 14-- Obtener un listado de la cantidad de productos que nos suministra cada proveedor diferenciando por categoría

SELECT SupplierID, CategoryID, count(productID) as productoPorProveedor 
from products
group by SupplierID, CategoryID;

-- 15-- Listar las categorías de productos incluyendo el número de productos en stock en cada categoría.

SELECT c.CategoryID, c.CategoryName, SUM(UnitsInStock) as unidadesDeCategoria
from categories c inner join products p
on p.CategoryID =c.CategoryID
GROUP BY c.CategoryID, c.CategoryName; 

-- 16-- Obtener un listado de las cantidades vendidas a cada cliente especificando a su vez por categorías (más adelante)
-- 17 -- Sacar un listado el la suma de los fletes (freigth) gastados en cada transportista
SELECT ShipperID, SUM(Freight) as TotalFreight FROM Orders
GROUP BY ShipperID;
