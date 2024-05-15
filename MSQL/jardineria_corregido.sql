use jardineria;
select * from oficinas;
# La ciudad y el teléfono de las oficinas de Estados Unidos.
select ciudad, telefono from oficinas where pais like 'EEUU';
#El nombre, los apellidos y el email de los empleados a cargo de Alberto Soria.
select * from empleados;
select nombre, apellido1, apellido2, email from empleados where codigoJefe=(select codigoEmpleado from empleados where nombre like 'Alberto' and apellido1 like 'Soria');
#el cargo, nombre, apellidos y email del jefe de la empresa.
select puesto, nombre, apellido1, apellido2, email from empleados where puesto like 'Director General';
# El nombre, apellidos y cargo de aquellos que no sean representantes de ventas.
select nombre, apellido1, apellido2, puesto from empleados where puesto not like 'Representante Ventas';
#El nombre de los clientes españoles.
select * from clientes;
select nombreCliente from clientes where pais like 'España' or pais like 'Spain';
#El código de empleado y el número de clientes al que atiende cada representante de ventas.
select * from clientes;
select codigoEmpleadoRepVentas, count(*) as num_clientes from clientes group by codigoEmpleadoRepVentas;
#Cuál fue el primer y último pago que hizo algún cliente.
select * from pagos;
select * from pagos where FechaPago <= all (select fechaPago from pagos);
select * from pagos where FechaPago >= all (select fechaPago from pagos);
#El código de cliente de aquellos clientes que hicieron pagos en 2008.
select codigoCliente from pagos where fechaPago between '2008-01-01' and '2008-12-31';
select codigoCliente from pagos where fechaPago like '2008%';
#os distintos estados por los que puede pasar un pedido.
select* from pedidos;
select distinct estado from pedidos;
#El número de pedido, código de cliente, fecha requerida y fecha de entrega de los pedidos que no han sido entregados a tiempo.
select * from pedidos;
select codigoPedido, codigoCliente, fechaEsperada, fechaEntrega from pedidos where estado like 'pendiente';


