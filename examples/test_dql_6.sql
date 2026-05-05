-- ========================================
-- TEST DQL 6: GROUP BY y HAVING
-- ========================================
-- Este archivo contiene preguntas de repaso sobre GROUP BY y HAVING.
-- Utiliza las tablas: productos, clientes, pedidos, categorias.
-- Ejecuta las consultas y verifica los resultados.

-- ========================================
-- GROUP BY Básico (Preguntas 1-5)
-- ========================================

-- TEST 1
-- PREGUNTA: Agrupa los productos por categoria_id y cuenta cuántos productos hay en cada categoría

-- TEST 2
-- PREGUNTA: Agrupa los pedidos por cliente_id y calcula el total de pedidos por cliente

-- TEST 3
-- PREGUNTA: Agrupa los productos por categoria_id y calcula el precio promedio de cada categoría

-- TEST 4
-- PREGUNTA: Agrupa los pedidos por fecha_pedido (año-mes) y cuenta los pedidos por mes

-- TEST 5
-- PREGUNTA: Agrupa los clientes por ciudad y cuenta cuántos clientes hay en cada ciudad

-- ========================================
-- GROUP BY con HAVING (Preguntas 6-10)
-- ========================================

-- TEST 6
-- PREGUNTA: Agrupa los productos por categoria_id y muestra solo las categorías con más de 5 productos

-- TEST 7
-- PREGUNTA: Agrupa los pedidos por cliente_id y muestra solo los clientes con más de 3 pedidos

-- TEST 8
-- PREGUNTA: Agrupa los productos por categoria_id y calcula el precio promedio, mostrando solo categorías con promedio > 150

-- TEST 9
-- PREGUNTA: Agrupa los pedidos por fecha_pedido (año) y suma el total, mostrando solo años con total > 1000

-- TEST 10
-- PREGUNTA: Agrupa los clientes por pais y cuenta, mostrando solo países con más de 2 clientes

-- ========================================
-- GROUP BY con Funciones Agregadas y HAVING (Preguntas 11-15)
-- ========================================

-- TEST 11
-- PREGUNTA: Agrupa los productos por categoria_id, calcula suma de precios y stock, mostrando categorías con suma de precios > 500

-- TEST 12
-- PREGUNTA: Agrupa los pedidos por cliente_id, calcula el promedio de totales, mostrando clientes con promedio > 200

-- TEST 13
-- PREGUNTA: Agrupa los productos por categoria_id, encuentra el precio máximo, mostrando categorías con máximo > 300

-- TEST 14
-- PREGUNTA: Agrupa los pedidos por fecha_pedido (mes), cuenta pedidos, mostrando meses con más de 10 pedidos

-- TEST 15
-- PREGUNTA: Agrupa los clientes por ciudad, cuenta clientes, mostrando ciudades con más de 1 cliente y ordena por cantidad descendente

-- ========================================
-- GROUP BY Avanzado con JOIN y HAVING (Preguntas 16-20)
-- ========================================

-- TEST 16
-- PREGUNTA: Une productos con categorias, agrupa por nombre de categoría, cuenta productos, mostrando categorías con más de 3 productos

-- TEST 17
-- PREGUNTA: Une pedidos con clientes, agrupa por pais del cliente, suma totales, mostrando países con suma > 500

-- TEST 18
-- PREGUNTA: Une productos con pedidos (asumiendo tabla intermedia), agrupa por producto, cuenta ventas, mostrando productos vendidos más de 5 veces
-- Nota: Asumiendo tabla pedido_productos con pedido_id, producto_id, cantidad

-- TEST 19
-- PREGUNTA: Agrupa pedidos por cliente, calcula suma y promedio de totales, mostrando clientes con suma > 300 y promedio < 150

-- TEST 20
-- PREGUNTA: Agrupa productos por categoria_id, calcula estadísticas completas, mostrando categorías con stock total > 50
