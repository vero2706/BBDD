/*1. Crear una nueva categoría de producto. Habrá que insertar un nuevo registro. 
 Con el id_categoria -> 9, nombre-> congelados y como descripción 'productos congelados'.*/
INSERT INTO categorias (id_categoría, NombreCategoría, Descripcion)
VALUES (9, 'congelados', 'productos congelados');

/* 2. Crear una nueva categoría con id_categoria->10, nombre 'Pan' y con la descripción 
'repostería, cereales, pan, dulces, galletas, etc…'*/ 
INSERT INTO categorias (id_categoría, NombreCategoría, Descripcion)
VALUES (10, 'Pan', 'repostería, cereales, pan, dulces, galletas, etc…');

-- 3. Crear una copia de seguridad de la tabla productos que llamaremos productos_bck.
CREATE TABLE productos_bck LIKE productos;
INSERT INTO productos_bck SELECT * FROM productos;


/* 4. Actualizar la tabla productos para poner con categoría 10 (la nueva categoría que hemos creado) 
a todos los productos que pertenezcan a la categoría 5 o 3.*/
UPDATE productos SET categoria = 10 WHERE categoria IN (3, 5);

/* 5. Crear una nueva tabla ciudadpais que tenga dos campos
ciudad varchar(15) pk
país varchar(15)*/
CREATE TABLE ciudadpais (
    ciudad VARCHAR(15) PRIMARY KEY,
    país VARCHAR(15)
);

-- 6. Insertar en la tabla ciudadpais: todas las ciudades y países distintas de la tabla proveedores 


-- 7. Borrar todos los datos del país de la tabla empleados.


/* 8. Damos de alta a un nuevo empleado en la empresa. Inserta los datos poniendo tu nombre y apellidos
 más los datos que no pueden estar en blanco en esa tabla.*/
 
 
/* 9. Vamos a borrar los datos del empleado con idempleado=7 ya que deja de trabajar en la empresa. 
 Antes de darlo de baja habrá que asignar todos los pedidos que realizó este empleado al empleado 8. */
 
 
/* 10. En la categoría guardamos la imagen de la categoría, pero esto ocupa demasiado espacio. 
Vamos a realizar algunas modificaciones:

 .Borrar todos los datos del campo imagen de la tabla categorías. (Actualización). Poner el campo a 0
 
 .Cambiar el tipo de dato del campo imagen de longblob a varchar(15).(alter table)
 
 .Introducir en el campo imagen un texto que sea los cinco primeros caracteres del nombre de la Categoría
 seguido de un guion bajo más el id de la categoría con extensión .jpg. Por ejemplo bebid_1.jpg 
 (realizar 8 querys diferentes, uno para cada categoría)*/
 
 
/* 11. Poner en notas del empleado el valor 'Cumple con objetivos' a todos aquellos empleados que hayan
 preparado un pedido con un producto de la categoría cuya descripción es 'Quesos' 
 (no tiene que salir ningún cambio porque la tabla detalle de pedidos está vacía). 
 Anotación: para que se cargue correctamente la tabla `detalles de pedidos` hay que utilizar las comillas `*/




















INSERT INTO ciudadpais (ciudad, país) SELECT DISTINCT ciudad, país FROM proveedores;

UPDATE empleados SET país = '';

INSERT INTO empleados (nombre, apellido, campo1, campo2) VALUES ('[Tu nombre]', '[Tus apellidos]', '[Valor campo1]', '[Valor campo2]');

UPDATE pedidos SET idempleado = 8 WHERE idempleado = 7;
DELETE FROM empleados WHERE idempleado = 7;

UPDATE categorías SET imagen = '0';

ALTER TABLE categorías MODIFY COLUMN imagen VARCHAR(15);

UPDATE categorías SET imagen = CONCAT(LEFT(nombre, 5), '_', idcategoría, '.jpg') WHERE idcategoría = [ID_CATEGORÍA];

UPDATE empleados SET notas = 'Cumple con objetivos' WHERE idempleado IN (SELECT idempleado FROM pedidos WHERE idproducto IN (SELECT idproducto FROM productos WHERE categoría = (SELECT idcategoría FROM categorías WHERE nombre = 'Quesos')));
