drop database if exists inmuebles;
use inmuebles;
create database inmuebles;
CREATE TABLE Personas (
Cod_persona int primary key auto_increment,
   Dni_persona varchar(10) unique,
   Nombre varchar(50) NOT NULL,
   telefono int DEFAULT 000000000
 ) 
 comment = "Tabla Personas"
 auto_increment = 1000
 ENGINE=InnoDB DEFAULT CHARSET=latin1;
 
 CREATE TABLE Clientes (
 Cod_persona int primary key,
 Tipo_cliente enum ("vip","normal","inmobiliaria"),
 foreing key(Cod_persona) references (personas)On delete cascade, on update cascade
 ) 
 ENGINE=InnoDB DEFAULT CHARSET=latin1;
 
 
