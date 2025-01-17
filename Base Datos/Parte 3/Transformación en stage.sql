-- Transformación inicial de datos en STG y creación del dimensional en DW

drop schema if exists stg cascade;
create schema stg;
drop schema if exists dw cascade;
create schema dw;

select * into stg.cliente_dep from cliente;
select * into stg.categoria_dep from categoria;
select * into stg.empleado_dep from empleado;
select * into stg.factura_detalle_dep from factura_detalle;
select * into stg.factura_venta_dep from factura_venta;
select * into stg.ingreso_producto_dep from ingreso_producto;
select * into stg.producto_dep from producto;
select * into stg.promocion_dep from promocion;
select * into stg.proveedor_dep from proveedor;
select * into stg.region_dep from region;
select * into stg.subcategoria_dep from subcategoria;
select * into stg.sucursal_dep from sucursal;
select * into stg.tipo_pago_dep from tipo_pago;
select * into stg.tipo_promocion_dep from tipo_promocion;

-- ##################################################################################
--1 tipo de vivienda

alter table stg.cliente_dep add column id_tipo_vivienda int4;
begin transaction;
  update stg.cliente_dep set id_tipo_vivienda =
    case when tipo_alojamiento = 'INQUILINO' then 1
         when tipo_alojamiento = 'PROPIETARIO' then 2
         when tipo_alojamiento = 'DEPENDIENTE' then 3
    end;
commit transaction;
drop table if exists dw.d_tipo_vivienda cascade;
create table dw.d_tipo_vivienda (
id int4,
nombre_tipo_vivienda varchar(50),
constraint pk_tipo_vivienda primary key (id)
);
begin transaction;
  insert into dw.d_tipo_vivienda values (1, 'INQUILINO'), (2, 'PROPIETARIO'), (3, 'DEPENDIENTE'), (4, 'NO INFORMADO');
commit transaction;

-- ##################################################################################
--2 genero

alter table stg.cliente_dep add column id_genero int4;
begin transaction;
  update stg.cliente_dep set id_genero =
    case when genero = 'MASCULINO' then 1
         when genero = 'FEMENINO' then 2
         else 3
    end;
commit transaction;
drop table if exists dw.d_genero cascade;
create table dw.d_genero (
id int4,
nombre_genero varchar(50),
constraint pk_genero primary key (id)
);
begin transaction;
  insert into dw.d_genero values (1, 'MASCULINO'), (2, 'FEMENINO'), (3, 'OTRO');
commit transaction;

-- ##################################################################################
--3 nivel educativo

alter table stg.cliente_dep add column id_nivel_educativo int4;
begin transaction;
  update stg.cliente_dep set id_nivel_educativo = 
    case when nivel_educativo = 'SECUNDARIO' then 1
         when nivel_educativo = 'UNIVERSITARIO' then 2
         when nivel_educativo = 'POSTGRADO' then 3
         when nivel_educativo = 'OTRO' then 4
    end;
commit transaction;
drop table if exists dw.d_nivel_educativo cascade;
create table dw.d_nivel_educativo (
id int4,
nombre_nivel_educativo varchar(50),
constraint pk_nivel_educativo primary key (id)
);
begin transaction;
  insert into dw.d_nivel_educativo values (1, 'SECUNDARIO'), (2, 'UNIVERSITARIO'), (3, 'POSTGRADO'), (4, 'OTRO');
commit transaction;

-- ##################################################################################
--4 rango de ingresos

alter table stg.cliente_dep add column id_rango_ingresos int4;
begin transaction;
  update stg.cliente_dep set id_rango_ingresos = 
    case when rango_ingresos = 'Menos de 50.000' then 1
         when rango_ingresos = '50.000 - 100.000' then 2
         when rango_ingresos = '100.001 - 150.000' then 3
         when rango_ingresos = '150.001 - 200.000' then 4
         when rango_ingresos = '200.001 - 250.000' then 5
         when rango_ingresos = '250.001 - 300.000' then 6
         when rango_ingresos = '300.001 - 350.000' then 7
         when rango_ingresos = '350.001 - 400.000' then 8
         when rango_ingresos = '400.001 - 450.000' then 9
         when rango_ingresos = '450.001 - 500.000' then 10
         when rango_ingresos = 'Más de 500.000' then 11
         when rango_ingresos is null then 12
    end;
