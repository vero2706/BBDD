-- 1. Insertar en la tabla tipo_asignaturas los siguientes datos. 
/*tipo  1 
descripción  troncal. 
tipo  2 
descripción  optativa. 
tipo  3 
descripción  obligatoria. 
tipo  4 
descripción libre_configuración.*/
INSERT INTO tipo_asignatura (tipo, descripcion) VALUES
(1, 'troncal'),
(2, 'optativa'),
(3, 'obligatoria'),
(4, 'libre:configuracio');

select * from asignaturas;

/*2. En la tabla asignaturas introduciremos las siguientes (todas tendrán como tipo troncal) 
o Gestión de bases de datos. 
o Programación 
o Redes 1 
o Redes 2 
o Desarrollo en entorno servidor */

INSERT INTO asignaturas (tipo, nombre) VALUES
(1, 'Gestión de bases de datos'),
(1, 'Programación'),
(1, 'Redes 1'),
(1, 'Redes 2'),
(1, 'Desarrollo en entorno servidor');

-- 3. Inserta en la tabla alumnos los datos de la tabla per1. Solo los datos que puedas. 
INSERT INTO alumnos (dni_alumno, nombre, direccion, sexo)
SELECT dni, nombre, direccion, sexo
FROM per1;

-- 4. Crea una copia de seguridad de la tabla alumnos y llámala alumnos seguido de un _ y la fecha actual. 
CREATE TABLE alumnos_02052024 AS
SELECT * FROM alumnos;

-- 5. Inserta estos nuevos alumnos. 
INSERT INTO alumnos (dni_alumno, nombre, telefono, sexo, categoria) VALUES
('598926666M', 'JAVIER Ramírez Guerrero', 657890943, 'M', 'Categoría A');
INSERT INTO alumnos (dni_alumno, nombre, direccion, edad, sexo) VALUES
('798004710J', 'LUIS Herrero Giménez', 'Calle LAGO DE LA BAÑA', '23', 'm');
INSERT INTO alumnos (dni_alumno, nombre, edad, sexo, categoria) VALUES
('153611090V', 'JOSE MIGUEL Campos Benítez', 21, 'm', 'Categoría A');
INSERT INTO alumnos (dni_alumno, nombre, telefono, sexo, repetidor) VALUES
('176716292C', 'ALEJANDRO Navarro Domínguez', 678324567, 'm', 'Repetidor si');
INSERT INTO alumnos (dni_alumno, nombre, telefono, sexo, repetidor) VALUES
('127020940H', 'MIGUEL ANGEL Campos Ferrer', 685090402 , 'm', 'Repetidor si');

-- 6. Introduce en la tabla cursa_asignaturas los siguientes datos.
INSERT INTO cursa_asignaturas (dni_alumno, id_asignatura) VALUES
('75458961B', 1), ('75458961B', 2), ('75458961B', 3), 
('27965528X', 1), ('27965528X', 2), ('27965528X', 3),
('12958474Q', 1), ('12958474Q', 2), ('12958474Q', 3),
('82434905I', 1), ('82434905I', 2), ('82434905I', 3),
('26422561L', 1), ('26422561L', 1),
('67436450L', 1), ('67436450L', 1),
('83171019E', 1), ('83171019E', 1);

-- 7. Crear una tabla que contenga la siguiente información: Nombre alumno, Dni, nombre asignatura, tipo_asignatura. 
 
CREATE TABLE tablaNueva AS 
SELECT alu.nombre AS 'Nombre Alumno', alu.dni_alumno AS 'DNI', asi.nombre AS 'Nombre de la asignatura',
tipo_asi.descripcion AS 'Descripción de la asignatura' 
FROM alumnos AS alu 
INNER JOIN cursa_asignaturas AS cursa ON alu.dni_alumno = cursa.dni_alumno
INNER JOIN asignaturas AS asi ON cursa.id_asignatura = asi.id_asignatura
INNER JOIN tipo_asignatura AS tipo_asi ON asi.tipo = tipo_asi.tipo
ORDER BY alu.nombre;