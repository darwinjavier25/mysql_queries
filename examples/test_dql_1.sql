-- TESTS DQL - PREGUNTAS Y RESPUESTAS PARA APRENDIZAJE
-- Sistema de evaluación de conocimientos SQL DQL

-- ========================================
-- NIVEL BÁSICO (Preguntas 1-5)
-- ========================================

-- TEST 1: Consulta básica
-- PREGUNTA: Muestra todos los clientes de la base de datos
-- RESPUESTA CORRECTA: SELECT * FROM clientes;
SELECT * FROM clientes;

-- TEST 2: Selección de columnas específicas
-- PREGUNTA: Muestra solo el nombre y email de los clientes
-- RESPUESTA CORRECTA: SELECT nombre, email FROM clientes;
SELECT nombre, email FROM clientes;

-- TEST 3: Filtrado simple
-- PREGUNTA: Muestra los productos que cuestan más de 100€
-- RESPUESTA CORRECTA: SELECT * FROM productos WHERE precio > 100;
SELECT * FROM productos WHERE precio > 100;

-- TEST 4: Ordenamiento
-- PREGUNTA: Muestra los productos ordenados por precio de mayor a menor
-- RESPUESTA CORRECTA: SELECT * FROM productos ORDER BY precio DESC;
SELECT * FROM productos ORDER BY precio DESC;

-- TEST 5: Límite de resultados
-- PREGUNTA: Muestra los 3 productos más caros
-- RESPUESTA CORRECTA: SELECT * FROM productos ORDER BY precio DESC LIMIT 3;
SELECT * FROM productos ORDER BY precio DESC LIMIT 3;

-- ========================================
-- NIVEL INTERMEDIO (Preguntas 6-10)
-- ========================================

-- TEST 6: Funciones de agregación
-- PREGUNTA: Cuenta cuántos productos hay en total
-- RESPUESTA CORRECTA: SELECT COUNT(*) AS total_productos FROM productos;
SELECT COUNT(*) AS total_productos FROM productos;

-- TEST 7: Agrupación
-- PREGUNTA: Muestra cuántos productos hay en cada categoría
-- RESPUESTA CORRECTA: SELECT categoria_id, COUNT(*) AS total FROM productos GROUP BY categoria_id;
SELECT categoria_id, COUNT(*) AS total FROM productos GROUP BY categoria_id;

-- TEST 8: JOIN básico
-- PREGUNTA: Muestra los productos con el nombre de su categoría
-- RESPUESTA CORRECTA: SELECT p.nombre, c.nombre AS categoria FROM productos p INNER JOIN categorias c ON p.categoria_id = c.id;
SELECT p.nombre, c.nombre AS categoria FROM productos p INNER JOIN categorias c ON p.categoria_id = c.id;

-- TEST 9: BETWEEN
-- PREGUNTA: Muestra los productos con precio entre 50 y 200 euros
-- RESPUESTA CORRECTA: SELECT * FROM productos WHERE precio BETWEEN 50 AND 200;
SELECT * FROM productos WHERE precio BETWEEN 50 AND 200;

-- TEST 10: LIKE
-- PREGUNTA: Busca productos que contengan la palabra "Laptop"
-- RESPUESTA CORRECTA: SELECT * FROM productos WHERE nombre LIKE '%Laptop%';
SELECT * FROM productos WHERE nombre LIKE '%Laptop%';

-- ========================================
-- NIVEL AVANZADO (Preguntas 11-15)
-- ========================================

-- TEST 11: Subconsulta
-- PREGUNTA: Muestra los productos que son más caros que el precio promedio
-- RESPUESTA CORRECTA: SELECT * FROM productos WHERE precio > (SELECT AVG(precio) FROM productos);
SELECT * FROM productos WHERE precio > (SELECT AVG(precio) FROM productos);

-- TEST 12: HAVING
-- PREGUNTA: Muestra las categorías que tienen más de 2 productos
-- RESPUESTA CORRECTA: SELECT categoria_id, COUNT(*) FROM productos GROUP BY categoria_id HAVING COUNT(*) > 2;
SELECT categoria_id, COUNT(*) FROM productos GROUP BY categoria_id HAVING COUNT(*) > 2;