commit transaction;
drop table if exists dw.d_rango_ingresos cascade;
create table dw.d_rango_ingresos (
id int4,
rango_ingresos varchar(50),
constraint pk_rango_ingresos primary key (id)
);
begin transaction;
  insert into dw.d_rango_ingresos values 
    (1,'Menos de 50.000'), (2,'50.000 - 100.000'), (3,'100.001 - 150.000'),
    (4, '150.001 - 200.000'), (5,'200.000 - 250.000'), (6,'250.000 - 300.000'), 
    (7,'300.000 - 350.000'),  (8,'350.000 - 400.000'), (9, '400.000 - 450.000'), 
    (10,'450.000 - 500.000'), (11, 'Más de 500.000'), (12,'NO INFORMADO');
commit transaction;

-- ##################################################################################
--5 grupo familiar

alter table stg.cliente_dep add column id_grupo_familiar int4;
begin transaction;
  update stg.cliente_dep set id_grupo_familiar = 
    case when grupo_familiar = '1' then 1
         when grupo_familiar = '2' then 2
         when grupo_familiar = '3' then 3
         when grupo_familiar = '4' then 4
         when grupo_familiar = '5' then 5
         when grupo_familiar = '6' then 6
         when grupo_familiar = 'Más de 6' then 7
         when grupo_familiar is null then 8
    end;
commit transaction;
drop table if exists dw.d_grupo_familiar cascade;
create table dw.d_grupo_familiar (
id int4,
grupo_familiar varchar(50),
constraint pk_grupo_familiar primary key (id)
);
begin transaction;
  insert into dw.d_grupo_familiar values 
    (1,'1'), (2,'2'), (3,'3'), (4,'4'), (5,'5'), (6,'6'), (7,'7'), (8,'NO INFORMADO');
commit transaction;

-- ##################################################################################
--6 estado civil

alter table stg.cliente_dep add column id_estado_civil int4;
begin transaction;
  update stg.cliente_dep set id_estado_civil = 
    case when estado_civil = 'SOLTERO' then 1
         when estado_civil = 'CASADO' then 2
         when estado_civil = 'PREVIAMENTE CASADO' then 3
         when estado_civil is null then 4
    end;
commit transaction;
drop table if exists dw.d_estado_civil cascade;
create table dw.d_estado_civil (
id int4,
nombre_estado_civil varchar(50),
constraint pk_estado_civil primary key (id)
);
begin transaction;
  insert into dw.d_estado_civil values 
    (1,'SOLTERO'), (2,'CASADO'), (3,'PREVIAMENTE CASADO'), (4,'NO INFORMADO');
commit transaction;

-- ##################################################################################
--7 tipo de pago

drop table if exists dw.d_tipo_pago cascade;
create table dw.d_tipo_pago (
id int4,
nombre_tipo_pago varchar(50),
constraint pk_tipo_pago primary key (id)
);
begin transaction;
  insert into dw.d_tipo_pago select * from stg.tipo_pago_dep;
commit transaction; 

-- ##################################################################################
--8 promocion

drop table if exists dw.d_promocion cascade;
create table dw.d_promocion (
id int4,
tipo_promocion varchar(50),
nombre_promocion varchar(50),
constraint pk_promocion primary key (id)
);
begin transaction;
  insert into dw.d_promocion 
    select p.promocion_id, t.promo_tipo_desc, p.promocion_desc from stg.promocion_dep p, stg.tipo_promocion_dep t 
      where p.promo_tipo_id = t.promo_tipo_id;
commit transaction; 

-- ##################################################################################
--9 sucursal

drop table if exists dw.d_sucursal cascade;
create table dw.d_sucursal (
id int4,
nombre_region varchar(50),
nombre_sucursal varchar(50),
constraint pk_sucursal primary key (id)
);
begin transaction;
  insert into dw.d_sucursal 
    select s.sucursal_id, r.region_desc, s.sucursal_desc from stg.sucursal_dep s, stg.region_dep r
      where s.region_id = r.region_id;
commit transaction; 

-- ##################################################################################
--10 empleado

