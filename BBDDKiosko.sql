-- -----------------------------------------------------
-- Schema Kiosko
-- -----------------------------------------------------

DROP DATABASE IF EXISTS Kiosko;
CREATE DATABASE Kiosko DEFAULT CHARACTER SET latin1 COLLATE latin1_general_cs;
USE Kiosko;

-- -----------------------------------------------------
-- Table `Kiosko`.`Categoría`
-- -----------------------------------------------------

CREATE TABLE CATEGORIA (
  Id_Categoria INT PRIMARY KEY,
  Nombre_Cat VARCHAR(50) NOT NULL,
  Descripcion_Cat TEXT
);

-- -----------------------------------------------------
-- Table `Kiosko`.`Producto`
-- -----------------------------------------------------

CREATE TABLE PRODUCTO (
  Id_Producto INT PRIMARY KEY,
  Id_Categoria INT NOT NULL,
  Nombre_Producto VARCHAR(100),
  Precio_Unitario DECIMAL(10, 2),
  FOREIGN KEY (Id_Categoria) REFERENCES CATEGORIA(Id_Categoria)
);

-- -----------------------------------------------------
-- Table `Kiosko`.`Empleado`
-- -----------------------------------------------------

CREATE TABLE EMPLEADO (
  Id_Empleado INT PRIMARY KEY,
  DNI VARCHAR(9) NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  Apellidos VARCHAR(100) NOT NULL,
  Direccion VARCHAR(200),
  Telefono VARCHAR(20) NOT NULL,
  Cargo VARCHAR(50),
  Correo VARCHAR(100),
  Contratacion DATE
);

-- -----------------------------------------------------
-- Table `Kiosko`.`Venta`
-- -----------------------------------------------------

CREATE TABLE TICKET_VENTA (
  Id_Venta INT PRIMARY KEY,
  Id_Empleado INT NOT NULL,
  Fecha_Venta DATE NOT NULL,
  Estado VARCHAR(20),
  FOREIGN KEY (Id_Empleado) REFERENCES EMPLEADO(Id_Empleado)
);

-- -----------------------------------------------------
-- Table `Kiosko`.`PEDIDO_PROVEEDORES`
-- -----------------------------------------------------

CREATE TABLE PEDIDO_PROVEEDORES (
  Id_Pedido_Proveedor INT PRIMARY KEY,
  Id_Empleado INT NOT NULL,
  Id_Proveedor INT NOT NULL,
  Fecha_Pedido DATE NOT NULL,
  Estado VARCHAR(20),
  FOREIGN KEY (Id_Empleado) REFERENCES EMPLEADO(Id_Empleado),
  FOREIGN KEY (Id_Proveedor) REFERENCES PROVEEDORES(Id_Proveedor)
);

-- -----------------------------------------------------
-- Table `Kiosko`.`PROVEEDORES`
-- -----------------------------------------------------

CREATE TABLE PROVEEDORES (
  Id_Proveedor INT PRIMARY KEY,
  Nombre_Empresa VARCHAR(100),
  NIF_CIF VARCHAR(20) NOT NULL,
  Direccion VARCHAR(200),
  Telefono VARCHAR(20) NOT NULL,
  Contacto VARCHAR(50),
  Correo VARCHAR(100) NOT NULL
);

# Categorias
# ------------------------------------------------------------

INSERT INTO CATEGORIA (Id_Categoria, Nombre_Cat, Descripcion_Cat)
VALUES
  (1, 'gominolas', 'Productos pequeños de gomita que se puede masticar'),
  (2, 'Bolsas', 'Productos salados embolsados'),
  (3, 'Bebidas', 'Productos liquidos bebibles'),
  (4, 'Lectura', 'Productos de lectura o pasatiempos'),
  (5, 'Juguetes', 'Productos de entretenimiento para niños'),
  (6, 'FrutosAlPeso', 'Frutos secos al peso'),
  (7, 'Bombones', 'Productos relacionados con chocolates');
  
# Productos
# ------------------------------------------------------------
  
  INSERT INTO PRODUCTO (Id_Producto, Id_Categoria, Nombre_Producto, Precio_Unitario)
