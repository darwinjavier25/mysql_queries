-- ========================================
-- SELECT SIMPLE (Preguntas 1-4)
-- ========================================

-- TEST 1
-- PREGUNTA: Obtén todos los registros de la tabla 'productos'
select * from productos;


-- TEST 2
-- PREGUNTA: Obtén todas las columnas de la tabla 'clientes'

SELECT * FROM clientes;

-- TEST 3
-- PREGUNTA: Obtén los nombres de todos los clientes

SELECT nombre FROM clientes;

-- TEST 4
-- PREGUNTA: Obtén los nombres y precios de todos los productos
SELECT nombre, precio FROM productos;


-- ========================================
-- SELECT + WHERE SIMPLE (Preguntas 5-8)
-- ========================================

-- TEST 5
-- PREGUNTA: Obtén los productos con precio mayor a 50

Select * from productos where precio > 50;

-- TEST 6
-- PREGUNTA: Obtén los clientes que viven en 'Madrid'
select * from clientes where ciudad = 'Madrid';


-- TEST 7
-- PREGUNTA: Obtén los pedidos cuyo total sea menor a 100

select * from pedidos where total < 100;

-- TEST 8
-- PREGUNTA: Obtén los productos con stock igual a 0
Select * from productos where stock = 0;


-- ========================================
-- SELECT + ORDER BY (Preguntas 9-12)
-- ========================================

-- TEST 9
-- PREGUNTA: Obtén todos los productos ordenados por precio de mayor a menor
Select * from productos order by precio desc;


-- TEST 10
-- PREGUNTA: Obtén los clientes ordenados alfabéticamente por nombre
Select * from clientes order by nombre asc;


-- TEST 11
-- PREGUNTA: Obtén los pedidos ordenados por fecha más reciente primero

select * from pedidos order by fecha_pedido desc;

-- TEST 12
-- PREGUNTA: Obtén los productos ordenados por stock de menor a mayor

Select * from productos order by stock asc;

-- ========================================
-- FUNCIONES DE AGREGADO (Preguntas 13-16)
-- ========================================

-- TEST 13
-- PREGUNTA: Cuenta cuántos clientes hay en total

select count(*) from clientes;  

-- TEST 14
-- PREGUNTA: Obtén el precio máximo de los productos

SELECT MAX(precio) FROM productos;

-- TEST 15
-- PREGUNTA: Obtén el precio mínimo de los productos

SELECT MIN(precio) FROM productos;

-- TEST 16
-- PREGUNTA: Calcula el precio promedio de los productos

select avg(precio) from productos;

-- ========================================
-- GROUP BY SIMPLE (Preguntas 17-20)
-- ========================================

-- TEST 17
-- PREGUNTA: Cuenta cuántos pedidos tiene cada cliente
SELECT cliente_id, COUNT(*) AS total_pedidos
FROM pedidos
GROUP BY cliente_id;


-- TEST 18
-- PREGUNTA: Obtén el total de dinero gastado por cada cliente

Select cliente_id, SUM(total) AS total_gastado
from pedidos
group by cliente_id;

-- TEST 19
-- PREGUNTA: Cuenta cuántos productos hay por cada categoría

select categoria_id, count(*) as total_productos 
from productos 
group by categoria_id;

-- TEST 20
-- PREGUNTA: Obtén el precio promedio de productos por categoría

select categoria_id, avg(precio) as precio_promedio
from productos
group by categoria_id;

-- ========================================
-- GROUP BY + HAVING (Preguntas 21-24)
-- ========================================

-- TEST 21
-- PREGUNTA: Obtén los clientes que tienen más de 3 pedidos
select cliente_id, count(*) as total_pedidos
from pedidos
group by cliente_id
having count(*) > 3;
-- ESta consulta no da resultado porque no hay clientes con mas de tres pedidos


-- TEST 22
-- PREGUNTA: Obtén las categorías que tienen más de 5 productos
select categoria_id, count(*) as total_productos
from productos
group by categoria_id
having count(*) > 5;

-- ESta consulta no da resultado porque no hay categorias con mas de cinco productos

-- TEST 23
-- PREGUNTA: Obtén los clientes cuyo total gastado sea mayor a 500
select cliente_id, sum(total) as total_gastado
from pedidos
group by cliente_id
having sum(total) > 500;


-- TEST 24
-- PREGUNTA: Obtén las categorías donde el precio promedio sea mayor a 100

select categoria_id, avg(precio) as precio_promedio
from productos
group by categoria_id
having avg(precio) > 100;
