use jardineria;

-- 1. La ciudad y el teléfono de las oficinas de Estados Unidos.
select Ciudad, Telefono from oficinas where Pais like 'EEUU';

-- 2. El nombre, los apellidos y el email de los empleados a cargo de Alberto Soria.
select Nombre, Apellido1, Apellido2, Email from empleados where 
    CodigoJefe = (select CodigoEmpleado from empleados where Nombre like 'Alberto' and Apellido1 like 'Soria' );

--  3. El cargo, nombre, apellidos y email del jefe de la empresa.
select Puesto, Nombre, Apellido1, Apellido2, Email from empleados where CodigoJefe is null;

select * from empleados;

-- 4. El nombre, apellidos y cargo de aquellos que no sean representantes de ventas.
select Nombre, Apellido1, Apellido2, Puesto from empleados where Puesto not like 'Representante Ventas%';

--  5. El nombre de los clientes españoles.
select NombreCliente from clientes where (Pais like 'Spain%') or (Pais like 'España%');

select * from Clientes;

-- 6. El código de empleado y el número de clientes al que atiende cada representante de ventas.
select CodigoEmpleadoRepVentas, count(*) as num_clientes from clientes group by CodigoEmpleadoRepVentas;

-- Si queremos mostrar el nombre del empleado, necesitamos dos tablas
SELECT e.Nombre, count(c.codigocliente) as NumeroClientes FROM clientes c, empleados e WHERE e.CodigoEmpleado=c.CodigoEmpleadoRepVentas GROUP BY e.Nombre;

Select Nombre, grupo_clientes.numCliente from empleados, (Select CodigoEmpleadoRepVentas, count(*) as numCliente from clientes group by CodigoEmpleadoRepVentas) as grupo_clientes where CodigoEmpleado=grupo_clientes.CodigoEmpleadoRepVentas order by CodigoEmpleado;

-- 7. Cuál fue el primer y último pago que hizo algún cliente.
select * from pagos where 
	FechaPago >= all(select FechaPago from pagos) 
	or FechaPago <= all(select FechaPago from pagos);

-- Mostrar el primer y último pago de cada cliente
SELECT c.nombrecliente, Min(p.fechapago) as Primer_pago, Max(p.fechapago) as Ultimo_pago FROM pagos p, clientes c WHERE p.codigocliente=c.codigocliente GROUP BY c.nombrecliente; 

-- 8. El código de cliente de aquellos clientes que hicieron pagos en 2008.
select CodigoCliente from pagos where FechaPago > '2007-12-31' and FechaPago < '2009-01-01';
select CodigoCliente from pagos where FechaPago between '2007-12-31' and '2009-01-01';
select CodigoCliente from pagos where FechaPago like '%2008%'; -- Otra forma de realizar la consulta


-- 9. Los distintos estados por los que puede pasar un pedido.
select distinct Estado from pedidos;

-- 10. El número de pedido, código de cliente, fecha requerida y fecha de entrega de los pedidos que no han sido entregados a tiempo.
select CodigoPedido, CodigoCliente,  FechaEsperada, FechaEntrega from pedidos 
	where FechaEntrega > FechaEsperada;

-- Si queremos mostrar el nombre del cliente, tenemos los datos en dos tablas, podemos hacer un JOIN
SELECT c.NombreCliente, p.CodigoPedido, p.fechaesperada, p.fechaentrega FROM clientes c inner join pedidos p on c.codigocliente=p.codigocliente WHERE p.fechaentrega > p.fechaesperada;