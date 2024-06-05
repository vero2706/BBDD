-- Realizar los siguientes ejercicios:

/* Crear una vista llamada p1_1 que saque el salario medio de los empleados que están en el departamento 'Finance' 
(no importa si han estado varias veces en el mismo departamento, sumar todo)*/

CREATE view p1_1 AS
SELECT d.dept_name, AVG(s.salary) AS salario_medio FROM employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE dept_name like 'Finance'
GROUP BY d.dept_name;


 /* Crear una vista llamada p1_2 que saque el nombre y la fecha de contratación de todos los empleados 
 que han tenido el título de 'Senior Engineer'. Ordena en función de la fecha de contratación*/
 
select * from employees;

CREATE view p1_2 AS
SELECT e.first_name, e.hire_date FROM employees e
INNER JOIN titles t ON e.emp_no = t.emp_no
WHERE title = 'Senior Engineer'
ORDER BY hire_date;

/*Crear una vista llamada p1_3 que muestre el número de empleados que ha tenido cada título (table title). 
Muestra también la media de salario de cada título. Ordena en función de la media del salario*/

CREATE view p1_3 AS
SELECT  COUNT(e.emp_no), AVG(s.salary), t.title FROM  salaries s
INNER JOIN employees e ON e.emp_no = s.emp_no
INNER JOIN titles t ON t.emp_no = e.emp_no
GROUP BY t.title
ORDER BY AVG(s.salary) DESC;

drop view p1_3;

/*Crear una vista llamada p1_4 que utilice el resultado de otra vista 'current_dept_emp'. La vista saca el empleado y el departento
de forma númerica, se desea sacar el nombre del departamento y el nombre de forma texto. 
Ayuda: Hacer una consulta, en vez de a una tabla, a la vista current_dept_emp. En vez de sacar los id, utilizarlos en una subconsulta
dentro de la invocación de columnas para obtener el nombre de la persona y el nombre del departamento*/

select * from p1_4;

CREATE view p1_4 AS
SELECT (SELECT e.first_name FROM employees AS e WHERE vista.emp_no = e.emp_no) AS 'Nombre', 
(SELECT d.dept_name FROM departments AS d WHERE vista.dept_no = d.dept_no) AS 'Departamento'
FROM current_dept_emp AS vista; 
 
 drop view p1_4;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 



