-- A partir de la BBDD que creamos en la primera práctica, resuelve los siguientes ejercicios:

/*Crea una tabla llamada pruebaIndices con el nombre y el apellido de todos los empleados (CREATE TABLE pruebaIndices AS).  
Posteriormente añade con ALTER TABLE el índice llamado indiceNombre (índice del campo nombre)*/ 

CREATE TABLE pruebaIndices AS SELECT first_name, last_name from employees;
ALTER TABLE pruebaIndices ADD INDEX empleados(first_name, last_name);
show create table pruebaIndices;


/*Creemos que se van a realizar muchas ordenaciones por el campo hire_date. Antes de crear el índice, 
lanzar la consulta y comprobar el tiempo. Luego crear el índice y volver a ver el tiempo.*/

SELECT * FROM employees ORDER BY hire_date;
CREATE INDEX hire_date ON employees(hire_date);
select * from employees order by hire_dates;

/*Creemos que se van a realizar muchas búsquedas por los campos nombre y apellido. 
Lanzar una consulta que busque el nombre %ngqin% y el apellido %leis% y mirar el tiempo. 
Crear un índice compuesto en estos dos campos y volver a mirar el tiempo*/

SELECT * from employees where first_name like '%%' and last_name like '%%';
create index nombreApellidos on employees(first_name, last_name);
Select * from employees order by first_name;


/*Lanzar una consulta que cuente el número de personas en función del género y también muestre el género (group by). 
Después generar un índice en el género y volver a lanzar la consulta. Comprobar tiempos*/
SELECT genero, COUNT(*) AS cantidadPorGenero FROM personas GROUP BY genero;
 -- Crea un índice en la columna genero
CREATE INDEX idx_genero ON personas(genero);
 -- Vuelve a ejecutar la consulta original para contar el número de personas por género:
 SELECT genero, COUNT(*) AS cantidadPorGenero FROM personas GROUP BY genero;


