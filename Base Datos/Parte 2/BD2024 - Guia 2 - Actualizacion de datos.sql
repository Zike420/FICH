-- Agregados a la carga de datos para mejorar resultados de consultas

-- Actualiza datos de productos
insert into producto.categoria values (1,0,1, 'Insumos informáticos');
insert into producto.categoria values (2,0,2,'Servicios informáticos');
insert into producto.subcategoria values (1,0,1,1,'Pen drives');
update producto.producto set id_subcategoria = 1
where codigo between 1019 and  1026;

-- Actualiza datos de personas

insert into persona.provincia values (1,0,62, 'Santa Fe');
insert into persona.provincia values (2,0,63, 'Entre Ríos');
insert into persona.localidad values (1,0,1,100, 'Santa Fe',3000);
insert into persona.localidad values (2,0,1,101, 'Rosario',2000);
insert into persona.localidad values (3,0,1,108, 'Vila',2301);

update persona.persona set id_localidad = 1 where codigo BETWEEN 1 and 100;
update persona.persona set id_localidad = 2 where codigo BETWEEN 101 and 200;
update persona.persona set id_localidad = 3 where codigo > 200;
update persona.persona set id_localidad = null where codigo > 250;

-- Actualización de correo de algunas personas físicas

update persona.persona set email = 'pf@gmail.com' where id between 1 and 10;
