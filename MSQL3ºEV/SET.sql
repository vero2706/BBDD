SET @VERO = NULL;
SET @conexiones = 0;

SELECT USER, count(*) INTO @VERO, @conexiones FROM INFORMACION_ESQUEMA.processlist
GROUP BY USER LIMIT 1;
SELECT @VERO, @conexiones;

-- --------------------------------------------------------------------------------------------

use employees;

call muestra_empleados();

SET GLOBAL log_bin_trust_function_creators = 1;
CREATE FUNCTION hello (s CHAR(20)) RETURNS CHAR(50)   -- Función no determinista, que modifica los datos, no es segura, por lo que tenemos que añadir la línea anterior. 
	RETURN CONCAT('hello, ',s,'!');

select hello('Esto es BBDD');

-- ----------------------------------------------------------------------------------------------

-- Usuario con más conexiones activas.

CREATE USER 'curioso'@'localhost' IDENTIFIED BY 'curioso';
drop user 'curioso'@'localhost';

SET @nombre=null;
SET @conexiones=0;

SELECT * FROM information_schema.PROCESSLIST; 

SELECT USER, count(*) as 'conexiones' FROM information_schema.PROCESSLIST
GROUP BY USER LIMIT 3;   -- Limit 1: usuario con más conexiones

SELECT USER, count(*) INTO @nombre, @conexiones FROM information_schema.PROCESSLIST 
GROUP BY USER LIMIT 1;
select @nombre,@conexiones;


use instituto;
SET @numeroAlumnos=0;
select count(*) from alumnos;
select count(*) into @numeroAlumnos from alumnos;
select @numeroAlumnos;
SET @numeroAlumnos = (@numeroAlumnos * 13);
select @numeroAlumnos;
SET @numeroAlumnos = (@numeroAlumnos * 13) + @conexiones;
select @numeroAlumnos;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------

/*Utiliza la siguiente BBDD (script.sql) para tener para realizar los siguientes ejercicios (la base de datos se llama alumnosfp):*/

-- Crear una variable de usuario que almacene el número de asignaturas que tiene el alumno con el teléfono: 634453245
set @numeroDeAsignaturas = 0;

SELECT COUNT(*) INTO @numero_asignaturas
FROM cursa_asignaturas ca
INNER JOIN alumnos a ON ca.dni_alumno = a.dni_alumno
WHERE a.telefono LIKE '634453245';

-- Dos variables de usuario que almacenen la edad media de los alumnos (repetidores) y el número repetidores que hay.
set @edadMediaAlumnos = 0;
set @numeroRepetidores = 0;

SELECT avg(edad), count(repetidor) INTO  @edadMediaAlumnos, @numeroRepetidores
FROM alumnos 
WHERE repetidor = 1;

SELECT @edadMediaAlumnos;
SELECT @numeroRepetidores;
 
-- Crea una variable de usuario que haga el porcentaje con las dos anteriores variables-> dividir edadMedia/repetidores
set @porcentaje = 0;

/* Crea dos variables de usuario (@tipoAsignatura y @edad). Introduce los datos que quieras con los que hay en la BBDD (por ejemplo 'teorica' y 18) 
Luego realiza consulta SQL que saque el nombre de todos los alumnos que tienen más de esa edad y que estén cursando ese tipo de asignatura.*/

set @tipoAsignatura = teorica;
set @edad = 18;

SELECT a.nombre 
FROM alumnos a 
INNER JOIN cursa_asignaturas ca ON a.dni_alumno = ca.dni_alumno
INNER JOIN asignaturas asig ON ca.id_asignatura = asig.id_asignatura
INNER JOIN tipo_asignatura ta ON asig.tipo = ta.tipo
WHERE ta.descripcion like 'teorica' AND a.edad > 18;