drop table if exists dw.d_empleado cascade;
create table dw.d_empleado (
id int4,
nombre_empleado varchar(50),
constraint pk_empleado primary key (id)
);
begin transaction;
  insert into dw.d_empleado 
    select empleado_id, empleado_desc from stg.empleado_dep;
commit transaction; 
 
-- ##################################################################################
--11 proveedor

drop table if exists dw.d_proveedor cascade;
create table dw.d_proveedor (
id int4,
nombre_proveedor varchar(50),
constraint pk_proveedor primary key (id)
);
begin transaction;
  insert into dw.d_proveedor 
    select proveedor_id, proveedor_desc from stg.proveedor_dep;
commit transaction; 

-- ##################################################################################
--12 cliente

drop table if exists dw.d_cliente cascade;
create table dw.d_cliente (
id int4,
nombre_cliente varchar(50),
constraint pk_cliente primary key (id)
);
begin transaction;
  insert into dw.d_cliente 
    select cliente_id, cliente_nombre from stg.cliente_dep;
commit transaction; 

-- ##################################################################################
--13 producto

drop table if exists dw.d_producto cascade;
create table dw.d_producto (
id int4,
nombre_categoria varchar(50),
nombre_subcategoria varchar(50),
nombre_producto varchar(50),
constraint pk_producto primary key (id)
);
begin transaction;
  insert into dw.d_producto 
    select p.producto_id, c.categoria_desc, s.subcategoria_desc, p.producto_desc
      from stg.producto_dep p, stg.categoria_dep c, stg.subcategoria_dep s
      where p.subcategoria_id = s.subcategoria_id and s.categoria_id = c.categoria_id;
commit transaction; 

-- ##################################################################################
--14 edad

drop table if exists dw.d_edad;
create table dw.d_edad (
  id int8 not null,
  rango_edad_venta varchar(20),
  constraint pk_edad primary key (id)
);

create sequence stg.edad
  start with 0
  increment by 1
  maxvalue 10001
  minvalue -1;
insert into dw.d_edad select * from (select 1+ nextval('stg.edad') from generate_series (0,149) )as foo;
begin transaction;
  update dw.d_edad set rango_edad_venta = '1 a 16' where id < 17;
  update dw.d_edad set rango_edad_venta = '17 a 25' where id > 16 and id < 26;
  update dw.d_edad set rango_edad_venta = '26 a 40' where id > 25 and id < 41;
  update dw.d_edad set rango_edad_venta = '41 a 50' where id > 40 and id < 51;
  update dw.d_edad set rango_edad_venta = '51 a 60' where id > 50 and id < 61;
  update dw.d_edad set rango_edad_venta = '61 a 65' where id > 60 and id < 66;
  update dw.d_edad set rango_edad_venta = '66 a 70' where id > 65 and id < 71;
  update dw.d_edad set rango_edad_venta = '71 a 75' where id > 70 and id < 76;
  update dw.d_edad set rango_edad_venta = '76 a 80' where id > 75 and id < 81;
  update dw.d_edad set rango_edad_venta = '81 a 85' where id > 80 and id < 86;
  update dw.d_edad set rango_edad_venta = '86 a 90' where id > 85 and id < 91;
  update dw.d_edad set rango_edad_venta = '91 a 95' where id > 90 and id < 96;
  update dw.d_edad set rango_edad_venta = '96 a 100' where id > 95 and id < 101;
  update dw.d_edad set rango_edad_venta = 'Fuera de rango' where id > 100;
  insert into dw.d_edad values (10000, 'Error de datos');
commit transaction;
drop sequence stg.edad;

-- ##################################################################################
--15 fecha

drop table if exists dw.d_fecha;
create table dw.d_fecha
(
  id						int8,
  fecha						date,
  epoch						bigint,
  dia_del_mes   			smallint,
  dia_nombre    			varchar(9),
  dia_nombre_corto			varchar(3),
  dia_semana				smallint,
  dia_trimestre				smallint,
  dia_anio					smallint,
  semana_mes				smallint,
  semana_anio				smallint,
  mes_numero				smallint,
  mes_nombre				varchar(10),
  mes_nombre_corto			varchar(3),
  trimestre_numero			smallint,
  trimestre_nombre			varchar(20),
  trimestre_nombre_corto	varchar(9),
  bimestre_nombre			varchar(20),
  bimestre_nombre_corto		varchar(9),
  semestre_nombre 			varchar(20),
  anio_actual				smallint,
  fecha_primerdia_semana	date,
  fecha_ultimodia_semana	date,
  fecha_comienzo_trimestre	date,
  fecha_fin_trimestre		date,
  mes2_anio4				char(6),
  mes2_dia2_anio4			char(10),
  es_finde					boolean,
  es_feriado				boolean,
  nombre_feriado			varchar(20),
  fechar					varchar(10),
  constraint pk_fecha primary key (id)
);

