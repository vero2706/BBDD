-- Visualizar los usuarios (los usuarios se almacenan en la tabla user): select * from mysql.user;
SELECT * FROM mysql.user;

-- Crear usuarios: CREATE USER 'nombre_usuario'@'localhost' IDENTIFIED BY 'tu_contrasena'
CREATE USER 'vero'@'localhost' IDENTIFIED BY 'vero';

-- Borrar usuarios: DROP USER ‘usuario_prueba’@‘localhost’;
DROP USER 'vero'@'localhost';

-- Proporcionar privilegios: GRANT ALL PRIVILEGES ON *.* TO 'nombre_usuario'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'vero'@'localhost'; -- los asteriscos infican todo de esa tabla y todo de las otras tablas.

-- Eliminar privilegios: REVOKE [permiso] ON [nombre de base de datos].[nombre de tabla] FROM ‘[nombre de usuario]’@‘localhost’;
REVOKE ALL privileges on *.* FROM 'vero'@'localhost';
FLUSH PRIVILEGES;

REVOKE DELETE ON neptuno.categorias
FROM 'vero'@'localhost';

-- Damos permiso de select a curioso
GRANT select ON neptuno.categorias TO 'vero'@'localhost';

/*-- Vemos los usuarios que hay en el sistema
select * from mysql.user;

-- Creamos un usuario nuevo, pero en este momento no tiene permisos para nada
CREATE USER 'teresa'@'localhost' IDENTIFIED BY '1234';
CREATE USER 'curioso'@'localhost' IDENTIFIED BY 'curioso';

-- Damos permiso de select a curioso
GRANT select ON neptuno.productos TO 'curioso'@'localhost';

-- Damos permisos de control total
GRANT ALL PRIVILEGES ON * . * TO 'teresa'@'localhost';

-- Se hacen efectivos los permisos
FLUSH PRIVILEGES;

-- Vemos los permisos que tiene un usuario
SHOW GRANTS for 'curioso'@'localhost';
SHOW GRANTS for 'teresa'@'localhost';

-- Borramos el usuario
DROP USER 'curioso'@'localhost';

-- Quitamos el permiso de select al usuario teresa
REVOKE SELECT ON neptuno.* FROM 'teresa'@'localhost';
FLUSH PRIVILEGES;*/
