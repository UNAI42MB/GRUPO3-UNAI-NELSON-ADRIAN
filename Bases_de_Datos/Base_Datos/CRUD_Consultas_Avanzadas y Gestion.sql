use Fruteria;
-- -------------------------------------------------------- --
# PARTE DE CRUD #
-- -------------------------------------------------------- --
#Modificar el telefono de el cliente con id = 3
update cliente
set tlfn = '+34987654321'
where ident_client = 3;

#Modificar el id de el cliente con id = 5
update cliente
set ident_tiend = 2
where ident_client = 5;

#Modificar el id de el producto con id 10
update productos
set ident_prov = 1
where ident_product = 10;

#Modificar el precio de el producto  con id = 4
update productos
set precios = 19.99
where ident_product = 4;

#Elimina el cliente  con id = 2
delete from cliente
where ident_client = 2;

#Elimina el proveedor con id = 3
delete from proveedor
where ident_prov = 3;

#Eliminar producto con id = 7
delete from productos
where ident_product = 7;

#Mostrar los productos con su proveedor
select p.nombre_product, pr.empresa
from productos p
left join proveedor pr on p.ident_prov = pr.ident_prov;

#Ver productos por categoria
select p.nombre_product, c.nombre_categor
from productos p
join categoria c on p.ident_categor = c.ident_categor
order by c.nombre_categor;

# Productos apunto de vencerse
select nombre_product, fecha_vencimiento
from productos
where fecha_vencimiento < '2026-05-01'
order by fecha_vencimiento;

-- -------------------------------------------------------- --
# CONSULTAS AVANZADAS #
-- -------------------------------------------------------- --
-- Productos comprados por cada cliente
SELECT  c.ident_client,
        c.nombre_client,
        c.apellidos,
        COUNT(p.ident_product) AS productos_comprados
FROM cliente c
LEFT JOIN producto p
       ON c.ident_client = p.ident_client
GROUP BY c.ident_client;

-- Total gastado y precio medio por cliente
SELECT  c.ident_client,
        c.nombre_client,
        c.apellidos,
        SUM(p.precios) AS total_gastado,
        AVG(p.precios) AS precio_medio
FROM cliente c
JOIN producto p
      ON c.ident_client = p.ident_client
GROUP BY c.ident_client;

-- Productos por proveedor
SELECT  pr.ident_prov,
        pr.empresa,
        COUNT(p.ident_product) AS num_productos,
        AVG(p.precios) AS precio_medio
FROM proveedor pr
LEFT JOIN producto p
       ON pr.ident_prov = p.ident_prov
GROUP BY pr.ident_prov;

-- Entregas realizadas por transportista
SELECT  tr.ident_trasp,
        tr.nombre_trasp,
        tr.apellidos,
        COUNT(p.ident_product) AS entregas_realizadas
FROM transportista tr
JOIN Transportista_tienda tt
      ON tr.ident_trasp = tt.ident_trasp
LEFT JOIN producto p
       ON tr.ident_trasp = p.ident_trasp
GROUP BY tr.ident_trasp;

-- Productos que vencen antes del 20/04/2026
SELECT nombre_product, fecha_vencimiento, precios
FROM producto
WHERE fecha_vencimiento < '2026-04-20'
ORDER BY fecha_vencimiento;

-- Datos completos de un cliente por DNI
SELECT  c.ident_client,
        c.DNI,
        c.nombre_client,
        c.apellidos,
        c.fecha_nacimiento,
        c.tlfn,
        t.nombre AS nombre_tienda
FROM cliente c
LEFT JOIN tienda t
       ON c.ident_tiend = t.ident_tiend
WHERE c.DNI = '49283751J';

-- Proveedores cuyo nombre contiene “Frutas”
SELECT  pr.ident_prov,
        pr.empresa,
        pr.tlfn,
        ti.nombre AS tienda
FROM proveedor pr
LEFT JOIN Proveedor_tienda pt
       ON pr.ident_prov = pt.ident_prov
LEFT JOIN tienda ti
       ON pt.ident_tiend = ti.ident_tiend
WHERE pr.empresa LIKE '%Frutas%';

-- Ranking de transportistas por número de entregas
SELECT  tr.ident_trasp,
        tr.nombre_trasp,
        tr.apellidos,
        ti.nombre AS tienda,
        COUNT(p.ident_product) AS num_entregas
FROM Transportista tr
JOIN Transportista_tienda tt
      ON tr.ident_trasp = tt.ident_trasp
JOIN tienda ti
      ON tt.ident_tiend = ti.ident_tiend
LEFT JOIN producto p
       ON tr.ident_trasp = p.ident_trasp
GROUP BY tr.ident_trasp, tr.nombre_trasp, tr.apellidos, ti.nombre
ORDER BY num_entregas DESC;

-- Precio medio de frutas y verduras
SELECT  tipo,
        AVG(precios) AS precio_medio
FROM (
    SELECT 'Fruta' AS tipo, p.precios
    FROM producto p
    JOIN Fruta f
          ON p.ident_product = f.ident_Frut
    UNION ALL
    SELECT 'Verdura' AS tipo, p.precios
    FROM producto p
    JOIN Verdura v
          ON p.ident_product = v.ident_Verd
) AS x
GROUP BY tipo;

-- Clientes menores de 18 años que han comprado productos
SELECT  c.ident_client,
        c.nombre_client,
        c.apellidos,
        c.fecha_nacimiento
FROM cliente c
WHERE c.ident_client IN (
    SELECT DISTINCT p.ident_client
    FROM producto p
    WHERE p.ident_client IS NOT NULL
)
AND TIMESTAMPDIFF(YEAR, c.fecha_nacimiento, CURDATE()) < 18;







