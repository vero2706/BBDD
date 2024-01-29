create database if not exists hospital;
use hospital;
 create table medico(
 DNI_medico Varchar(10) primary key,
 Nombre_med Varchar(30) Not null,
 Anno_colegio Int Not null default 1900,
direccion Varchar(50)
 );
 create table paciente(
 Dni_paciente Varchar(10) primary key,
 Dni_medico Varchar(10),
 Nombre_pac Varchar(30) Not null,
 Dir_pac Varchar(50),
 Telefono Varchar(10),
 foreign key (dni_medico) references medico(dni_medico)
 );
#se crea la tabla sala antes que la de trabaja para que pueda referenciarla

create table sala(
Id_sala INT primary key,
Ubicación Varchar(50) Not null
);
 
 create table trabaja(
 DNI_medico Varchar(10) primary key,
 Id_sala int(10) primary key,
 Horario Varchar(40) Not null,
 foreign key (DNI_medico) references medico(dni_medico)on delete cascade,
 foreign key (Id_sala) references sala(id_sala)
 );
 
