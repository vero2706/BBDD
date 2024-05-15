-- En esta práctica modificaremos datos de la BBDD instituto (práctica número 2) con la sentencia UPDATE.
use instituto;

-- 1. Cambia la descripción del tipo de asignatura 'Libre_configuración' por 'De libre configuración'
UPDATE tipo_asignatura SET descripcion = 'De libre configuración'
WHERE descripcion = 'Libre_configuración';

select * from asignaturas;
-- 2. Juan Francisco ya no cursa 'Desarrollo en entorno servidor', ha cambiado de asignatura a 'Programación'

UPDATE cursa_asignaturas 
-- indica q se va a actualizar 'cursa_asignaturas'
SET id_asignatura = (SELECT id_asignatura FROM asignaturas WHERE descripcion = 'Programación')
-- Esta sentencia asigna el 'id_asignatur que corresponde a la asignatura de programación a la columna id_asignatura
WHERE dni_alumno = 'Juan Francisco' AND id_asignatura = (SELECT id_asignatura FROM asignaturas WHERE descripcion = 'Desarrollo en entorno servidor');
-- busca filas en una tabla donde el DNI del alumno sea 'Juan Francisco' y la asignatura esté descrita como 'Desarrollo en entorno servidor'.

/* 3. Introducir un nueva asignatura llamada 'Tutoría'. 
	Cambiar la asignatura 'Redes 1' por 'Tutoría' del alumno con el dni '82434905I'*/
    
INSERT INTO asignaturas (nombre) VALUES ('Tutoría');
UPDATE cursa_asignatura
SET id_asignatura = (SELECT id_asignatura FROM asignaturas WHERE descripcion = 'Tutoría')
WHERE dni_alumno = '82434905I' AND id_asignatura = (SELECT id_asignatura FROM asignaturas WHERE descripcion = 'Redes 1');

-- 4. Asignar a todas las asignaturas 6 horas, excepto a programación que tiene 8 horas y tutoría que tiene 1
UPDATE asignaturas 
SET horas = 6;
UPDATE asignaturas 
SET horas = 8 where nombre like programacion;
UPDATE asignaturas 
SET horas = 1 where nombre like tutoria;

-- 5. Asignar la categoría 'C' a todos los alumnos que no tengan la asignatura de 'Redes 2'
update alumnos set categoria = 'C' where
dni_alumno = any(select dni_alumno from cursa_asignaturas 
inner join asignaturas on cursa_asignaturas.id_asignatura = asignaturas.id_asignatura 
where nombre != '%Redes 2%');

-- 6. Modificar las asignaturas 'Tutoría' y 'Redes 2' como asignaturas Obligatorias
update asignaturas set tipo = (select tipo from tipo_asignatura 
where descripcion like '%Obligatoria%')
WHERE (nombre like '%Tuto%' or nombre like '%Redes 2%');

-- 7. Poner como delegada a Ana Bravo a todos los alumnos.
update alumnos set dni_delegado = (select dni_alumno from alumnos where nombre like '%Ana Bravo%') 
where nombre not like '%Ana Bravo%';
update alumnos set dni_delegado = (select dni_alumno from alumnos where nombre like '%Ana Bravo%');

# En algunos SGBD, falla la sentencia anterior porque no considera que se pueda hacer una subselect de la misma tabla de la que se quieren borrar tuplas
# Para evitarlo, se puede hacer una especie de "truco" que que consiste en añadir una select más que realmente no hace nada. Ej:
update alumnos set dni_delegado = (select * from (select dni_alumno from alumnos where nombre like '%Ana Bravo%') as X) where nombre not like '%Ana Bravo%';

update alumnos set dni_delegado = 
(select * from (select dni_alumno from alumnos where nombre like '%Ana Bravo%') as x);
# No aprender este truco, con la primera sentencia sería suficiente.

-- 8. Borrar a todos los alumnos que tengan más de 25 años
select * from alumnos where edad > 25;
DELETE FROM alumnos WHERE edad > 25;

select * from alumnos;
select * from cursa_asignaturas;
show create table alumnos;
show create table cursa_asignaturas;
# Si nos fijamos en el alumno que tenía más de 25 años, ya no aparece. ¿Qué ha pasado con las asignaturas que tenía ese alumno?
# Si observamos cómo fueron creadas las tablas (con show create table xxxx), observamos que las restricciones están puestas 
# en cascada, por lo que si se borra el alumno, se borran todos los registros que tienen asociados.


