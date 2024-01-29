-- Realizar los siguientes cambios sobre las tablas
/* Borra la clave foránea del campo nombre_hotel de la tabla habitaciones. 
Te tendrás que valer del comando show create table nombre_tabla para saber cuál es el nombre 
del índice.*/
use practicaobligatoria;
ALTER TABLE habitaciones 
DROP FOREIGN KEY habitaciones_ibfk_1;
describe habitaciones;

--  Borrar el campo nombre de hotel de la tabla habitaciones.
ALTER TABLE habitaciones  DROP COLUMN nombre_hotel;

--  Elimina el campo nombre de hotel.
ALTER TABLE hoteles
drop column Nombre;

/* Añadir un campo entero en la tabla hoteles que se llame id_hotel que vaya en primer 
lugar y que sea clave primaria y que sea autoincrement.*/
ALTER TABLE hoteles
ADD COLUMN id_hotel INT AUTO_INCREMENT PRIMARY KEY FIRST;

--  Crear un campo id_hotel entero en la tabla habitaciones.
ALTER TABLE habitaciones
ADD COLUMN id_hotel INT;

/* Borrar el campo id_habitacion en la tabla habitaciones. para ello habrá que borrar 
previamente el campo id_habitacion en la tabla reservas. Antes habrá que borrar la FK*/
show create table reservas;
ALTER TABLE reservas
DROP FOREIGN KEY reservas_ibfk_1;
-- primero se borra la clave foranea de la q depende 
ALTER TABLE reservas
DROP COLUMN id_habitacion;

ALTER TABLE habitaciones
DROP COLUMN id_habitacion;

--  Cambiar el campo fecha de la tabla reservas por el nombre fecha_reserva
ALTER TABLE reservas
CHANGE COLUMN fecha fecha_reserva DATE;

--  Establecer como clave primaria de la tabla habitaciones el (id_hotel,numero,planta)
ALTER TABLE habitaciones
ADD PRIMARY KEY (id_hotel, numero, planta); -- todos en uno o se duplicaria la clave

--  Añadir una nueva foreign key id_hotel en la tabla habitaciones que haga referencia a la clave primaria de la tabla hoteles.

ALTER TABLE habitaciones
add FOREIGN KEY (id_hotel) REFERENCES hoteles(id_hotel);

--  Renombrar la tabla reserva_cliente por reservas_habitaciones_cliente.
RENAME TABLE reserva_cliente TO reservas_habitaciones_cliente;

--  Crear tres nuevas columnas planta, numero e id_hotel enteros en la tabla reservas. 
ALTER TABLE reservas
ADD COLUMN planta INT,
ADD COLUMN numero INT,
ADD COLUMN id_hotel INT;

--  Eliminar la columna id_reservas de la tabla reservas para esto habrá que eliminar las claves foráneas de la tabla reservas_habitaciones_cliente.
show create table reservas_habitaciones_cliente;
alter TABLE reservas_habitaciones_cliente
DROP FOREIGN KEY reservas_habitaciones_cliente_ibfk_1;
alter TABLE reservas_habitaciones_cliente
DROP FOREIGN KEY reservas_habitaciones_cliente_ibfk_2;

ALTER TABLE reservas
DROP COLUMN id_reserva;
 
--  Establecer como nueva clave primaria de la tabla reserva (numero, planta, id_hotel)
ALTER TABLE reservas 
ADD PRIMARY KEY (numero, planta, id_hotel);

-- Establecer como nueva clave foránea de la tabla reserva (numero, planta, id_hotel) que hacen referencia a la tabla habitaciones.
ALTER TABLE reservas
ADD CONSTRAINT fk_reserva_habitaciones
FOREIGN KEY (id_hotel, numero, planta)
REFERENCES habitaciones(id_hotel, numero, planta);

-- Borrar la clave primaria de la tabla reservas_habitaciones_cliente tendrás que borrar la clave foránea de la tabla reservas_habitaciones_cliente ;
show create table reservas_habitaciones_cliente;
ALTER TABLE reservas_habitaciones_cliente
DROP FOREIGN KEY reservas_habitaciones_cliente_ibfk_2;

ALTER TABLE reservas_habitaciones_cliente
DROP PRIMARY KEY;

-- Crear cuatro nuevos campos en la tabla reservas_habitaciones_cliente serán enteros y son numero, planta, id_hotel, fecha (tipo fecha);
ALTER TABLE reservas_habitaciones_cliente
ADD COLUMN numero INT,
ADD COLUMN planta INT,
ADD COLUMN id_hotel INT,
ADD COLUMN fecha DATE;

-- Establecer como clave primaria de la tabla reservas_habitaciones_cliente los campos número, planta, id_hotel, fecha, dni_cliente.
ALTER TABLE reservas_habitaciones_cliente
ADD PRIMARY KEY (numero, planta, id_hotel, fecha, dni_cliente);
describe reservas_habitaciones_cliente;

-- Establecer en reservas_habitaciones_cliente como claves foráneas:
-- .dni_cliente, que hace referencia a la tabla clientes
-- .número, planta, id_hotel, fecha_reserva que hacen referencia a la tabla reservas*/

ALTER TABLE reservas_habitaciones_cliente
add FOREIGN KEY (dni_cliente) REFERENCES clientes(dni_cli);

alter table reservas
ADD FOREIGN KEY (numero, planta, id_hotel, fecha_reserva) 
REFERENCES reservas;

-- Añadir un comentario a todas las tablas acerca de la información que guardan
ALTER TABLE hoteles comment "INFORMACIÓN DE LOS HOTELES";
ALTER TABLE habitaciones comment "INFORMACIÓN DE LAS HABITACIONES";
ALTER TABLE clientes comment "INFORMACIÓN DE LOS CLIENTES";
ALTER TABLE reservas comment "INFORMACIÓN DE LOS RESERVAS";
ALTER TABLE reserva_cliente comment "INFORMACIÓN DE LAS RESERVAS_CLIENTES";

