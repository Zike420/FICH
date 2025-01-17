-- Select - Guía 2
-- Predicado de Comparación (=)
SELECT * FROM producto.producto WHERE precio_unitario > 100500;

Select * FROM venta.factura where numero = 110

-- Predicado BETWEEN
SELECT * FROM producto.producto WHERE precio_unitario BETWEEN 100500 and 100555;
SELECT * FROM venta.factura WHERE fecha BETWEEN '2023-01-01' AND '2023-06-30';

-- Predicado IN o NOT IN
-- Agregado para mejorar datos cargados
-- insert into producto.categoria values (1,0,1, 'Insumos informáticos');
--insert into producto.subcategoria values (1,0,1,1,'Pen drives');
--update producto.producto set id_subcategoria = 1
--where codigo between 1019 and  1026;

SELECT * FROM producto.producto WHERE id_subcategoria IN (1, 3, 5);

-- Agregado para mejorar datos cargados
/*
insert into persona.provincia values (1,0,62, 'Santa Fe');
insert into persona.provincia values (2,0,63, 'Entre Ríos');
insert into persona.localidad values (1,0,1,100, 'Santa Fe',3000);
insert into persona.localidad values (2,0,1,101, 'Rosario',2000);
insert into persona.localidad values (3,0,1,108, 'Vila',2301);

select top 10 * from persona.persona
update persona.persona set id_localidad = 1 where codigo BETWEEN 1 and 100;

update persona.persona set id_localidad = 2 where codigo BETWEEN 101 and 200;

update persona.persona set id_localidad = 3 where codigo > 200;

update persona.persona set id_localidad = null where codigo > 250;

select distinct id_localidad from persona.persona p 
*/

SELECT * FROM persona.localidad WHERE descripcion IN ('Santa Fe', 'Rosario', 'Paraná')

-- Opción 1: Usando IN
SELECT * FROM persona.persona p
WHERE id_localidad IN (SELECT id FROM persona.localidad WHERE descripcion IN ('Santa Fe', 'Rosario', 'Paraná'));
-- Opción 2: Join
select * from persona.persona p
inner join persona.localidad l on (p.id_localidad=l.id)
where l.descripcion in ('Santa Fe', 'Rosario', 'Paraná')


-- Predicado LIKE o NOT LIKE
SELECT descripcion AS nombre_marca FROM producto.marca WHERE descripcion LIKE 'S%';

SELECT *,descripcion AS descripcion_producto FROM producto.producto 
WHERE descripcion LIKE '%USB%'
AND descripcion like '%Adaptador%';


-- Predicado NULL
select * from producto.producto p where id_subcategoria  is null;

-- Paso 1: clientes con mail registrado
select count(*) from PERSONA.CLIENTE c 
inner join persona.persona p on (c.id_persona=p.id)
where p.email is not null
--940 filas
-- Paso 2: Join con PF y PJ
select c.codigo,c.fecha_alta, 
       p.email,
       p.tipo,
       pf.apellido, pf.nombre,
       pj.denominacion
from PERSONA.CLIENTE c 
inner join persona.persona p on (c.id_persona=p.id)
left outer join persona.persona_fisica pf on (pf.id_persona=p.id)
left outer join persona.persona_juridica pj on (pj.id_persona=p.id)
where p.email is not null
-- Paso 3: Mejoramos la salida
select c.codigo,c.fecha_alta, 
       p.email,
       (case p.tipo when 'FISICA' 
          then pf.apellido || ', ' || pf.nombre
          else pj.denominacion
       end) as nombre
from persona.cliente c 
inner join persona.persona p on (c.id_persona=p.id)
left outer join persona.persona_fisica pf on (pf.id_persona=p.id)
left outer join persona.persona_juridica pj on (pj.id_persona=p.id)
where p.email is not null
order by c.codigo 


SELECT * FROM producto.producto WHERE precio_unitario IS NULL;
SELECT * FROM persona.persona WHERE email IS not NULL;

-- Predicado EXISTS

SELECT * FROM producto.categoria c
WHERE EXISTS (SELECT * FROM producto.producto p 
              inner join producto.subcategoria s on (p.id_subcategoria = s.id)
              WHERE c.id = s.id_categoria);

-- y si fuera mostrar las categorías que no tienen definido producto?
SELECT * FROM producto.categoria c
where NOT EXISTS (SELECT * FROM producto.producto p 
              inner join producto.subcategoria s on (p.id_subcategoria = s.id)
              WHERE c.id = s.id_categoria);


SELECT * FROM producto.marca M
WHERE EXISTS (SELECT 1 FROM producto.producto p
              WHERE p.id_marca = m.id 
             AND precio_unitario > 100500);

-- Funciones Agregadas

-- Funciones Agregadas Básicas
-- sqlserver
SELECT CAST(YEAR(fecha) AS VARCHAR(4)) + '-' + RIGHT('0' + CAST(MONTH(fecha) AS VARCHAR(2)), 2) AS mes, AVG(total) AS promedio_facturado 
FROM venta.factura 
GROUP BY CAST(YEAR(fecha) AS VARCHAR(4)) + '-' + RIGHT('0' + CAST(MONTH(fecha) AS VARCHAR(2)), 2);

-- Postgresql
SELECT TO_CHAR(fecha, 'YYYY-MM') AS mes, AVG(total) AS promedio_facturado 
FROM venta.factura 
GROUP BY TO_CHAR(fecha, 'YYYY-MM')
order by 1;