insert into dw.d_fecha 
   select  
       to_char(datum,'yyyymmdd')::int as id_fecha,
       datum as fecha_actual,
       extract(epoch from datum) as epoch,
       extract(day from datum) as dia_mes,
       trim(case when to_char(datum,'d') = '1' then 'Domingo'
       			 when to_char(datum,'d') = '2' then 'Lunes'
       			 when to_char(datum,'d') = '3' then 'Martes'
       			 when to_char(datum,'d') = '4' then 'Miércoles'
       			 when to_char(datum,'d') = '5' then 'Jueves'
       			 when to_char(datum,'d') = '6' then 'Viernes'
       			 when to_char(datum,'d') = '7' then 'Sábado'
       		end) dia_nombre,
       trim(case when to_char(datum,'d') = '1' then 'Dom'
       			 when to_char(datum,'d') = '2' then 'Lun'
       			 when to_char(datum,'d') = '3' then 'Mar'
       			 when to_char(datum,'d') = '4' then 'Mie'
       			 when to_char(datum,'d') = '5' then 'Jue'
       			 when to_char(datum,'d') = '6' then 'Vie'
       			 when to_char(datum,'d') = '7' then 'Sab'
       		end) dia_nombre_corto,
       extract(isodow from datum) AS dia_semana,
       datum - date_trunc('quarter',datum)::date +1 as dia_trimestre,
       extract(doy from datum) as dia_anio,
       to_char(datum,'W')::int as semana_mes,
       extract(week from datum) as semana_anio,
       extract(month from datum) as mes_numero,
       trim(case when to_char(datum,'mm') = '01' then 'Enero'
        		 when to_char(datum,'mm') = '02' then 'Febrero'
         		 when to_char(datum,'mm') = '03' then 'Marzo'
         		 when to_char(datum,'mm') = '04' then 'Abril'
         		 when to_char(datum,'mm') = '05' then 'Mayo'
         		 when to_char(datum,'mm') = '06' then 'Junio'
         		 when to_char(datum,'mm') = '07' then 'Julio'
         		 when to_char(datum,'mm') = '08' then 'Agosto'
         		 when to_char(datum,'mm') = '09' then 'Septiembre'
         		 when to_char(datum,'mm') = '10' then 'Octubre'
         		 when to_char(datum,'mm') = '11' then 'Noviembre'
         		 when to_char(datum,'mm') = '12' then 'Diciembre'
         	end) as mes_nombre,
       trim(case when to_char(datum,'mm') = '01' then 'Ene'
       			 when to_char(datum,'mm') = '02' then 'Feb'
       			 when to_char(datum,'mm') = '03' then 'Mar'
       			 when to_char(datum,'mm') = '04' then 'Abr'
       			 when to_char(datum,'mm') = '05' then 'May'
       			 when to_char(datum,'mm') = '06' then 'Jun'
       			 when to_char(datum,'mm') = '07' then 'Jul'
       			 when to_char(datum,'mm') = '08' then 'Ago'
       			 when to_char(datum,'mm') = '09' then 'Sep'
       			 when to_char(datum,'mm') = '10' then 'Oct'
       			 when to_char(datum,'mm') = '11' then 'Nov'
       			 when to_char(datum,'mm') = '12' then 'Dic'
       		end) as mes_nombre_corto,
       extract(quarter from datum) as trimestre_numero,
       case
         		 when extract(quarter from datum) = 1 then 'Primer trimestre'
		         when extract(quarter from datum) = 2 then 'Segundo trimestre'
         		 when extract(quarter from datum) = 3 then 'Tercer trimestre'
		         when extract(quarter from datum) = 4 then 'Cuarto trimestre'
	        end as trimestre_nombre,
       case
		         when extract(quarter from datum) = 1 then 'Trim.1'
		         when extract(quarter from datum) = 2 then 'Trim.2'
		         when extract(quarter from datum) = 3 then 'Trim.3'
		         when extract(quarter from datum) = 4 then 'Trim.4'
	        end as trimestre_nombre_corto,
       trim(case when to_char(datum,'mm') = '01' then 'Primer bimestre'
	         	 when to_char(datum,'mm') = '02' then 'Primer bimestre'
	         	 when to_char(datum,'mm') = '03' then 'Segundo bimestre'
	         	 when to_char(datum,'mm') = '04' then 'Segundo bimestre'
	         	 when to_char(datum,'mm') = '05' then 'Tercer bimestre'
	         	 when to_char(datum,'mm') = '06' then 'Tercer bimestre'
	         	 when to_char(datum,'mm') = '07' then 'Cuarto bimestre'
	         	 when to_char(datum,'mm') = '08' then 'Cuarto bimestre'
	         	 when to_char(datum,'mm') = '09' then 'Quinto bimestre'
	         	 when to_char(datum,'mm') = '10' then 'Quinto bimestre'
	         	 when to_char(datum,'mm') = '11' then 'Sexto bimestre'
	         	 when to_char(datum,'mm') = '12' then 'Sexto bimestre'
	       end) as bimestre_nombre,
       trim(case when to_char(datum,'mm') = '01' then 'Bim.1'
		         when to_char(datum,'mm') = '02' then 'Bim.1'
		         when to_char(datum,'mm') = '03' then 'Bim.2'
		         when to_char(datum,'mm') = '04' then 'Bim.2'
		         when to_char(datum,'mm') = '05' then 'Bim.3'
		         when to_char(datum,'mm') = '06' then 'Bim.3'
		         when to_char(datum,'mm') = '07' then 'Bim.4'
		         when to_char(datum,'mm') = '08' then 'Bim.4'
		         when to_char(datum,'mm') = '09' then 'Bim.5'
		         when to_char(datum,'mm') = '10' then 'Bim.5'
		         when to_char(datum,'mm') = '11' then 'Bim.6'
		         when to_char(datum,'mm') = '12' then 'Bim.6'
		    end) as bimestre_nombre_corto,
       trim(case when to_char(datum,'mm') = '01' then 'Primer semestre'
		         when to_char(datum,'mm') = '02' then 'Primer semestre'
		         when to_char(datum,'mm') = '03' then 'Primer semestre'
        		 when to_char(datum,'mm') = '04' then 'Primer semestre'
		         when to_char(datum,'mm') = '05' then 'Primer semestre'
		         when to_char(datum,'mm') = '06' then 'Primer semestre'
		         when to_char(datum,'mm') = '07' then 'Segundo semestre'
		         when to_char(datum,'mm') = '08' then 'Segundo semestre'
		         when to_char(datum,'mm') = '09' then 'Segundo semestre'
		         when to_char(datum,'mm') = '10' then 'Segundo semestre'
		         when to_char(datum,'mm') = '11' then 'Segundo semestre'
		         when to_char(datum,'mm') = '12' then 'Segundo semestre'
		    end) as semestre_nombre,
       extract(year from datum) as anio_actual,
       datum +(1 -extract(isodow from datum))::int as primer_dia_semana,
       datum +(7 -extract(isodow from datum))::int as ultimo_dia_semana,
       date_trunc('quarter',datum)::date as primer_dia_trimestre,
       (date_trunc('quarter',datum) +interval '3 MONTH - 1 day')::date as ultimo_dia_trimestre,
       to_char(datum,'mmyyyy') as mes2_anio4,
       to_char(datum,'mmddyyyy') as mes2_dia2_anio4,
       case
         	when extract(isodow from datum) in (6,7) then true
         	else false
       		end as es_finde,
       false as es_feriado,
       'Laborable' as nombre_feriado,
       substring(to_char(datum,'mmddyyyy')from 5 for 4)||'/'||substring(to_char(datum,'mmddyyyy') from 1 for 2)||'/'||substring(to_char(datum,'mmddyyyy') from 3 for 2)
      from (select '1970-01-01'::date+ sequence.day as datum from generate_series (0,29000) as sequence (day)
      group by sequence.day) DQ order by 1;

