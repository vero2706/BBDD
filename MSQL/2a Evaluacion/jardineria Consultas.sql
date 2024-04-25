use jardineria;
select * from pagos;
select * from clientes;
select * from clientes NATURAL JOIN pagos;
/*Nombre del cliente, País, Fax y apellido del contacto de los clientes que han realizado pagos 
en el año 2008. Realizar sin JOIN, con INNER JOIN y con NATURAL JOIN.*/
/* sin JOIN*/
select c.NombreCliente, c.Pais, c.Fax, c.ApellidoContacto, p.FechaPago from clientes c, pagos p where c.CodigoCliente = p.CodigoCliente and FechaPago like '2008%';
/*INNER JOIN*/
select c.NombreCliente, c.Pais, c.Fax, c.ApellidoContacto from clientes c INNER JOIN pagos p ON c.CodigoCliente = p.CodigoCliente where FechaPago like '2008%';
/*NATURAL JOIN*/
select c.NombreCliente, c.Pais, c.Fax, c.ApellidoContacto from clientes c NATURAL JOIN pagos p where FechaPago like '2008%';

/*Listar todos los pedidos que realizó cada cliente. Realizar sin JOIN, con INNER JOIN y con NATURAL JOIN.*/
select * from clientes c, pedidos p where c.CodigoCliente = p.CodigoCliente;  
select * from clientes c INNER JOIN pedidos p ON c.CodigoCliente = p.CodigoCliente;
select * from clientes c NATURAL JOIN  pedidos p;

/* Nombre clientes y nombre de productos comprados. Realizar sin JOIN, con INNER JOIN y con NATURAL JOIN.*/
select c.NombreCliente, p.Nombre from clientes c, productos p, pedidos pe, detallePedidos de where c.CodigoCliente=pe.CodigoCliente and pe.CodigoPedido=de.CodigoPedido and de.CodigoProducto=p.CodigoProducto;
select c.NombreCliente from clientes c INNER JOIN pedidos pe on c.CodigoCliente=pe.CodigoCliente INNER JOIN detallePedidos de on pe.CodigoPedido=de.CodigoPedido 
INNER JOIN productos p on de.CodigoProducto=p.CodigoProducto;
select c.NombreCLiente, p.Nombre from clientes c NATURAL JOIN pedidos pe NATURAL JOIN detallePedidos NATURAL JOIN productos AS pr;
-- Seleccionar todos los pedidos que han realizado los clientes con el nombre 'Tendo%' Realizar la consulta con NATURAL JOIN e Inner Join
-- INNER JOIN
SELECT * FROM clientes INNER JOIN pedidos ON clientes.CodigoCliente = pedidos.CodigoCliente where clientes.NOmbreCliente like 'Tendo%';
-- NATURAL JOIN
SELECT * FROM clientes NATURAL JOIN pedidos where clientes.NOmbreCliente like 'Tendo%';

-- Realiza un CROSS JOIN para conocer el funcionamiento de este operador. Consulta todas las posibles combinaciones entre empleados y oficinas (tener en cuenta que no son combinaciones reales porque no se está teniendo en cuenta las tuplas relacionadas)
SELECT * FROM empleados CROSS JOIN oficinas;

-- El nombre, apellidos y cargo de aquellos que no sean representantes de ventas. 
SELECT Nombre, Apellido1, Apellido2, Puesto FROM empleados WHERE Puesto not like '%Representante Ventas%'; -- Se trata de consulta de una tabla

-- Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas y el código del cliente de la tabla pagos
SELECT c.NombreCliente, e.Nombre, p.CodigoCliente FROM 
	(clientes c INNER JOIN empleados e ON e.CodigoEmpleado = c.CodigoEmpleadoRepVentas) -- Unimos las dos tablas iniciales con un INNER JOIN, el resultado hacemos un left join para sacar tuplas de la tabla de la izquierda que cumplan que no tienen tuplas relacionadas en la tabla de la derecha
    left outer join pagos p ON c.CodigoCliente = p.CodigoCliente
    WHERE p.CodigoCliente is null; -- Si no ponemos esta condición salen los que tienen pagos y los que no tienen pagos.

-- Muestra el nombre de los empleados que no estén asociados a ningún cliente (hacer un right o left join)
SELECT * FROM clientes right outer join empleados ON clientes.CodigoEmpleadoRepVentas = empleados.CodigoEmpleado
	WHERE clientes.CodigoEmpleadoRepVentas IS NULL; -- Si no ponemos esta opción salen los que están asociados a clientes y los que no

-- Muestra todos los datos de clientes y pagos pero solo muestra los clientes que hayan realizado algún pago (hacer un right o left join)
SELECT * FROM clientes left outer join pagos ON clientes.CodigoCliente = pagos.CodigoCliente
	WHERE pagos.CodigoCliente IS NULL; -- Si no ponemos esta opción salen los que están asociados a clientes y los que no

-- Muestra los empleados cuyo jefe directo sea Alberto con una consulta reflexiva
SELECT * FROM empleados a inner join empleados b ON a.CodigoEmpleado = b.CodigoJefe
	WHERE a.Nombre like 'Alberto'; -- Se hace un join de las dos tablas indicando la PK-FK y la condición

-- Muestra el nombre de los clientes y su teléfono cuyos representantes de ventas sean Hilario y Lucio (con UNION)
SELECT c.NombreCliente, c.Telefono, e.Nombre FROM clientes c, empleados e 
	WHERE e.CodigoEmpleado = c.CodigoEmpleadoRepVentas AND e.Nombre like 'Mariano'
UNION
SELECT c.NombreCliente, c.Telefono, e.Nombre FROM clientes c, empleados e 
	WHERE e.CodigoEmpleado = c.CodigoEmpleadoRepVentas AND e.Nombre like 'Lucio';
    