--Nivel 1

create table Provincia(
	nom_provincia varchar(30) not null,
	codigo_provincia smallint not null,
	constraint codigo_provincia_pk primary key (codigo_provincia) 
);

create table Seccion(
	cod_seccion smallint not null,
	nom_seccion varchar(30) not null,
	constraint pk_seccion primary key (cod_seccion)
);

create table Cargo(
	cod_cargo smallint not null,
	nom_cargo varchar(30) not null,
	constraint pk_cargo primary key (cod_cargo) 
);

create table Especialidad(
	cod_especialidad smallint not null,
	nom_especialidad varchar(40) not null,
	constraint pk_especialidad primary key (cod_especialidad)
);

-- Nivel 2

create table Localidad(
	codigo_localidad smallint not null,
	codigo_provincia smallint not null,
	nom_localidad varchar(40) not null,
	constraint codigo_localidad_pk primary key (codigo_localidad, codigo_provincia),
	constraint codigo_provincia_fk foreign key (codigo_provincia) references Provincia (codigo_provincia)
);

create table Sector(
	cod_sector smallint not null,
	cod_seccion smallint not null,
	nom_sector varchar(30) not null,
	constraint pk_sector primary key (cod_sector, cod_seccion),
	constraint fk_seccion foreign key (cod_seccion) references Seccion (cod_seccion)
);

-- Nivel 3

create table Persona(
	tipodoc char(1) not null default 'DNI' check (tipodoc in ('DNI','LC','PASAPORTE','OTRO')),
	nrodoc int2 not null,
	sexo char(1) not null,
	apenom varchar(40) not null,
	domicilio varchar(50) null,
	fenaci date null,
	cod_provivive smallint not null,
	cod_locavive smallint not null,
	cod_provinace smallint null,
	cod_locanace smallint null,
	tipodocpadre char(1) null,
	nrodocpadre int2 null,
	sexopadre char(1) null,
	tipodocmadre char(1) null,
	nrodocmadre int2 null,
	sexomadre char(1) null,
	constraint pk_persona primary key (tipodoc, nrodoc, sexo),
	constraint fk1_vive foreign key (cod_provivive, cod_locavive) references Localidad (codigo_provincia, codigo_localidad),
	constraint fk2_nace foreign key (cod_provinace, cod_locanace) references Localidad (codigo_provincia, codigo_localidad),
	constraint fk3_padre foreign key (tipodocpadre, nrodocpadre, sexopadre) references Persona (tipodoc, nrodoc, sexo),
	constraint fk4_padre foreign key (tipodocmadre, nrodocmadre, sexomadre) references Persona (tipodoc, nrodoc, sexo)
);

--Nivel 4

create table Medico(
	matricula smallint not null,
	cod_especialidad smallint not null,
	tipodoc char(1) not null,
	nrodoc int2 not null,
	sexo char not null,
	constraint pk_medico primary key (matricula),
	constraint fk1_medico foreign key (cod_especialidad) references Especialidad (cod_especialidad),
	constraint fk2_medico foreign key (tipodoc, nrodoc, sexo) references Persona (tipodoc, nrodoc, sexo),
	constraint uk_medico unique (tipodoc, nrodoc, sexo)
);

create table Empleado(
	cod_empleado int2 not null,
	tipodoc char not null,
	nrodoc int2 not null,
	sexo char not null,
	feingreso date not null,
	constraint pk_empleado primary key (cod_empleado),
	constraint fk_empleado foreign key (tipodoc, nrodoc, sexo) references Persona (tipodoc, nrodoc, sexo),
	constraint uk_empleado unique (tipodoc, nrodoc, sexo)
);

--Nivel 5

create table Sala(
	cod_sector smallint not null,
	cod_seccion smallint not null,
	nro_sala smallint not null,
	cod_especialidad smallint not null,
	cod_empleado int2 not null,
	nom_sala varchar(30) not null,
	capacidad smallint null,
	constraint pk_sala primary key (cod_sector, cod_seccion, nro_sala),
	constraint fk1_sala foreign key (cod_sector, cod_seccion) references Sector (cod_sector, cod_seccion),
	constraint fk2_sala foreign key (cod_especialidad) references Especialidad (cod_especialidad),
	constraint fk3_sala foreign key (cod_empleado) references Empleado (cod_empleado)
);

create table Historial(
	cod_empleado int2 not null,
	cod_cargo smallint not null,
	fehcainicio date not null,
	fechafin date null,
	constraint pk_historial primary key (cod_empleado, fehcainicio),
	constraint fk1_historial foreign key (cod_empleado) references Empleado (cod_empleado),
	constraint fk2_historial foreign key (cod_cargo) references Cargo (cod_cargo)
);

--Nivel 6

create table TrabajeEn(
	cod_empleado int2 not null,
	nro_sala smallint not null,
	cod_sector smallint not null,
	cod_seccion smallint not null,
	constraint pk_trabajeen primary key (cod_empleado, nro_sala, cod_sector, cod_seccion),
	constraint fk1_trabajeen foreign key (cod_empleado) references Empleado (cod_empleado),
	constraint fk2_trabajeen foreign key (nro_sala, cod_sector, cod_seccion) references Sala (nro_sala, cod_sector, cod_seccion)
);

create table Asignacion(
	nro_asignacion int2 not null,
	matricula smallint not null,
	tipodoc char not null,
	nrodoc int2 not null,
	sexo char not null,
	cod_empleado int2 not null,
	nro_sala smallint not null,
	cod_sector smallint not null,
	cod_seccion smallint not null,
	feasigna date not null,
	fesalida date null,
	constraint pk_asignacion primary key (nro_asignacion),
	constraint fk1_asignacion foreign key (matricula) references Medico (matricula),
	constraint fk2_asignacion foreign key (tipodoc, nrodoc, sexo) references Persona (tipodoc, nrodoc, sexo),
	constraint fk3_asignacion foreign key (cod_empleado) references Empleado (cod_empleado),
	constraint fk4_asignacion foreign key (nro_sala, cod_sector, cod_seccion) references Sala (nro_sala, cod_sector, cod_seccion)
);

--Modificaciones

alter table Provincia add column numero smallint not null;
alter table Provincia add constraint numero_uk unique (numero);
alter table Localidad add column numero smallint not null;
alter table Localidad add constraint numero_fk foreign key (numero) references Provincia numero_uk;
alter table Localidad drop column numero;

drop table Persona;

--Consultas

SELECT * FROM Provincia;
SELECT * FROM Localidad;
SELECT * FROM Persona;

