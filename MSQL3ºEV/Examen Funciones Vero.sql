-- FUNCIONES DE CONVERSIÓN
/*
CONVERT(input_value, data_type):  convertir valores de un tipo de datos otro tipo de datos diferente
*/

-- 1- Saca el tiempo de duración media de todas las películas (length)
SELECT avg(length)
FROM film
group by length;


-- 2- Haz un listado de las veces que se repite el nombre (first name) de los actores en la tabla actor, junto con su longitud y ordénalo de manera ascendente 
SELECT first_name, COUNT(*) AS repeticiones, LENGTH(first_name) AS longitud
FROM actor
GROUP BY first_name
ORDER BY longitud;


-- 3- Sacar un listado con el nombre completo (first_name) y la antigüedad de cada cliente (create_date de customer). 
SELECT first_name AS nombre_completo, DATEDIFF(NOW(), create_date) AS antiguedad
FROM customer;


-- 4- En la tabla payment, se muestran los pagos realizados por cada cliente y qué empleado lo ha cobrado. 
-- Sacar un listado de lo que ha facturado cada empleado: mostrar el staff_id y el total facturado (amount).
SELECT staff_id, SUM(amount) AS totalFacturado
FROM payment
GROUP BY staff_id;


-- 5- Sacar la misma información que antes pero añadiendo nombre y apellidos del empleado.
SELECT s.staff_id, first_name, last_name AS nombreCompleto, SUM(p.amount) AS totalFacturado
FROM payment p
INNER JOIN staff s ON p.staff_id = s.staff_id
GROUP BY s.staff_id;


-- 6 - ¿Cuántos distritos hay? Se mostrará el distrito y la cuenta de ese distrito ordenado de más a menos distritos. 
-- Solo se mostrarán aquellos que tengan más de un distrito.  
     -- Un ejemplo de salida sería:
		-- Abu Dhabi 3 
        -- Aceh 2
SELECT district, COUNT(*) AS numeroDistritos
FROM address
GROUP BY district
HAVING COUNT(*) > 1
ORDER BY numeroDistritos DESC;


-- 7 - Sacar el número de clientes que tiene cada tienda de esta forma: store_id, número clientes
SELECT store_id, COUNT(*) AS numeroClientes
FROM customer
GROUP BY store_id;


-- 8 - Listar cada película y el número de actores que aparecen en cada película ordenados de más a menos. 
-- Debe aparecer el título en minúscula y el número de actores
SELECT LOWER(title) AS titulo, COUNT(*) AS numeroActores
FROM film_actor fa
INNER JOIN film f ON fa.film_id = f.film_id
GROUP BY LOWER(title)
ORDER BY numeroActores DESC;


-- 9 - Sacar una lista con la cantidad de películas que ha hecho cada actor(nombres y apellidos) y ordenar
-- por el nombre y apellidos del actor.
SELECT a.first_name, a.last_name AS nombreDeActor, COUNT(*) AS cantidadPeliculas
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY a.last_name, a.first_name;


-- 10 - Usar JOIN para mostrar la cantidad recaudada (payment) de cada miembro de la empresa en agosto de 2005
-- Mostar: nombre, apellidos y la cantidad recaudada
SELECT s.first_name, s.last_name, SUM(payment_id) AS cantidadRecaudada
FROM  staff s 
INNER JOIN payment p ON s.staff_id = p.staff_id
WHERE p.payment_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY s.staff_id
ORDER BY s.first_name;















































