-- 9. Borrar todos los datos de la tabla auxiliar per1
DELETE FROM per1;
-- drop table per1;   Si quisiéramos borrar toda la tabla

-- 10. Borrar de cursa_asignaturas que tiene el dni '27965528X'
-- Borrar de cursa_asignaturas el alumno que tiene el dni '27965528X'
DELETE FROM cursa_asignaturas WHERE dni_alumno like '27965528X';

# Si observamos las tablas, vemos que el alumno no se ha borrado, pero se han borrado todos los registros del resto de tablas que tiene que ver con ese alumno
select * from alumnos;
select * from cursa_asignaturas;

-- 11. Borra todos los alumnos que tengan alguna asignatura cuya descripción sea 'Obligatoria'

DELETE FROM alumnos WHERE dni_alumno = ANY(SELECT a.dni_alumno FROM alumnos as a
	INNER JOIN cursa_asignaturas as cursa ON a.dni_alumno = cursa.dni_alumno
	INNER JOIN asignaturas as asi ON asi.id_asignatura = cursa.id_asignatura
	INNER JOIN tipo_asignatura as tipo ON tipo.tipo = asi.tipo
	WHERE descripcion like 'Obligatoria'
	);

# Se borran 6 alumnos que han sido devueltos por la subselect. Es importante 
-- usar ANY porque queremos que el dni a borrar coincida con cualquiera de los valores devueltos


















Juan Francisco ya no cursa 'Desarrollo en entorno servidor', ha cambiado de asignatura a 'Programación':
sql
Copy code
UPDATE cursa_asignaturas
SET id_asignatura = (SELECT id_asignatura FROM asignaturas WHERE descripcion = 'Programación')
WHERE dni_alumno = 'Juan Francisco' AND id_asignatura = (SELECT id_asignatura FROM asignaturas WHERE descripcion = 'Desarrollo en entorno servidor');
Introducir una nueva asignatura llamada 'Tutoría':
sql
Copy code
INSERT INTO asignaturas (descripcion, tipo_asignatura, horas_semana)
VALUES ('Tutoría', 'Obligatoria', 1);
Cambiar la asignatura 'Redes 1' por 'Tutoría' del alumno con el dni '82434905I':
sql
Copy code
UPDATE cursa_asignaturas
SET id_asignatura = (SELECT id_asignatura FROM asignaturas WHERE descripcion = 'Tutoría')
WHERE dni_alumno = '82434905I' AND id_asignatura = (SELECT id_asignatura FROM asignaturas WHERE descripcion = 'Redes 1');
Asignar a todas las asignaturas 6 horas, excepto a Programación que tiene 8 horas y Tutoría que tiene 1:
sql
Copy code
UPDATE asignaturas
SET horas_semana = 
CASE
    WHEN descripcion = 'Programación' THEN 8
    WHEN descripcion = 'Tutoría' THEN 1
    ELSE 6
END;
Asignar la categoría 'C' a todos los alumnos que no tengan la asignatura 'Redes 2':
sql
Copy code
UPDATE alumnos
SET categoria = 'C'
WHERE dni NOT IN (
    SELECT dni_alumno
    FROM cursa_asignaturas
    WHERE id_asignatura = (SELECT id_asignatura FROM asignaturas WHERE descripcion = 'Redes 2')
);
Modificar las asignaturas 'Tutoría' y 'Redes 2' como asignaturas Obligatorias:
sql
Copy code
UPDATE asignaturas
SET tipo_asignatura = 'Obligatoria'
WHERE descripcion IN ('Tutoría', 'Redes 2');
Poner como delegada a Ana Bravo a todos los alumnos:
sql
Copy code
UPDATE alumnos
SET delegado = 'Ana Bravo';
Borrar a todos los alumnos que tengan más de 25 años:
sql
Copy code
DELETE FROM alumnos
WHERE TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) > 25;
Borrar todos los datos de la tabla auxiliar per1:
sql
Copy code
DELETE FROM per1;
Borrar de cursa_asignaturas que tiene el dni '27965528X':
sql
Copy code
DELETE FROM cursa_asignaturas
WHERE dni_alumno = '27965528X';
Borrar todos los alumnos que tengan alguna asignatura cuya descripción sea 'Obligatoria':
sql
Copy code
DELETE FROM alumnos
WHERE dni IN (
    SELECT DISTINCT c.dni_alumno
    FROM cursa_asignaturas c
    JOIN asignaturas a ON c.id_asignatura = a.id_asignatura
    WHERE a.tipo_asignatura = 'Obligatoria'
);