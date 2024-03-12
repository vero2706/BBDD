use vehiculos;
-- Modelos de vehículos TDI
select * from coches where modelo like '%TDI%';
-- Modelos de la marca 'Audi' y de la marca 'Seat' ordenado por Marca y Modelo.
select * from coches where marca like '%Audi%' or marca like'%Seat%' order by marca, modelo; 
-- Marcas de Vehículos que empiecen por T y terminen en a.
select * from coches where marca like 'T%a_';
-- Vehículos que tengan foto.
select * from coches where imagen not like '';
-- El consumo de los vehículos está expresado en litros/1OOkm. Listar el consumo de los vehículos 'Seat' en MPG, Millas por galón (10 MPG=23.52 l/1OOkm).
select modelo, (consumo*10/23.52) from coches where marca like '%Seat%';
/* Mostrar los vehículos, ordenados por consumo, que cumplan que tienen un consumo menor de 4, sus emisiones son menores que 110, que no tengan imagen y que no sean de la marca Volkswagen*/
select *, case when emisiones <110 then 'poco contaminante' WHEN emisiones >110 AND emisiones <150 THEN 'bastante contaminante' else 'ATENTADO ECOLOGICO' END AS ESTADO from coches;
-- Crear una consulta cualquier limitando el número de registros.
select * from coches where marca like '%opel%' limit 3;
-- Modifica la sentencia anterior para que salga un número de registros a partir de un número de registros especificado.
select * from coches where marca like '%opel%' limit 3,2; -- devuelve 2 registros a partir del 3º.
-- Los datos de los vehículos cuyo consumo sea menor que el consumo del coche con ID 25
select consumo from coches where id = 25;
select *  from coches where consumo < (select consumo from coches where id = 25);
-- Los datos de los vehículos cuyas emisiones sea mayor o igual que las emisiones del vehículo con ID 25 y al mismo tiempo cuyo consumo sea menor que 6
select *  from coches where consumo >= (select consumo from coches where id = 25) and consumo < 6;
-- Muestra el coche que más contamina
select * from coches where emisiones >= all (select emisiones from coches);
-- Muestra el coche con el mínimo consumo
select * from coches where emisiones <= all (select emisiones from coches);
-- Muestra si el coche con el ID 53 tiene un consumo mayor que el que tienen los coches con unas emisiones mayores 150