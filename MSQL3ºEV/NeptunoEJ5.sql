-- Visualizar los usuarios (los usuarios se almacenan en la tabla user): select * from mysql.user;
SELECT * FROM mysql.user;

-- Crear usuarios: CREATE USER 'nombre_usuario'@'localhost' IDENTIFIED BY 'tu_contrasena'
CREATE USER 'vero'@'localhost' IDENTIFIED BY 'vero';

-- Borrar usuarios: DROP USER ‘usuario_prueba’@‘localhost’;
DROP USER 'vero'@'localhost';

-- Proporcionar privilegios: GRANT ALL PRIVILEGES ON *.* TO 'nombre_usuario'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'vero'@'localhost'; -- los asteriscos infican todo de esa tabla y todo de las otras tablas.

FLUSH PRIVILEGES;
-- Eliminar privilegios: REVOKE [permiso] ON [nombre de base de datos].[nombre de tabla] FROM ‘[nombre de usuario]’@‘localhost’;
REVOKE ALL privileges on *.* FROM 'vero'@'localhost';
REVOKE DELETE ON neptuno.categorias
FROM 'vero'@'localhost';


