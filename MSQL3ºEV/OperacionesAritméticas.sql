-- 1. Aumentar un 10% el precio de todos los productos

-- Para que te permita hacer updates sin where Edit > preferences ...> SQL Editor > Desmarcar "Safe Updates"
update products set UnitPrice = UnitPrice * 1.1;

select ProductName, UnitPrice, (UnitPrice * 1.1) as PrecioInflado from products;

select ProductName, UnitPrice, ROUND((UnitPrice * 1.1), 2) as PrecioInflado from products;

select UnitPrice, UnitPrice * 1.1 as precioAumentado from products;

-- 2. Aumentar el precio un 15% de los productos con la categoría de quesos (cheeses)

update products set UnitPrice = UnitPrice * 1.15 where categoryID = 4;

select ProductName, UnitPrice, (UnitPrice * 1.15 ) as PrecioInflado from products where categoryID = 4;

select UnitPrice, UnitPrice * 1.15 as precioAumentado from products p inner join categories c on p.CategoryID = c.CategoryID  
where c.Description like 'Cheeses';

-- 3. Cómo hacer el update anterior si no supiéramos el id de la categoría

update products set UnitPrice = unitPrice * 1.15 where categoryId = (select categoryID from categories where Description = 'cheeses');

select p.ProductName, p.UnitPrice, (UnitPrice * 1.15 ) as PrecioInflado, p.categoryID from products p , categories c 
where p.categoryID = (select categoryID from categories where Description = 'cheeses');

select p.ProductName, p.UnitPrice, (UnitPrice * 1.15 ) as PrecioInflado, c.Description from products p INNER JOIN categories c on p.categoryID=c.CategoryID 
where c.Description like 'Cheeses';

select productName, UnitsInStock * UnitPrice from products;

-- 4. Sacar un listado con la cantidad de dinero que tenemos en stock de cada producto. (Que se vea el nombre del producto y el Dinero invertido en stock)

SELECT ProductName, (UnitPrice * UnitsInStock) as DineroStock FROM products;

-- 5. Sacar un informe que nos muestre un listado de pedidos con el nombre del cliente y lo que se ha gastado en el pedido (quantity * unitPrice) - Discount.

select o.OrderID, c.ContactName, SUM((quantity * unitPrice) - Discount) as GastadoEnPedido from orderdetails od, orders o, customers c
where c.CustomerID = o.CustomerID AND o.OrderID = od.OrderID group by o.OrderID;

select o.OrderID, c.ContactName, SUM((quantity * unitPrice) - Discount) as GastadoEnPedido
from orderdetails od INNER JOIN orders o on o.OrderID = od.OrderID INNER JOIN customers c on c.CustomerID = o.CustomerID group by o.OrderID;

-- 6. Sacar un informe que nos muestre un listado de pedidos con el nombre del cliente, el nombre del producto comprado y lo que se ha gastado en el pedido (quantity * unitPrice) - Discount.  

select o.OrderID, c.ContactName, p.ProductName, (od.quantity * od.unitPrice) - od.Discount as GastadoEnPedido from orderdetails od, orders o, customers c, products p
where c.CustomerID = o.CustomerID AND o.OrderID = od.OrderID AND p.productId = od.productID;

select o.OrderID, c.ContactName, p.ProductName, (quantity * od.unitPrice) - Discount as GastadoEnPedido
from orderdetails od INNER JOIN orders o on o.OrderID = od.OrderID INNER JOIN customers c on c.CustomerID = o.CustomerID
INNER JOIN products p on p.productId = od.productID;

-- 7. Sacar una lista de productos por encima del precio medio (nota: para calcular la media, utilizar la función AVG).

-- Notas para resolverlo:
-- 1º tenemos que averiguar el precio medio (subselect)
-- 2º una vez obtenido hacer un where sencillo

SELECT DISTINCT ProductName, UnitPrice FROM Products
WHERE UnitPrice > (SELECT avg(UnitPrice) FROM Products)
ORDER BY UnitPrice;

SELECT avg(UnitPrice) FROM Products;

-- 8. Si el coste del flete (freight, coste de envío) es mayor o igual a  500$ ha de ser gravado con un 10%. Crear un informe en el que se muestre: 
-- El orderId, el coste del flete (freight) y el coste del flete con el impuesto para todos los pedidos (orders) de 500$ o más

Select orderID, Freight, Freight * 1.1 as ImpuestoEnvio from orders where Freight>=500;

-- Ejm 1. Obtener una lista de los pedidos que nos muestre el precio neto al que se ha vendido (precio - descuento)
use northwind;
select ProductID, (UnitPrice - Discount) as "Precio Neto" FROM orderdetails;

-- Ejm 2. Obtener el tanto por ciento del descuento que se le aplica a cada pedido
use northwind;
select OrderID, (Discount / UnitPrice) * 100 as TantoPorCiento from orderdetails;

-- Añadir al anterior listado el nombre del producto.

select  p.ProductName, o.OrderID, (o.Discount / o.UnitPrice) * 100 as TantoPorCiento from orderdetails o , products p
where o.productID = p.productID;

-- Ejm 3. seleccionar  el nombre de todos los productos, su precio asociado actual y el precio aumentado un 10% (fórmula precio * 1,10)

select ProductName, UnitPrice, (UnitPrice * 1.1 ) as PrecioInflado from products;