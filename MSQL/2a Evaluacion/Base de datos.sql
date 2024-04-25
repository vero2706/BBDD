drop database if exists instituto;
create database instituto;
 use instituto;
 create table alumnos 
 (dni_alumno varchar(10) primary key, 
 nombre varchar(50) not null, 
 telefono int, 
 direccion varchar(100), 
 edad int not null, 
 categoria enum("A","B","C") default 'A', 
 sexo char(1) not null, 
 repetidor bool,
 nota_media numeric(4,2), 
 fecha_nac date,
 dni_delegado varchar(10),
 foreign key (dni_delegado) references alumnos(dni_alumno) on delete set null on update no action)
 engine='InnoDB';
 

create table tipo_asignatura
(tipo int primary key,
descripcion varchar(100))
engine='InnoDB';  

create table asignaturas
(id_asignatura int primary key,
nombre varchar(35) not null,
horas int,
tipo int,
foreign key (tipo) references tipo_asignatura(tipo) on delete set null on update cascade
)
engine='InnoDB';

 create table cursa_asignaturas
 (dni_alumno varchar(10) ,
 id_asignatura int,
 primary key (dni_alumno,id_asignatura),
 foreign key (dni_alumno) references alumnos (dni_alumno) on delete cascade on update cascade,
 foreign key (id_asignatura) references asignaturas(id_asignatura) on delete cascade on update cascade)
 engine='InnoDB';

insert into alumnos values('12345679p','ginebra',8765432,"calle roble",23,'B','M',false,8.5,'2000-02-24',null) ; 
insert into alumnos values('12345680k','maria',21345432,"calle roble",25,'B','M',false,5,'2000-02-24','12345679p') ; 
insert into alumnos values('12345681f','cristina',9876543,"calle acacia",20,'A','M',false,5.3,'2000-02-24','12345679p') ;
insert into alumnos values('12345682r','david',67532412,"calle acacia",19,'A','H',false,6.4,'2000-02-24','12345679p') ; 
insert into alumnos values('12345683t','paco',675897643,"calle encina",37,'C','H',false,8.5,'2000-02-24','12345679p') ; 
insert into alumnos values('12345684g','juan',654327689,"calle encina",18,'C','H',false,9.2,'2000-02-24','12345679p') ;
insert into alumnos values('12345685t','fernando',64321458,"calle fresno",27,'A','H',false,8.4,'2000-02-24','12345679p') ; 
insert into alumnos values('12345686u','roberto',456327832,"calle fresno",21,'B','H',false,9.2,'2000-02-24','12345679p') ; 
insert into alumnos values('12345687v','veronica',653543178,"calle chopo",24,'B','M',false,8.3,'2000-02-24','12345679p') ; 
insert into alumnos values('12345688h','gabriela',65789023,"calle chopo",26,'A','M',false,7.6,'2000-02-24','12345679p') ; 
insert into alumnos values('12345689d','ines',634453245,"calle pino",28,null,'M',false,9.2,'2000-02-24','12345679p') ; 
insert into alumnos values('12345690o','manu',null,"calle pino",30,null,'H',false,7.8,'2000-02-24','12345679p') ; 
insert into alumnos values('12345691w','jonatan',null,null,26,'B','H',false,7.5,'2000-02-24','12345679p') ; 

insert into tipo_asignatura values (1,'teorica');
insert into tipo_asignatura values (2,'practica');
insert into tipo_asignatura values (3, 'practicas en empresa');
insert into tipo_asignatura values (4,'comodin');

insert into asignaturas values(1,'bases de datos',200,1); 
insert into asignaturas values(2,'programacion',250,1); 
insert into asignaturas values(3,'redes',100,2); 
insert into asignaturas values(4,'analisis',180,2); 
insert into asignaturas values(5,'formacion y orientacion laboral',150,3);

insert into cursa_asignaturas values('12345683t',1);
insert into cursa_asignaturas values('12345683t',3);
insert into cursa_asignaturas values('12345683t',5);
insert into cursa_asignaturas values('12345680k',2);
insert into cursa_asignaturas values('12345680k',3);
insert into cursa_asignaturas values('12345680k',5);
insert into cursa_asignaturas values('12345679p',4);
insert into cursa_asignaturas values('12345679p',2);
insert into cursa_asignaturas values('12345679p',1);
insert into cursa_asignaturas values('12345691w',1);
insert into cursa_asignaturas values('12345691w',2);
insert into cursa_asignaturas values('12345691w',3);
insert into cursa_asignaturas values('12345686u',1);
insert into cursa_asignaturas values('12345686u',3);
insert into cursa_asignaturas values('12345686u',5);
insert into cursa_asignaturas values('12345687v',2);
insert into cursa_asignaturas values('12345687v',3);
insert into cursa_asignaturas values('12345687v',5);
insert into cursa_asignaturas values('12345689d',4);
insert into cursa_asignaturas values('12345689d',2);
insert into cursa_asignaturas values('12345689d',1);
insert into cursa_asignaturas values('12345690o',1);
insert into cursa_asignaturas values('12345690o',2);
insert into cursa_asignaturas values('12345690o',3);
