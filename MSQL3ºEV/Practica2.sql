-- Vista que utiliza, de forma lógica, datos de varias tablas (relacionados) y muestra algún resultado.
-- Esta vista muestra informacion sobre empleados y sus departamentos
-- CREATE VIEW vista_empleados_departamentos AS
SELECT e.emp_no, e.first_name, e.last_name, hire_date, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no;


-- Vista que utiliza, de forma lógica, algunos datos de la vista anterior (utilizar los campos de la vista anterior) y juega con ellos con alguna de las tablas de la BBDD.
-- Usanndo vista_empleados_departamentos, filtra para mostrar solo el departamento marketing
select * FROM dept_emp;
-- CREATE VIEW vista_empleados_marketing AS
SELECT * FROM vista_empleados_departamentos
WHERE dept_name = 'Marketing';


-- Vista que utiliza, de forma lógica, datos de varias tablas (relacionados) y utiliza group by (having es opcional)
-- agrupo por departamento y cuento el numero de empleados que tiene cada uno.

CREATE VIEW vista_conteo_empleados_departamento AS
SELECT d.dept_no, COUNT(e.emp_no) AS numero_empleados
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de. dept_no = d.dept_no
GROUP BY d.dept_no;



-- Vista que utiliza, de forma lógica, datos de varias tablas (relacionados) y utiliza alguna de las funciones vistas en la UD "funciones"
CREATE VIEW vista_conteo_empleados_departamento AS
SELECT d.dept_no, COUNT(e.emp_no) AS numero_empleados
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de. dept_no = d.dept_no
GROUP BY d.emp_no;



/* Vista sencilla que muestra varios campos de una sola tabla con alguna cláusula WHERE con dos o más filtros 
(como anotación: al ser una consulta sobre una tabla y sencilla, se podría utilizar la vista para modificar datos)*/

CREATE VIEW vista_empleados_recientes AS
SELECT * FROM employees
WHERE hire_date > '2020-01-01'AND gender = 'F';

-- Utilizar una sentencia UPDATE sobre la vista anterior para modificar algún campo.
UPDATE vista_empleados_recientes
SET last_name = 'NuevoApellido'
WHERE emp_no = 1;