-- ##################################################################################
--16 ingreso

drop table if exists dw.h_ingreso;
create table dw.h_ingreso (
id_proveedor int4,
id_fecha int4,
id_producto int4,
cn_ingreso int4,
cantidad_recibida smallint
);
begin transaction;
  insert into dw.h_ingreso
    select p.proveedor_id, to_char(ip.fecha_recibido,'yyyymmdd')::int, ip.producto_id, ip.ingreso_id, ip.cantidad_recibida 
      from stg.producto_dep p, stg.ingreso_producto_dep ip
      where p.producto_id = ip.producto_id;
commit transaction;

-- ##################################################################################
--17 ventas

drop table if exists dw.h_ventas;
create table dw.h_ventas (
id_producto int4,
id_empleado int4,
id_sucursal int4,
id_cliente int4,
id_promocion int4,
id_tipo_pago int4,
id_fecha int4,
id_edad int4,
id_tipo_vivienda int4,
id_genero int4,
id_nivel_educativo int4,
id_rango_ingresos int4,
id_grupo_familiar int4,
id_estado_civil int4,
cn_pedido int4,
monto_ingreso numeric,
monto_costo numeric,
monto_descuento numeric,
cantidad_unidades numeric
);

begin transaction;
  insert into dw.h_ventas
    select d.producto_id, c.empleado_id, e.sucursal_id, c.cliente_id, c.promocion_id,
           c.tipo_pago_id, to_char(c.fecha_pedido,'yyyymmdd')::int, 
           extract(year from age(c.fecha_pedido,cli.fecha_nacimiento))::smallint,
           cli.id_tipo_vivienda, cli.id_genero, cli.id_nivel_educativo, cli.id_rango_ingresos,
           cli.id_grupo_familiar, cli.id_estado_civil, c.pedido_id, d.mnt_ingresos,
           d.mnt_costo, d.mnt_descuento, d.cnt_unidades_vendidas  
      from stg.factura_detalle_dep d, stg.factura_venta_dep c, stg.empleado_dep e,
           stg.cliente_dep cli
        where d.pedido_id = c.pedido_id and c.empleado_id = e.empleado_id
          and c.cliente_id = cli.cliente_id;
