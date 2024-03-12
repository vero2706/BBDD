-- . Seleccionar los autores que nacieron entre 1800 y 1850: fácil
SELECT * FROM autor
WHERE YEAR(fecha_nacimiento) BETWEEN 1800 AND 1850;


-- . Selecciona los autores que vivieron menos de 50 años. Media Utiliza YEAR(columna_fecha) para obtener solo el año de una fecha
SELECT * FROM autor
WHERE YEAR(fecha_defuncion) - YEAR(fecha_nacimiento) < 50;


-- . Autores que murieron en el mismo lugar en el que nacieron. Fácil
SELECT * FROM autor
WHERE lugar_nacimiento = lugar_defuncion;


-- . Autores cuyo nombre empieza por g y acaba por i. Fácil
SELECT * FROM autor
WHERE nombre LIKE 'G%i';


-- . Todas óperas que se estrenaron antes de 7 de julio de 1850. Fácil
SELECT * FROM opera
WHERE fecha_estreno < '1850-07-07';


-- . Todas las obras ordenadas según tu propio criterio. Fácil
SELECT * FROM opera
INNER JOIN autor ON opera.autor_idautor = autor.idautor
ORDER BY nombre_autor, nombre_obra;


-- . Todos los autores que murieron en distinto país del país donde nacieron. Difícil
SELECT * FROM autor
WHERE lugar_nacimiento != lugar_defuncion;


-- . Autores que no tienen ninguna obra almacenada en la base de datos.  Medio
SELECT autor.*
FROM autor
LEFT JOIN opera ON autor.idautor = opera.autor_idautor
WHERE opera.idopera IS NULL;


-- . Mostrar todas las obras que no han sido representadas y que estén escritas en alemán idioma=’A’. Fácil
SELECT opera.nombre AS nombre_obra, autor.nombre AS nombre_autor, ciudad_pais.pais AS pais_estreno
FROM opera
LEFT JOIN temporada_representa_opera ON opera.idopera = temporada_representa_opera.opera_idopera
LEFT JOIN autor ON opera.autor_idautor = autor.idautor
LEFT JOIN ciudad_pais ON opera.lugar_estreno = ciudad_pais.ciudad
WHERE temporada_representa_opera.opera_idopera IS NULL AND opera.idioma = 'A';


/* . Edad que tenía el autor Giacomo Puccini cuando se estrenaron sus obras. Muy difícil.
. Mostrar nombre autor, nombre de obra, y edad del autor cuando se estrenó la obra.
El campo edad debe estar renombrado. Utiliza YEAR(columna_fecha) para obtener solo el año de una fecha*/
SELECT nombre, fecha_nacimiento, fecha_estreno, YEAR(fecha_estreno) - YEAR(fecha_nacimiento) AS edad_cuando_estreno
FROM autor
INNER JOIN opera ON autor.idautor = opera.autor_idautor
WHERE nombre = 'Giacomo Puccini';


/*. Mostrar todas las obras con los datos de sus respectivos autores y el país donde se estrenaron ordenados por el nombre de la ópera descendentemente.
 Solo queremos que muestre dos registros a partir del registro 5.  Medio
Los datos a mostrar serán : nombre autor, nombre ópera, país de estreno*/
SELECT autor.nombre AS nombre_autor, opera.nombre AS nombre_obra, ciudad_pais.pais AS pais_estreno
FROM opera
JOIN autor ON opera.autor_idautor = autor.idautor
JOIN ciudad_pais ON opera.lugar_estreno = ciudad_pais.ciudad
ORDER BY nombre_obra DESC
LIMIT 2 OFFSET 4;


/*. Autores con todas las obras que han representado. En caso de que no tengan ninguna obra que se haya representado se mostraran los valores respectivos a las fechas de representación a vacío (null). Difícil
Solo habrá que seleccionar los siguientes datos: nombre autor, nombre opera, fecha de representación*/ 
SELECT autor.nombre AS nombre_autor, opera.nombre AS nombre_obra, temporada_representa_opera.fecha AS fecha_representacion
FROM autor
JOIN opera ON autor.idautor = opera.autor_idautor
LEFT JOIN temporada_representa_opera ON opera.idopera = temporada_representa_opera.opera_idopera
ORDER BY nombre_autor, nombre_obra;


/* . Todas las obras que hayan sido escritas por un italiano. Con el siguiente formato. Tendrán que ir ordenado por nombre de autor en orden descendente y nombre de la obra en orden ascendente. Difícil
País autor  Nombre autor  Nombre obra*/
SELECT ciudad_pais.pais AS pais_autor, autor.nombre AS nombre_autor, opera.nombre AS nombre_obra
FROM autor
JOIN opera ON autor.idautor = opera.autor_idautor
JOIN ciudad_pais ON autor.lugar_nacimiento = ciudad_pais.ciudad
WHERE ciudad_pais.pais = 'Italia'
ORDER BY nombre_autor DESC, nombre_obra ASC;


/* . Todas las obras que se han representado en el teatro 1 durante la temporada 2015/2016. Muy difícil
Mostrar el siguiente formato: nombre teatro, temporada, nombre de la obra que se representó.
Anotación: ten en cuenta que las tablas temporada y temporada_representa_opera están relacionadas por una doble FK-PF*/
 SELECT teatro.nombre AS nombre_teatro, temporada.descripcion AS temporada, opera.nombre AS nombre_obra
FROM temporada_representa_opera
INNER JOIN teatro ON temporada_representa_opera.temporada_teatro_idteatro = teatro.idteatro
INNER JOIN temporada ON temporada_representa_opera.temporada_teatro_idteatro = temporada.teatro_idteatro
AND temporada_representa_opera.temporada_idtemporada = temporada.idtemporada
INNER JOIN opera ON temporada_representa_opera.opera_idopera = opera.idopera
WHERE temporada.descripcion = 'Otoño Invierno 2015/2016';


/* . Listar todos los nombres las óperas, junto con su fecha de estreno y el idioma, pero habrá que mostrar lo siguiente. Difícil
En el caso de que el idioma sea:
F-->Francés
I-->Italiano
A-->Alemán 
Habrá que renombrar el último campo como idioma.*/
SELECT nombre, fecha_estreno, 
       CASE idioma 
         WHEN 'F' THEN 'Francés'
         WHEN 'I' THEN 'Italiano'
         WHEN 'A' THEN 'Alemán'
       END AS idioma
FROM opera;