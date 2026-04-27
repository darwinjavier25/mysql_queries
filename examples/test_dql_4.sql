-- ========================================
-- WHERE BÁSICO (Preguntas 1-4)
-- ========================================

-- TEST 1
-- PREGUNTA: Obtén todos los productos con precio mayor a 200

SELECT * FROM productos WHERE precio > 200;

-- TEST 2
-- PREGUNTA: Obtén los clientes cuyo país sea 'España'

SELECT * FROM clientes WHERE pais = 'España';

-- TEST 3
-- PREGUNTA: Obtén los pedidos con total igual a 150

SELECT * FROM pedidos WHERE total = 150;

-- TEST 4
-- PREGUNTA: Obtén los productos cuyo stock sea distinto de 0

SELECT * FROM productos WHERE stock <> 0;

-- ========================================
-- WHERE + BETWEEN (Preguntas 5-8)
-- ========================================

-- TEST 5
-- PREGUNTA: Obtén los productos con precio entre 50 y 150

SELECT * FROM productos WHERE precio BETWEEN 50 AND 150;

-- TEST 6
-- PREGUNTA: Obtén los pedidos realizados entre '2024-01-01' y '2024-12-31'

SELECT * FROM pedidos WHERE fecha_pedido BETWEEN '2024-01-01' AND '2024-12-31';

-- TEST 7
-- PREGUNTA: Obtén los productos con stock entre 10 y 100

SELECT * FROM productos WHERE stock BETWEEN 10 AND 100;

-- TEST 8
-- PREGUNTA: Obtén los pedidos cuyo total esté entre 200 y 500
SELECT * FROM pedidos WHERE total BETWEEN 200 AND 500;  



-- ========================================
-- WHERE + IN (Preguntas 9-12)
-- ========================================

-- TEST 9
-- PREGUNTA: Obtén los productos que pertenecen a las categorías 2, 4 y 6
SELECT * FROM productos WHERE categoria_id IN (2, 4, 6);    



-- TEST 10
-- PREGUNTA: Obtén los clientes que viven en 'Madrid', 'Barcelona' o 'Valencia'
SELECT * FROM clientes WHERE ciudad IN ('Madrid', 'Barcelona', 'Valencia');



-- TEST 11
-- PREGUNTA: Obtén los pedidos realizados por los clientes con id 1, 3 y 5

SELECT * FROM pedidos WHERE cliente_id IN (1, 3, 5);

-- TEST 12
-- PREGUNTA: Obtén los productos cuyo categoria_id sea 10, 20 o 30
SELECT * FROM productos WHERE categoria_id IN (10, 20, 30);


-- ========================================
-- WHERE + LIKE (Preguntas 13-16)
-- ========================================

-- TEST 13
-- PREGUNTA: Obtén los clientes cuyo nombre empiece por 'A'
Select * from clientes where nombre like 'A';


-- TEST 14
-- PREGUNTA: Obtén los productos cuyo nombre contenga la palabra 'Pro'

Select * from productos where nombre like 'Pro';

-- TEST 15
-- PREGUNTA: Obtén los clientes cuyo email termine en '@gmail.com'

select * from clientes where email like '@gmail.com';

-- TEST 16
-- PREGUNTA: Obtén los productos cuyo nombre tenga exactamente 5 caracteres

select * from productos where nombre like '_____'; -- 5 guiones bajos representan 5 caracteres

-- ========================================
-- WHERE + NULL (Preguntas 17-18)
-- ========================================

-- TEST 17
-- PREGUNTA: Obtén los productos que no tienen descripción

Select * from productos where descripcion is null;

-- TEST 18
-- PREGUNTA: Obtén los clientes que sí tienen teléfono (no es nulo)

select * from clientes where telefono is not null;

-- ========================================
-- WHERE + AND / OR (Preguntas 19-22)
-- ========================================

-- TEST 19
-- PREGUNTA: Obtén los productos con precio mayor a 100 y stock mayor a 20
Select * from productos where precio > 100 and stock > 20;



-- TEST 20
-- PREGUNTA: Obtén los clientes que viven en 'Madrid' o 'Sevilla'
select * from clientes where ciudad = 'Madrid' or ciudad = 'Sevilla';   



-- TEST 21
-- PREGUNTA: Obtén los pedidos con total mayor a 100 y menor a 300
select * from pedidos where total > 100 and total < 300;



-- TEST 22
-- PREGUNTA: Obtén los productos con precio menor a 50 o stock menor a 5
Select * from productos where precio < 50 or stock < 5;



-- ========================================
-- WHERE + NOT (Preguntas 23-24)
-- ========================================

-- TEST 23
-- PREGUNTA: Obtén los productos cuyo precio NO esté entre 100 y 200
Select * from productos where precio not between 100 and 200;



-- TEST 24
-- PREGUNTA: Obtén los clientes cuyo país NO sea 'España'
Select * from clientes where pais <> 'España';
