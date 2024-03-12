-- Database--> reverse enginne > para consultar las tablas esquematizadas
use universidad;

/* Consultas sobre una tabla */

/* 1.- Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. 
El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.*/
SELECT apellido1, apellido2, nombre FROM persona where tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;

SELECT apellido1, apellido2, nombre FROM persona where tipo = 'alumno' ORDER BY 1, 2, 3;

-- 2.- Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos
SELECT nombre, apellido1, apellido2 FROM persona WHERE telefono IS NULL and tipo = 'alumno';

-- 3.- Devuelve el listado de los alumnos que nacieron en 1999.
SELECT * FROM persona WHERE YEAR(fecha_nacimiento) = '1999' and tipo = 'alumno';

/*  4.- Devuelve el listado de profesores que no han dado de alta su número de teléfono en la base de datos 
y además su nif termina en K.*/
SELECT nif, nombre, apellido1, apellido2 FROM persona WHERE telefono IS NULL AND tipo = 'profesor' and nif like '%K';

/* CONSULTAS MULTITABLA (Composición interna)*/

/* 5.- Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, 
en el tercer curso del grado que tiene el identificador 7.*/
SELECT nombre FROM asignatura WHERE cuatrimestre = 1 and curso = 3 and id_grado = 7;

/* 6.- Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).*/
select p.* From persona p inner join alumno_se_matricula_asignatura ama ON p.id= ama.id_alumno inner join asignatura a ON ama.id_asignatura = a.id 
inner join grado g on a. id_grado = g. id where p. tipo = 'alumno' and p. sexo = 'M' and g. nombre like '%Ingeniería Informática%';

-- 7.- Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingeniería Informática (Plan 2015).
SELECT a.* from asignatura a inner join grado g on a.id_grado = g.id where g. nombre like '%Ingeniería Informática%';

/* 8.- Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados. 
El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento.
 El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.*/
 SELECT p.nombre, p.apellido1, p.apellido2, d.nombre from persona p INNER JOIN profesor pr ON p.id = pr.id_profesor 
 INNER JOIN departamento d ON pr.id_departamento = d.id ORDER BY p.apellido1, p.apellido2, p.nombre;
 
 -- 9.- Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno con nif 26902806M.
 SELECT a.nombre, c.anyo_inicio, c.anyo_fin from alumno_se_matricula_asignatura ama INNER JOIN asignatura a ON a.id = ama.id_asignatura INNER JOIN persona p ON p.id = ama.id_alumno
 INNER JOIN curso_escolar c ON ama.id_curso_escolar = c.id where p.tipo = 'alumno' and p.nif like '26902806M';
 
 -- 10.-  Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingeniería Informática 
 SELECT d.nombre FROM departamento d INNER JOIN profesor p ON d.id = p.id_departamento INNER JOIN asignatura a ON p.id_profesor = a.id_profesor INNER JOIN grado g ON a.id_grado = g.id
WHERE g.nombre like '%Ingeniería Informática%'; 

-- 11.- Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019. (2 opciones).
SELECT distinct ama.id_alumno FROM alumno_se_matricula_asignatura ama INNER JOIN curso_escolar c ON ama.id_curso_escolar = c.id 
WHERE c.anyo_inicio = 2018 AND c.anyo_fin = 2019;
SELECT distinct p.nombre, p.apellido1 FROM persona p INNER JOIN alumno_se_matricula_asignatura ama ON p.id = ama.id_alumno
INNER JOIN curso_escolar c ON ama.id_curso_escolar = c.id WHERE c.anyo_inicio = 2018 AND c.anyo_fin = 2019;
-- el distinct es para que no se repita el dato si hay más de una asignatura con el mismo alumno por ejemplo.

/* CONSULTAS MULTITABLA (Composición externa) */
-- Resolver todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

/* 12.  Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores 
que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. 
El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.*/
SELECT d.nombre, p.apellido1, p.apellido2, p.nombre FROM profesor pr LEFT JOIN departamento d ON pr.id_departamento = d.id
INNER JOIN persona p ON pr.id_profesor = p.id ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;

-- 13.  Devuelve un listado con los profesores que no están asociados a un departamento.
SELECT pr.id_profesor FROM profesor pr LEFT JOIN departamento d ON pr.id_departamento = d.id WHERE pr.id_departamento IS NULL;
select * from profesor; -- para confirmar q no hay ninguno que NO imparta asignatura.

 -- 14.  Devuelve un listado con los departamentos que no tienen profesores asociados.
SELECT d.id FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento WHERE d.id IS NULL;
select * from departamento;

-- 15.  Devuelve un listado con los profesores que no imparten ninguna asignatura.
SELECT pr.id_profesor FROM profesor pr LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE pr.id_profesor IS NULL;

-- 16.  Devuelve un listado con las asignaturas que no tienen un profesor asignado.
SELECT a.id FROM asignatura a LEFT JOIN profesor pr ON a.id_profesor = pr.id_profesor WHERE a.id_profesor IS NULL;

/* 17. Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar. 
El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.*/
SELECT d.nombre, a.nombre FROM departamento d INNER JOIN profesor pr ON d.id = pr.id_departamento INNER JOIN asignatura a ON pr.id_profesor = a.id_profesor 
LEFT JOIN alumno_se_matricula_asignatura ama ON a.id = ama.id_asignatura  WHERE ama.id_asignatura IS NULL;

