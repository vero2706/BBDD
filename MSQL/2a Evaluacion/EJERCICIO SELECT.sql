use tienda;
-- Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre FROM producto;
-- Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio FROM producto;
-- Lista todas las columnas de la tabla producto.
SELECT * FROM producto;
-- Lista el nombre de los productos, el precio en euros
SELECT nombre FROM producto;
-- Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT NOMBRE FROM fabricante ORDER BY nombre ASC;
-- Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT NOMBRE FROM fabricante ORDER BY nombre desc;
-- Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante es igual a 2.
SELECT nombre FROM producto WHERE id_fabricante = 2;
-- Lista el nombre de los productos que tienen un precio menor o igual a 120€.
SELECT nombre FROM producto where precio >= 120;
-- Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT nombre FROM producto where precio <= 400;
-- Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT nombre FROM producto where precio >= 400;
-- Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
SELECT nombre FROM producto where precio >= 80 and precio <=300;
-- Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
SELECT nombre FROM producto where precio >= 60 and precio <=200;
-- Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de fabricante sea igual a 6.
SELECT nombre FROM producto where precio >= 200 and id_fabricante = 6;
-- Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
SELECT * FROM producto WHERE id_fabricante = 1 or id_fabricante = 3 or id_fabricante = 5;
-- Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT * FROM producto WHERE id_fabricante IN (1,3,5);
-- Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
SELECT NOMBRE FROM fabricante where nombre like 's%';
-- Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
SELECT NOMBRE FROM fabricante where nombre like '%e';
-- Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
SELECT NOMBRE FROM fabricante where nombre like '%w%';
-- Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
SELECT NOMBRE FROM fabricante where nombre like '____';
-- Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
SELECT * FROM producto where nombre like '%portatil%';
-- Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
SELECT * FROM producto where nombre like '%monitor%' and precio < 215;