2020-09	187819.500000000000
2023-12	173054.659104477612


-- Validando esto en postgresql
select avg(total) from venta.factura
where extract (year from fecha) = 2020 and extract (month from fecha)=9
select avg(total) from venta.factura
where extract (year from fecha) = 2023 and extract (month from fecha)=12


SELECT COUNT(*) AS cantidad_clientes FROM persona.cliente;

SELECT m.descripcion , MIN(precio_unitario) AS precio_minimo, MAX(precio_unitario) AS precio_maximo 
FROM producto.producto p
inner join producto.marca m on (p.id_marca=m.id)
GROUP BY m.descripcion ;

SELECT SUM(total) AS total_ventas FROM venta.factura;

-- Alias de Columnas y Tablas
SELECT m.descripcion AS marca, AVG(p.precio_unitario) AS precio_promedio 
FROM producto.producto p
INNER JOIN producto.marca m
ON p.id_marca = m.id GROUP BY m.descripcion;

SELECT m.descripcion AS nombre_marca, p.descripcion AS nombre_producto
FROM producto.producto p INNER JOIN producto.marca m ON p.id_marca = m.id
order by 1,2;

-- Subconsultas

-- Subconsultas Anidadas
SELECT * FROM producto.producto 
WHERE precio_unitario > 
(SELECT AVG(precio_unitario) FROM producto.producto)
order by precio_unitario desc;
-- promedio: 100502.494505494505
-- 88 filas


SELECT count(*) FROM producto.producto 
WHERE precio_unitario <= (SELECT AVG(precio_unitario) FROM producto.producto);
-- 94 con precio menor o igual al promedio
SELECT count(*) FROM producto.producto 
-- 182 filas de productos


-- Subconsultas Correlacionadas
-- MSI no tiene productos definidos!!
SELECT COUNT(*) FROM producto.producto pr 
WHERE id_marca = (SELECT id FROM producto.marca ma WHERE ma.descripcion = 'MSI')

select m.descripcion, count(*)
from producto.producto pr
inner join producto.marca m on (m.id=pr.id_marca)
group by m.descripcion
order by 1
-- Cambiamos por Adata que si tiene productos definidos


-- Opcion 1:
SELECT * FROM producto.marca m WHERE 
(SELECT COUNT(*) FROM producto.producto p WHERE p.id_marca = m.id) 
> 
(SELECT COUNT(*) FROM producto.producto pr 
WHERE id_marca = (SELECT id FROM producto.marca ma WHERE ma.descripcion = 'Adata'));


-- Opción 2:
SELECT * FROM producto.marca m WHERE 
(SELECT COUNT(*) FROM producto.producto p WHERE p.id_marca = m.id) 
> (
SELECT COUNT(*) 
FROM producto.producto pr 
inner join producto.marca ma on (ma.id=pr.id_marca)
WHERE ma.descripcion = 'Adata')


--- Subconsultas correlacionadas
-- Postgresql
SELECT 
    EXTRACT(YEAR FROM v1.fecha) AS anio, 
    EXTRACT(MONTH FROM v1.fecha) AS mes, 
    COUNT(*)
FROM 
    venta.factura v1
WHERE 
    total > (
        SELECT AVG(v2.total)
        FROM venta.factura v2
        WHERE EXTRACT(YEAR FROM v2.fecha) = EXTRACT(YEAR FROM v1.fecha)
        AND EXTRACT(MONTH FROM v2.fecha) = EXTRACT(MONTH FROM v1.fecha)
    )
GROUP BY EXTRACT(YEAR FROM v1.fecha), EXTRACT(MONTH FROM v1.fecha)
ORDER BY anio, mes;

-- chequeo para 2023/12
-- 2023.0	12.0	31
SELECT AVG(v2.total)
        FROM venta.factura v2
        WHERE EXTRACT(YEAR FROM v2.fecha) = 2023
        AND EXTRACT(MONTH FROM v2.fecha) = 12
-- Promedio del mes: $173054.659104477612        
-- cantidad de facturas con total_facturado mayor a ese importe:

SELECT  COUNT(*)
FROM 
    venta.factura v1
WHERE 
    total >173054.659104477612
    and v1.fecha between '2023-12-01' and '2023-12-31'
-- 31


-- SQL Server
SELECT 
    YEAR(v1.fecha) AS anio, 
    MONTH(v1.fecha) AS mes, 
    count(*)
FROM 
    venta.factura v1
WHERE 
    total > (
        SELECT AVG(total)
        FROM venta.factura v2
        WHERE YEAR(v2.fecha) = YEAR(v1.fecha) AND MONTH(v2.fecha) = MONTH(v1.fecha)
    )
    group by YEAR(v1.fecha), MONTH(v1.fecha)
   order by 1,2;

-- Marcas con mas de 15 productos definidos
SELECT m.descripcion FROM producto.marca m WHERE 
(SELECT COUNT(*) FROM producto.producto p WHERE p.id_marca = m.id) > 15

-- JOINs

-- Equidistantes
SELECT m.descripcion AS nombre_marca, p.descripcion AS nombre_producto
FROM producto.producto p INNER JOIN producto.marca m ON p.id_marca = m.id
order by 1,2;

SELECT p.*, c.descripcion AS nombre_categoria 
FROM producto.producto p INNER JOIN producto.categoria c ON p.id_subcategoria = c.id 
WHERE precio_unitario > 100500;

