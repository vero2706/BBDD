create database if not exists practicaObligatoria;
create table hoteles(
Nombre varchar (50)NOT NULL,
ubicacion varchar (100),
numero_habitaciones int,
primary KEY (nombre)
)ENGINE = InnoDB;

create table habitaciones(
Id_habitacion int NOT NULL,
numero int,
planta int,
metros_cadrados int,
nombre_hotel varchar (50),
primary key (Id_habitacion),
foreign key (nombre_hotel) references hoteles(Nombre) on delete set null on update no action
)ENGINE = InnoDB;

create table clientes(
dni_cli varchar (10) NOT NULL,
Nombre varchar (50),
edad int,
primary key (dni_cli) 
)ENGINE = InnoDB;

create table reservas(
Id_reserva int NOT NULL,
Id_habitacion int,
fecha date,
primary key (Id_reserva),
foreign key (Id_habitacion) references habitaciones(Id_habitacion) on delete set null on update no action
)ENGINE = InnoDB;

create table reserva_cliente(
Id_reserva int NOT NULL,
dni_cli varchar (10) NOT NULL,
primary key (Id_reserva, dni_cli),
foreign key (Id_reserva) references reservas(Id_reserva),
foreign key (dni_cli) references clientes(dni_cli) 
)ENGINE = InnoDB;