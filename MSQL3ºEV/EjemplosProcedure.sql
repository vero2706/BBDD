/* Crea un procedimiento llamado: sumaClientesEmpleados(). Utiliza variables locales. 
Mostrará los resultados de la siguiente manera. 
Utiliza dos select (para obtener los datos) y una para mostrarlos*/
 
 DELIMITER //

CREATE PROCEDURE sumaClientesEmpleados()
BEGIN
    -- Declaración de variables locales
    DECLARE clientes, empleados INT;
    DECLARE total INT default 0;
    
    -- Obtener el número total de clientes
    SELECT COUNT(*) INTO clientes FROM clientes;
    
    -- Obtener el número total de empleados
    SELECT COUNT(*) INTO empleados FROM empleados;
    
    -- Mostrar los resultados
    SET total = clientes + empleados;
    SELECT total as 'SumaTotal', 
    -- tambien se puede poner: (clientes + empleados) as SumaTotal;
    clientes as 'TotalClientes',
    empleados as 'TotalEmpleados';
END //

DELIMITER ;
	-- Una vez creado el procedimiento almacenado, lo ejecutamos con la siguiente instrucción:
call sumaClientesEmpleados();

/* Crea un procedimiento almacenado llamado: muestraDatosProductos(). Utiliza variables locales. 
Mostrará los resultados de la siguiente manera: 
Utiliza una sola select para obtener los datos y una para mostrarlos
Filtra por PrecioVenta > 25 */

DELIMITER //

CREATE PROCEDURE muestraDatosProductos()
BEGIN
	-- Declaramos las variables
	DECLARE CantidadEnStock, 
    PrecioVenta, 
    PrecioProveedor, 
    Total int default 0;
    
	SELECT avg(CantidadEnStock), avg(PrecioVenta), avg(PrecioProveedor) 
    INTO mediaCantidadEnStock, mediaPrecioVenta, mediaPrecioProveedor FROM productos 
    WHERE PrecioVenta > 25;
    
    set Total = (CantidadEnStock + PrecioVenta + PrecioProveedor) / 3;
    select CantidadEnStock as 'Media de la CantidadEnStock',
    PrecioVenta as 'Media del PrecioVenta',
    PrecioProveedor as 'Media del PrecioProveedor',
    Total as 'Media de las tres anteriores variables';
END //

DELIMITER ; 

	-- Una vez creado el procedimiento almacenado, lo ejecutamos con la siguiente instrucción:
call muestraDatosProductos();

/* 
Crea un procedimiento almacenado llamado insertaTuplaYmuestra(). 
El procedimiento creará una nueva oficina con los siguientes datos:
'SAL-ES', 'Salamanca', 'España', 'OficinaEnSalamanca', '37001', '+34 923 20 21 22', 
'Paseo Canalejas', ''
Después mostrará todos los datos de todas las oficinas.
>> Si ejecutas dos veces el procedimiento, dará error porque ya existe la tupla de Salamanca. <<
*/

DELIMITER //

CREATE PROCEDURE insertaTuplaYmuestra()
BEGIN
   
-- Insertar nueva oficina
	INSERT INTO Oficinas 
	VALUES ('SAL-ES', 'Salamanca', 'España', 'OficinaEnSalamanca', '37001', '+34 923 20 21 22', 'Paseo Canalejas', '');

        -- Mostrar todas las oficinas
        SELECT * FROM Oficinas;
    
END //

DELIMITER ;

call insertaTuplaYmuestra();


/*
Crea un procedimiento llamado: consultaCompleja(). 
Mostrará los datos de todos los pagos que están asociados a la oficina cuya ciudad es Madrid 
(hacer join de varias tablas).*/

DELIMITER //

CREATE PROCEDURE consultaCompleja()
BEGIN
    SELECT p.CodigoCliente, p.FormaPago, p.IDTransaccion, p.FechaPago, p.Cantidad
    FROM Pagos p
    INNER JOIN Clientes c ON p.CodigoCliente = c.CodigoCliente
    INNER JOIN Empleados e ON c.CodigoEmpleadoRepVentas = e.CodigoEmpleado
    INNER JOIN Oficinas o ON e.CodigoOficina = o.CodigoOficina
    WHERE o.Ciudad = 'Madrid';
END //

DELIMITER ;

call consultaCompleja();



/*Añado contenido extra en la práctica para ver cómo se pueden mezclar variables de usuario y 
variables locales.
Set @prueba = 5;*/


DELIMITER //
CREATE PROCEDURE prueba()
BEGIN
	DECLARE local1 int default 5;
    set local1 = @prueba + local1;
    
	select local1;
END //

DELIMITER ; 

call prueba();