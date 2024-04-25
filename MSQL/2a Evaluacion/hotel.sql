-- Seleccionar todas las habitaciones del hotel 1
select * from habitaciones where id_hotel = 1;
-- eleccionar todos los empleados que se encuentran en la habitación 1 de ese hotel.
select * from empleado where id_hotel = 1 and id_habitacion = 1;
-- Modificar esa habitación para que ahora sea la habitación 4 del hotel 3
update habitaciones set id_hotel=3, id_habitacion=4 where id_hotel=1 and id_habitacion=1;
commit;
-- Volver a mostrar los empleados de la habitación 1 del hotel 1
select * from empleado where id_hotel=1 and id_habitacion=1;
-- Seleccionar los empleados con los DNI que habíamos copiado anteriormente.
select * from empleado where dni IN ('123456k', '123459k','1234563k');
-- Borrar la habitación 4 del hotel 3.
delete from habitaciones where id_habitaciones=4 and id_hotel=3;
select * from habitaciones;