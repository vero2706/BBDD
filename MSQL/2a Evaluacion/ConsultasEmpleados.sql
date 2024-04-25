-- CONSULTAS:


-- 1. Selecciona el apellido de todos los empleados.
SELECT LastName FROM EMPLOYEES;
-- 2. Selecciona el apellido de todos los empleados, sin duplicados.
SELECT distinct lastName from employees;
-- 3. Selecciona todos los datos de los empleados cuyo apellido sea "Smith".
select * from employees where lastName like 'Smith';
-- 4. Selecciona todos los datos de los empleados cuyo apellido sea "Smith" o "Doe". (Con OR y Con IN) 
select * from employees where lastName like 'Smith' or lastname like 'Doe';
-- 5. Selecciona todos los datos de los empleados que trabajan en el departamento 14.
select * from employees where department like 14;
-- 6. Selecciona todos los datos de los empleados que trabajan en el departamento 37 o el departamento 77. (Con OR y Con IN) 
SELECT * from employees where department like 37 or department like 77;
-- 7. Selecciona todos los datos de los empleados cuyo apellido comience con una "S".
select * from employees where lastName like 'S%';
-- 8. Selecciona la suma de los presupuestos de todos los departamentos.
select * ;
-- 9. Selecciona la cantidad de empleados en cada departamento (solo se necesita mostrar el código del departamento y la cantidad de empleados).
 
-- 10. Selecciona todos los datos de los empleados, incluidos los datos del departamento de cada empleado.

-- 11. Seleccione el nombre y apellido de cada empleado, junto con el nombre y presupuesto del departamento del empleado. 

-- 12. Seleccione el nombre y apellido de los empleados que trabajan para departamentos con un presupuesto mayor a $60,000.

-- 13. Seleccione los departamentos con un presupuesto mayor que el presupuesto promedio de todos los departamentos.

-- 14. Seleccione los nombres de los departamentos con más de dos empleados. 

-- 15. Seleccione el nombre y apellido de los empleados que trabajan para los departamentos con el segundo presupuesto más bajo.