-- TEST 13: CASE
-- PREGUNTA: Clasifica los productos como 'Económico' (<50), 'Medio' (50-100) o 'Caro' (>100)
-- RESPUESTA CORRECTA: SELECT nombre, precio, CASE WHEN precio < 50 THEN 'Económico' WHEN precio < 100 THEN 'Medio' ELSE 'Caro' END AS categoria FROM productos;
SELECT nombre, precio, CASE WHEN precio < 50 THEN 'Económico' WHEN precio < 100 THEN 'Medio' ELSE 'Caro' END AS categoria FROM productos;

-- TEST 14: JOIN múltiple
-- PREGUNTA: Muestra los pedidos con nombre del cliente y nombre del producto
-- RESPUESTA CORRECTA: SELECT cl.nombre AS cliente, pr.nombre AS producto, pe.total FROM pedidos pe INNER JOIN clientes cl ON pe.cliente_id = cl.id INNER JOIN productos pr ON pe.producto_id = pr.id;
SELECT cl.nombre AS cliente, pr.nombre AS producto, pe.total FROM pedidos pe INNER JOIN clientes cl ON pe.cliente_id = cl.id INNER JOIN productos pr ON pe.producto_id = pr.id;

-- TEST 15: Funciones de cadena
-- PREGUNTA: Muestra los nombres de los clientes en mayúsculas
-- RESPUESTA CORRECTA: SELECT UPPER(nombre) AS nombre_mayusculas FROM clientes;
SELECT UPPER(nombre) AS nombre_mayusculas FROM clientes;

-- ========================================
-- DESAFÍOS EXTRA (Preguntas 16-20)
-- ========================================

-- TEST 16: LEFT JOIN
-- PREGUNTA: Muestra todas las categorías y cuántos productos tiene cada una (incluyendo categorías sin productos)
-- RESPUESTA CORRECTA: SELECT c.nombre, COUNT(p.id) AS num_productos FROM categorias c LEFT JOIN productos p ON c.id = p.categoria_id GROUP BY c.id, c.nombre;
SELECT c.nombre, COUNT(p.id) AS num_productos FROM categorias c LEFT JOIN productos p ON c.id = p.categoria_id GROUP BY c.id, c.nombre;

-- TEST 17: Subconsulta en IN
-- PREGUNTA: Muestra los clientes que han hecho pedidos
-- RESPUESTA CORRECTA: SELECT * FROM clientes WHERE id IN (SELECT DISTINCT cliente_id FROM pedidos);
SELECT * FROM clientes WHERE id IN (SELECT DISTINCT cliente_id FROM pedidos);

-- TEST 18: Funciones de fecha
-- PREGUNTA: Muestra los pedidos con la fecha formateada como DD/MM/YYYY
-- RESPUESTA CORRECTA: SELECT id, total, DATE_FORMAT(fecha_pedido, '%d/%m/%Y') AS fecha FROM pedidos;
SELECT id, total, DATE_FORMAT(fecha_pedido, '%d/%m/%Y') AS fecha FROM pedidos;

-- TEST 19: Múltiples agregaciones
-- PREGUNTA: Muestra para cada categoría: precio mínimo, máximo y promedio
-- RESPUESTA CORRECTA: SELECT categoria_id, MIN(precio) AS min_precio, MAX(precio) AS max_precio, AVG(precio) AS avg_precio FROM productos GROUP BY categoria_id;
SELECT categoria_id, MIN(precio) AS min_precio, MAX(precio) AS max_precio, AVG(precio) AS avg_precio FROM productos GROUP BY categoria_id;

-- TEST 20: ORDER BY con expresión
-- PREGUNTA: Muestra los productos ordenados por valor total del stock (precio * stock)
-- RESPUESTA CORRECTA: SELECT nombre, precio, stock, precio * stock AS valor_stock FROM productos ORDER BY valor_stock DESC;
SELECT nombre, precio, stock, precio * stock AS valor_stock FROM productos ORDER BY valor_stock DESC;
