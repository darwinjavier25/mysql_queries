-- TEST DQL 2 - CONSULTAS PRÁCTICAS DE NEGOCIO
-- Tests prácticos relacionados con el quiz_dql_2.sql

-- ========================================
-- NIVEL PRINCIPIANTE (Preguntas 1-5)
-- ========================================

-- TEST 1: Selección básica
-- PREGUNTA: Obtén todos los clientes de la tabla 'clientes'
-- RESPUESTA_CORRECTA: SELECT * FROM clientes;
SELECT * FROM clientes;

-- TEST 2: Selección de columnas específicas
-- PREGUNTA: Obtén solo los nombres y emails de los clientes
-- RESPUESTA_CORRECTA: SELECT nombre, email FROM clientes;
SELECT nombre, email FROM clientes;

-- TEST 3: Filtrado básico
-- PREGUNTA: Obtén productos con precio mayor a 100
-- RESPUESTA_CORRECTA: SELECT * FROM productos WHERE precio > 100;
SELECT * FROM productos WHERE precio > 100;

-- TEST 4: Ordenamiento
-- PREGUNTA: Obtén todos los productos ordenados por precio de menor a mayor
-- RESPUESTA_CORRECTA: SELECT * FROM productos ORDER BY precio ASC;
SELECT * FROM productos ORDER BY precio ASC;

-- TEST 5: Limitación de resultados
-- PREGUNTA: Obtén los 5 productos más caros
-- RESPUESTA_CORRECTA: SELECT * FROM productos ORDER BY precio DESC LIMIT 5;
SELECT * FROM productos ORDER BY precio DESC LIMIT 5;

-- ========================================
-- NIVEL INTERMEDIO (Preguntas 6-10)
-- ========================================

-- TEST 6: Búsqueda de texto
-- PREGUNTA: Obtén clientes cuyo nombre contenga 'ana'
-- RESPUESTA_CORRECTA: SELECT * FROM clientes WHERE nombre LIKE '%ana%';
SELECT * FROM clientes WHERE nombre LIKE '%ana%';

-- TEST 7: Rango de valores
-- PREGUNTA: Obtén productos con precio entre 50 y 100 euros
-- RESPUESTA_CORRECTA: SELECT * FROM productos WHERE precio BETWEEN 50 AND 100;
SELECT * FROM productos WHERE precio BETWEEN 50 AND 100;

-- TEST 8: Valores nulos
-- PREGUNTA: Obtén productos que no tienen descripción
-- RESPUESTA_CORRECTA: SELECT * FROM productos WHERE descripcion IS NULL;
SELECT * FROM productos WHERE descripcion IS NULL;

-- TEST 9: Lista de valores
-- PREGUNTA: Obtén productos de las categorías 1, 3 o 5
-- RESPUESTA_CORRECTA: SELECT * FROM productos WHERE categoria_id IN (1, 3, 5);
SELECT * FROM productos WHERE categoria_id IN (1, 3, 5);

-- TEST 10: Funciones de cadena
-- PREGUNTA: Obtén los nombres de los clientes en mayúsculas
-- RESPUESTA_CORRECTA: SELECT UPPER(nombre) FROM clientes;
SELECT UPPER(nombre) FROM clientes;

-- ========================================
-- NIVEL AVANZADO (Preguntas 11-15)
-- ========================================

-- TEST 11: Conteo condicional
-- PREGUNTA: Cuenta cuántos productos cuestan más de 100 euros
-- RESPUESTA_CORRECTA: SELECT COUNT(*) FROM productos WHERE precio > 100;
SELECT COUNT(*) FROM productos WHERE precio > 100;

-- TEST 12: Fechas
-- PREGUNTA: Obtén pedidos del último mes
-- RESPUESTA_CORRECTA: SELECT * FROM pedidos WHERE fecha_pedido >= DATE_SUB(NOW(), INTERVAL 1 MONTH);
SELECT * FROM pedidos WHERE fecha_pedido >= DATE_SUB(NOW(), INTERVAL 1 MONTH);

-- TEST 13: Concatenación
-- PREGUNTA: Crea nombres completos concatenando nombre y un espacio
-- RESPUESTA_CORRECTA: SELECT CONCAT(nombre, ' ') FROM clientes;
SELECT CONCAT(nombre, ' ') FROM clientes;

-- TEST 14: Redondeo
-- PREGUNTA: Obtén los precios redondeados a 2 decimales
-- RESPUESTA_CORRECTA: SELECT ROUND(precio, 2) FROM productos;
SELECT ROUND(precio, 2) FROM productos;

-- TEST 15: Subconsulta simple
-- PREGUNTA: Obtén el producto más caro
-- RESPUESTA_CORRECTA: SELECT * FROM productos WHERE precio = (SELECT MAX(precio) FROM productos);
SELECT * FROM productos WHERE precio = (SELECT MAX(precio) FROM productos);

-- ========================================
-- NIVEL EXPERTO (Preguntas 16-20)
-- ========================================

-- TEST 16: JOIN básico
-- PREGUNTA: Obtén todos los pedidos con nombres de clientes
-- RESPUESTA_CORRECTA: SELECT p.*, c.nombre FROM pedidos p JOIN clientes c ON p.cliente_id = c.id;
SELECT p.*, c.nombre FROM pedidos p JOIN clientes c ON p.cliente_id = c.id;

-- TEST 17: Agrupamiento simple
-- PREGUNTA: Cuenta cuántos pedidos tiene cada cliente
-- RESPUESTA_CORRECTA: SELECT cliente_id, COUNT(*) FROM pedidos GROUP BY cliente_id;
SELECT cliente_id, COUNT(*) FROM pedidos GROUP BY cliente_id;

-- TEST 18: Filtrado de grupos
-- PREGUNTA: Obtén clientes con más de 5 pedidos
-- RESPUESTA_CORRECTA: SELECT cliente_id FROM pedidos GROUP BY cliente_id HAVING COUNT(*) > 5;
SELECT cliente_id FROM pedidos GROUP BY cliente_id HAVING COUNT(*) > 5;

-- TEST 19: LEFT JOIN
-- PREGUNTA: Obtén todos los clientes y la cantidad de pedidos (incluyendo clientes sin pedidos)
-- RESPUESTA_CORRECTA: SELECT c.id, c.nombre, COUNT(p.id) as num_pedidos FROM clientes c LEFT JOIN pedidos p ON c.id = p.cliente_id GROUP BY c.id, c.nombre;
SELECT c.id, c.nombre, COUNT(p.id) as num_pedidos FROM clientes c LEFT JOIN pedidos p ON c.id = p.cliente_id GROUP BY c.id, c.nombre;

-- TEST 20: Múltiples agregaciones
-- PREGUNTA: Obtén el total y promedio de pedidos por cliente
-- RESPUESTA_CORRECTA: SELECT cliente_id, SUM(total) as total_compras, AVG(total) as promedio FROM pedidos GROUP BY cliente_id;
SELECT cliente_id, SUM(total) as total_compras, AVG(total) as promedio FROM pedidos GROUP BY cliente_id;