commit transaction;

-- INTEGRIDAD
alter table dw.h_ingreso 
  add constraint fk_ingreso_proveedor foreign key (id_proveedor) references dw.d_proveedor(id),
  add constraint fk_ingreso_fecha foreign key (id_fecha) references dw.d_fecha(id),
  add constraint fk_ingreso_producto foreign key (id_producto) references dw.d_producto(id);

alter table dw.h_ventas 
  add constraint fk_ventas_genero foreign key (id_genero) references dw.d_genero(id),
  add constraint fk_ventas_tipovivienda foreign key (id_tipo_vivienda) references dw.d_tipo_vivienda(id),
  add constraint fk_ventas_edad foreign key (id_edad) references dw.d_edad(id),
  add constraint fk_ventas_cliente foreign key (id_cliente) references dw.d_cliente(id),
  add constraint fk_ventas_producto foreign key (id_producto) references dw.d_producto(id),
  add constraint fk_ventas_fecha foreign key (id_fecha) references dw.d_fecha(id),
  add constraint fk_ventas_sucursal foreign key (id_sucursal) references dw.d_sucursal(id),
  add constraint fk_ventas_empleado foreign key (id_empleado) references dw.d_empleado(id),
  add constraint fk_ventas_promocion foreign key (id_promocion) references dw.d_promocion(id),
  add constraint fk_ventas_tipopago foreign key (id_tipo_pago) references dw.d_tipo_pago(id),
  add constraint fk_ventas_estadocivil foreign key (id_estado_civil) references dw.d_estado_civil(id),
  add constraint fk_ventas_grupofamiliar foreign key (id_grupo_familiar) references dw.d_grupo_familiar(id),
  add constraint fk_ventas_niveleducativo foreign key (id_nivel_educativo) references dw.d_nivel_educativo(id),
  add constraint fk_ventas_rangoingresos foreign key (id_rango_ingresos) references dw.d_rango_ingresos(id);
