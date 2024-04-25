create database if not exists practica8;
create table Tiendas(
Nif varchar (10),
Nombre varchar (20),
Direccion varchar (20),
Poblacion varchar (20),
Provincia varchar (20),
CodPostal int (5)
)ENGINE = InnoDB;

/*ADD CONSTRAIN SIRVE PARA AÑADIR UNA CONDICIÓN*/
/*La clave primaria es NIF*/
alter table Tiendas 
add constraint primary key (Nif);
/*PROVINCIA ha de almacenarse en mayúscula*/
alter table Tiendas
add constraint MAYUSCU check (PROVINCIA = UPPER (PROVINCIA));
/*Cambiar Nombre a 30 caracteres y not null.*/
alter table Tiendas
MODIFY Nombre varchar (30) NOT NULL;

create table Fabricantes (
CodFabricante int (3),
Nombre varchar (15),
Pais varchar (15)
)engine = InnoDB;

/*La clave Primaria es Cod_Fabricante*/
alter table Fabricantes
add constraint primary key (CodFabricante);
/*Las columnas nombre y Pais han de almacenarse en mayuscula*/
alter table Fabricantes
add constraint MAYUSCU check (PAIS = UPPER (PAIS));
alter table Fabricantes
add constraint MAYUSCU check (NOMBRE = UPPER (NOMBRE));

create table Articulos (
Articulo varchar (20),
CodFabricante int (3),
Peso int(3),
Categoria varchar (10),
Precio_venta int (6),
Precio_Costo int (6),
Existencia int (5)
)engine = InnoDB;

/*UPPER: sE USA PARA CONVERTIR UNA CADENA DE TEXTO A MAYUSCULA*/
-- SELECT * FROM (TABLA) SOLO SE USA PARA MOSTRAR LOS INSERT.
-- SHOW FULL COLUMNS FROM (TABLA) SE USA PARA VER LAS COLUMNAS QUE TENEMOS CREADAS
-- (es lo mismo que poner DESCRIBE(TABLA) pero se mostrará mas reducido

/* La calve primaria esta formada por las columnas ARTICULO, CODfABRICANTE, PESO Y CATEGORIA*/
alter table Articulos
add constraint primary key (Articulo, CodFabricante, Peso, categoria);
/* CodFabricante es clave ajena que referencia a la tabla Fabricantes*/
alter table Articulos
add constraint foreign key (CodFabricante) references Fabricantes ON DELETE CASCADE;
/* Precio_Venta, Precio_Costo y peso han de ser menor que 0 (>0)*/
alter table Articulos
add constraint MAYORQUE0 check (Precio_Venta>0 and Precio_Costo >0 and Peso >0); 
/*Categoria ha de ser Primera, segunda o tercera*/
alter table Articulos
add constraint categoria check (Categoria IN ('Primera', 'Segunda', 'Tercera'));

create table Ventas (
Nif varchar (10),
Articulo varchar (20),
CodFabricante int (3),
Peso int (3),
Categoria varchar (10),
Fecha_Venta date,
Unidades_Vendidas int (4)
)engine = InnoDB;

/*La clave primaria está formada pos las columnas Nif, articulo, codFabricante
-- peso, categoria y fecha_venta.*/
alter table Ventas
add constraint primary key (Nif, Articulo, CodFabricante, Peso, Categoria, Fecha_Venta);
/*Nif es clave ajena que referencia a la tabla Tiendas*/
alter table Ventas
add constraint foreign key (Nif) references Tiendas ON DELETE CASCADE;