VALUES
  (1, 1, 'Fresitas', 350.00),
  (2, 1, 'Dedos', 200.00),
  (3, 2, 'Ruffles', 50.00),
  (4, 3, 'Coca Cola', 200.00),
  (5, 4, 'Revista Hola', 50.00),
  (6, 1, 'melones', 150.00),
  (7, 2, 'Lays', 30.00),
  (8, 3, 'Aquarius', 50.00),
  (9, 6, 'Pistachos', 15.00),
  (10, 1, 'Besitos', 100.00),
  (11, 2, 'Pelotazos', 50.00),
  (12, 3, 'Agua', 350.00),
  (13, 4, 'Autodefinidos', 50.00),
  (14, 1, 'Tiburones', 150.00),
  (15, 7, 'FerreroRoché', 30.00),
  (16, 3, 'Redbull', 50.00);
  
# Empleados
# ------------------------------------------------------------
  
  INSERT INTO EMPLEADO (Id_Empleado, DNI, Nombre, Apellidos, Direccion, Telefono, Cargo, Correo, Contratacion)
VALUES
  (1, '12345678A', 'Juan', 'Pérez García', 'Calle 1, 2, 3', '912345678', 'Gerente', 'juan.perez@tiendaonline.com', '2020-01-01'),
  (2, '98765432B', 'María', 'López Rodríguez', 'Avenida 2, 4, 5', '965432109', 'Vendedora', 'aria.lopez@tiendaonline.com', '2020-02-01'),
  (3, '74185296C', 'Pedro', 'González Martínez', 'Calle 3, 6, 7', '987654321', 'Vendedor', 'pedro.gonzalez@tiendaonline.com', '2020-03-01'),
  (4, '45678901D', 'Ana', 'Sánchez Díaz', 'Avenida 4, 8, 9', '912345678', 'Gestora', 'ana.sanchez@tiendaonline.com', '2020-04-01');
  
  
# Ventas
# ------------------------------------------------------------

  INSERT INTO TICKET_VENTA (Id_Venta, Id_Empleado, Fecha_Venta, Estado)
VALUES
  (1, 1, '2022-01-01', 'Pendiente'),
  (2, 2, '2022-01-05', 'Entregada'),
  (3, 3, '2022-01-10', 'Pendiente'),
  (4, 2, '2022-01-15', 'Entregada'),
  (5, 1, '2022-01-01', 'Pendiente'),
  (6, 2, '2022-01-05', 'Entregada'),
  (7, 3, '2022-01-10', 'Pendiente'),
  (8, 3, '2022-01-15', 'Entregada');
  
# Pedidos_Proveedores
# ------------------------------------------------------------
  
  INSERT INTO PEDIDO_PROVEEDORES (Id_Pedido_Proveedor, Id_Empleado, Id_Proveedor, Fecha_Pedido, Estado)
VALUES
  (1, 1, 1, '2022-01-02', 'Pendiente'),
  (2, 1, 2, '2022-01-06', 'Entregada'),
  (3, 1, 3, '2022-01-11', 'Pendiente'),
  (4, 1, 1, '2022-01-16', 'Entregada'),
  (5, 1, 1, '2022-02-03', 'Pendiente'),
  (6, 1, 2, '2022-02-08', 'Entregada'),
  (7, 1, 3, '2022-02-15', 'Pendiente'),
  (8, 1, 1, '2022-02-22', 'Entregada');
  
# Proveedores
# ------------------------------------------------------------
  
  INSERT INTO PROVEEDORES (Id_Proveedor, Nombre_Empresa, NIF_CIF, Direccion, Telefono, Contacto, Correo)
VALUES
  (1, 'ChuchesMil', 'A12345678', 'Calle 1', '912345678', 'Juan Pérez', 'juan.perez@proveedor1.com'),
  (2, 'GominolasFor', 'B98765432', 'Avenida 2', '965432109', 'María López', 'aria.lopez@proveedor2.com'),
  (3, 'SaladitosLuis', 'C74185296', 'Calle 3', '987654254', 'Lourdes Alonso', 'lou.des@proveedor3.com'),
  (4, 'HrnosCarl', 'A12345487', 'Calle 1', '912345678', 'Angel Ruiz', 'HrmnsCarl@proveedor1.com'),
  (5, 'Teleprom', 'B98765987', 'Avenida 2', '965432109', 'Paula Fernandez', 'Paula245@proveedor2.com'),
  (6, 'RefresHerm', 'C74589296', 'Calle 3', '987654254', 'Carla Alonso', 'Car.Al@proveedor3.com')