/* Cosultas Resumen */

-- 18.  Devuelve el número total de alumnas que hay.
SELECT count(*) FROM persona where sexo = 'M' and tipo = 'alumno';
-- 19.  Calcula cuántos alumnos nacieron en 1999.
SELECT count(*) FROM persona where tipo = 'alumno' and YEAR(fecha_nacimiento) = 1999;
/* 20.  Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra 
con el número de profesores que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores asociados 
y deberá estar ordenado de mayor a menor por el número de profesores.*/
SELECT d.nombre, count(*) as 'Numero de profesores' FROM profesor p inner join departamento d ON p.id_departamento= d. id group by d.nombre order by 2 desc;

/* 21.  Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. 
Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos también tienen que aparecer en el listado.*/
select 
CASE WHEN dp.id in (select dp.id from departamento dp inner join profesor pr on pr.id_departamento = dp.id
) THEN count(id) ELSE 0 END AS NumeroProfesoresPorDepartamento, dp.nombre from departamento dp
left join profesor pr on pr.id_departamento = dp.id group by dp.id;

select dp.nombre, count(pr.id_profesor) numeroDeProfesoresPorDepartamento from departamento dp
left join profesor pr on pr.id_departamento = dp.id
group by dp.id;

/* 22.  Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. 
Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. 
El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.*/
select CASE WHEN  gr.id in (select g.id from grado g inner join asignatura a on a.id_grado = g.id) THEN count(gr.id) 
ELSE 0 END AS NumeroAsignaturasPorGrado,
gr.nombre from grado gr left join asignatura a on a.id_grado = gr.id group by gr.id order by NumeroAsignaturasPorGrado desc;

select gr.id, gr.nombre, count(a.id) from grado gr left join asignatura a on a.id_grado = gr.id group by gr.id
order by 3 desc;

/* 23.  Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, 
de los grados que tengan más de 40 asignaturas asociadas.*/
select g.nombre, count(a.id) as cuentaAsignaturasPorGrado from grado g 
inner join asignatura a on a.id_grado = g.id group by g.id having count(a.id) >40;

/*24.  Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. 
El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo. 
Ordene el resultado de mayor a menor por el número total de créditos.*/
select g.nombre, a.tipo, sum(a.creditos) as creditos from asignatura a inner join grado g on g.id = a.id_grado
group by a.id_grado, a.tipo order by creditos desc;

/* 25.  Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. 
El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.*/
select anyo_inicio, count(asm.id_alumno) as 'alumnos matriculados' from curso_escolar ce inner join alumno_se_matricula_asignatura asm on ce.id = asm.id_curso_escolar
group by ce.anyo_inicio;

select * from curso_escolar;
select * from alumno_se_matricula_asignatura;

/* 26.  Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura.
 El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. 
 El resultado estará ordenado de mayor a menor por el número de asignaturas.*/
 select CASE WHEN  pr.id_profesor in (select pr.id_profesor from profesor pr inner join asignatura a on a.id_profesor = pr.id_profesor)
 THEN count(a.id) ELSE 0 END AS AsignaturasPorProfesor, pe.nombre,pe.apellido1,pe.apellido2 from profesor pr
left join asignatura a on a.id_profesor= pr.id_profesor 
inner join persona pe on pe.id = pr.id_profesor 
group by pr.id_profesor
order by AsignaturasPorProfesor desc;

select pr.id_profesor, pe.nombre, pe.apellido1, pe.apellido2, count(a.id) AsignaturasPorProfesor from profesor pr
left join asignatura a on a.id_profesor= pr.id_profesor inner join persona pe on pe.id = pr.id_profesor
group by pr.id_profesor order by AsignaturasPorProfesor desc;

 /* Subconsultas */

-- 27.  Devuelve todos los datos del alumno más joven.
SELECT nombre, fecha_nacimiento FROM persona where tipo = 'alumno' and fecha_nacimiento >= ALL (SELECT fecha_nacimiento FROM persona where tipo = 'alumno'); 
-- 28.  Devuelve un listado con los profesores que no están asociados a un departamento.
SELECT id_profesor from profesor where id_departamento not in (select id_departamento from profesor);
-- 29.  Devuelve un listado con los departamentos que no tienen profesores asociados.
SELECT d.* FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento WHERE pr.id_profesor is null;
-- 30.  Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.
select pr.id_profesor from profesor pr where pr.id_profesor in (select pr.id_profesor from profesor pr 
left join asignatura a on pr.id_profesor = a.id_profesor where a.id is null)
AND pr.id_profesor in(select pr.id_profesor from profesor pr inner join departamento d on pr.id_departamento=d.id);
-- 31.  Devuelve un listado con las asignaturas que no tienen un profesor asignado.
select * from asignatura where id_profesor is null;
-- 32.  Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
select dp.* from profesor pr
inner join departamento dp on dp.id = pr.id_departamento
where id_profesor in (select pr.id_profesor from profesor pr
left outer join asignatura a on pr.id_profesor = a.id_profesor
where a.id is null)     -- profesores que no han impartido asignaturas
group by id;

select pr.id_profesor from profesor pr
left outer join asignatura a on pr.id_profesor = a.id_profesor
where a.id is null;

