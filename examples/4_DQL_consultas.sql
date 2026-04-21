-- CONSULTAS DQL (Data Query Language) - SOLO SELECT
-- Cubre los conceptos más importantes de SQL para consultas de datos

-- ========================================
-- 1. CONSULTAS BÁSICAS (SELECT básico)
-- ========================================

-- 1.1 SELECT con todas las columnas
SELECT * FROM clientes;

-- 1.2 SELECT con columnas específicas
SELECT id, nombre, email FROM clientes;

-- 1.3 SELECT con alias de columnas
SELECT 
    nombre AS nombre_cliente,
    email AS correo_electronico,
    ciudad AS ubicacion
FROM clientes;

-- 1.4 SELECT con columnas calculadas
SELECT 
    nombre,
    precio,
    precio * 1.21 AS precio_con_iva,
    precio * 0.9 AS precio_con_descuento
FROM productos;

-- ========================================
-- 2. FILTRADO (WHERE clause)
-- ========================================

-- 2.1 WHERE con condiciones simples
SELECT * FROM productos WHERE precio > 100;

-- 2.2 WHERE con múltiples condiciones (AND)
SELECT * FROM productos 
WHERE precio > 50 AND stock < 100;

-- 2.3 WHERE con OR
SELECT * FROM productos 
WHERE categoria_id = 1 OR categoria_id = 2;

-- 2.4 WHERE con BETWEEN
SELECT * FROM productos 
WHERE precio BETWEEN 50 AND 200;

-- 2.5 WHERE con IN
SELECT * FROM productos 
WHERE categoria_id IN (1, 3, 5);

-- 2.6 WHERE con LIKE
SELECT * FROM productos 
WHERE nombre LIKE '%Laptop%';

-- 2.7 WHERE con NOT LIKE
SELECT * FROM productos 
WHERE nombre NOT LIKE '%Smartphone%';

-- 2.8 WHERE con IS NULL
SELECT * FROM productos WHERE categoria_id IS NULL;

-- 2.9 WHERE con comparación de fechas
SELECT * FROM pedidos 
WHERE fecha_pedido >= '2026-04-01';

-- ========================================
-- 3. ORDENAMIENTO (ORDER BY)
-- ========================================

-- 3.1 ORDER BY ASC (ascendente)
SELECT nombre, precio FROM productos 
ORDER BY precio ASC;

-- 3.2 ORDER BY DESC (descendente)
SELECT nombre, precio FROM productos 
ORDER BY precio DESC;

-- 3.3 ORDER BY múltiples columnas
SELECT nombre, precio, stock FROM productos 
ORDER BY categoria_id ASC, precio DESC;

-- 3.4 ORDER BY con alias
SELECT nombre, precio * 1.21 AS precio_final 
FROM productos 
ORDER BY precio_final DESC;

-- ========================================
-- 4. LIMIT Y OFFSET
-- ========================================

-- 4.1 LIMIT simple
SELECT * FROM productos ORDER BY precio DESC LIMIT 5;

-- 4.2 LIMIT con OFFSET (paginación)
SELECT * FROM productos 
ORDER BY precio ASC 
LIMIT 3 OFFSET 2;

-- 4.3 TOP N productos más caros
SELECT nombre, precio FROM productos 
ORDER BY precio DESC 
LIMIT 3;

-- ========================================
-- 5. FUNCIONES DE AGREGACIÓN
-- ========================================

-- 5.1 COUNT
SELECT COUNT(*) AS total_productos FROM productos;
SELECT COUNT(categoria_id) AS productos_con_categoria FROM productos;

-- 5.2 SUM
SELECT SUM(precio) AS valor_total_inventario FROM productos;
SELECT SUM(stock) AS total_unidades FROM productos;

-- 5.3 AVG
SELECT AVG(precio) AS precio_promedio FROM productos;
SELECT AVG(stock) AS stock_promedio FROM productos;

-- 5.4 MAX y MIN
SELECT MAX(precio) AS precio_maximo FROM productos;
SELECT MIN(precio) AS precio_minimo FROM productos;
SELECT 
    MAX(precio) AS mas_caro,
    MIN(precio) AS mas_barato,
    AVG(precio) AS promedio
FROM productos;

-- ========================================
-- 6. GROUP BY (Agrupación)
-- ========================================

-- 6.1 GROUP BY básico
SELECT categoria_id, COUNT(*) AS total_productos 
FROM productos 
GROUP BY categoria_id;

-- 6.2 GROUP BY con múltiples agregaciones
SELECT 
    categoria_id,
    COUNT(*) AS cantidad,
    AVG(precio) AS precio_promedio,
    SUM(stock) AS stock_total
FROM productos 
GROUP BY categoria_id;

-- 6.3 GROUP BY con HAVING
SELECT 
    categoria_id,
    COUNT(*) AS cantidad,
    AVG(precio) AS precio_promedio
FROM productos 
GROUP BY categoria_id
HAVING COUNT(*) > 2;

-- 6.4 GROUP BY con condición en HAVING
SELECT 
    categoria_id,
    COUNT(*) AS cantidad,
    SUM(stock) AS stock_total
FROM productos 
GROUP BY categoria_id
HAVING SUM(stock) > 50;

-- ========================================
-- 7. JOINS (Combinación de tablas)
-- ========================================

-- 7.1 INNER JOIN
SELECT 
    p.nombre AS producto,
    c.nombre AS categoria,
    p.precio
FROM productos p
INNER JOIN categorias c ON p.categoria_id = c.id;

-- 7.2 LEFT JOIN
SELECT 
    p.nombre AS producto,
    c.nombre AS categoria
FROM productos p
LEFT JOIN categorias c ON p.categoria_id = c.id;

-- 7.3 RIGHT JOIN
SELECT 
    c.nombre AS categoria,
    COUNT(p.id) AS cantidad_productos
FROM productos p
RIGHT JOIN categorias c ON p.categoria_id = c.id
GROUP BY c.id, c.nombre;

-- 7.4 JOIN con múltiples condiciones
SELECT 
    cl.nombre AS cliente,
    pr.nombre AS producto,
    pe.cantidad,
    pe.total
FROM pedidos pe
INNER JOIN clientes cl ON pe.cliente_id = cl.id
INNER JOIN productos pr ON pe.producto_id = pr.id
WHERE pe.estado = 'entregado';

-- ========================================
-- 8. SUBCONSULTAS (Subqueries)
-- ========================================

-- 8.1 Subconsulta en WHERE
SELECT * FROM productos 
WHERE precio > (SELECT AVG(precio) FROM productos);

-- 8.2 Subconsulta en FROM
SELECT categoria_premium, AVG(precio) AS promedio_categoria
FROM (
    SELECT 
        categoria_id,
        AVG(precio) AS categoria_premium
    FROM productos 
    GROUP BY categoria_id
) AS subconsulta
GROUP BY categoria_premium;

-- 8.3 Subconsulta con IN
SELECT * FROM clientes 
WHERE id IN (
    SELECT DISTINCT cliente_id 
    FROM pedidos 
    WHERE total > 100
);

-- 8.4 Subconsulta correlacionada
SELECT 
    nombre,
    precio,
    (SELECT AVG(precio) FROM productos) AS precio_promedio_general
FROM productos 
WHERE precio > (SELECT AVG(precio) FROM productos);

-- ========================================
-- 9. FUNCIONES DE CADENA (String Functions)
-- ========================================

-- 9.1 CONCAT
SELECT 
    CONCAT(nombre, ' - ', email) AS info_cliente
FROM clientes;

-- 9.2 UPPER, LOWER
SELECT 
    UPPER(nombre) AS nombre_mayusculas,
    LOWER(email) AS email_minusculas
FROM clientes;

-- 9.3 LENGTH
SELECT 
    nombre,
    LENGTH(nombre) AS longitud_nombre
FROM clientes
ORDER BY longitud_nombre DESC;

-- 9.4 SUBSTRING
SELECT 
    nombre,
    SUBSTRING(nombre, 1, 3) AS iniciales
FROM productos;

-- 9.5 REPLACE
SELECT 
    descripcion,
    REPLACE(descripcion, 'Laptop', 'Portátil') AS descripcion_modificada
FROM productos 
WHERE descripcion LIKE '%Laptop%';

-- ========================================
-- 10. FUNCIONES DE FECHA Y HORA
-- ========================================

-- 10.1 NOW, CURDATE
SELECT NOW() AS fecha_hora_actual;
SELECT CURDATE() AS fecha_actual;

-- 10.2 DATE_FORMAT
SELECT 
    fecha_pedido,
    DATE_FORMAT(fecha_pedido, '%d/%m/%Y') AS fecha_formateada,
    DATE_FORMAT(fecha_pedido, '%W %M %Y') AS fecha_extendida
FROM pedidos;

-- 10.3 DATEDIFF
SELECT 
    id,
    fecha_pedido,
    DATEDIFF(NOW(), fecha_pedido) AS dias_desde_pedido
FROM pedidos;

-- 10.4 YEAR, MONTH, DAY
SELECT 
    YEAR(fecha_pedido) AS año,
    MONTH(fecha_pedido) AS mes,
    DAY(fecha_pedido) AS dia,
    COUNT(*) AS total_pedidos
FROM pedidos
GROUP BY YEAR(fecha_pedido), MONTH(fecha_pedido), DAY(fecha_pedido);

-- ========================================
-- 11. FUNCIONES CONDICIONALES (CASE)
-- ========================================

-- 11.1 CASE simple
SELECT 
    nombre,
    precio,
    CASE 
        WHEN precio < 50 THEN 'Económico'
        WHEN precio < 100 THEN 'Medio'
        WHEN precio < 200 THEN 'Caro'
        ELSE 'Muy Caro'
    END AS rango_precio
FROM productos;

-- 11.2 CASE con agrupación
SELECT 
    estado,
    COUNT(*) AS cantidad,
    CASE 
        WHEN COUNT(*) > 5 THEN 'Alto'
        WHEN COUNT(*) > 2 THEN 'Medio'
        ELSE 'Bajo'
    END AS nivel_volumen
FROM pedidos
GROUP BY estado;

-- 11.3 CASE anidado
SELECT 
    nombre,
    stock,
    precio,
    CASE 
        WHEN stock < 20 THEN 
            CASE 
                WHEN precio > 100 THEN 'Crítico - Caro'
                ELSE 'Crítico - Económico'
            END
        WHEN stock < 50 THEN 'Moderado'
        ELSE 'Suficiente'
    END AS nivel_inventario
FROM productos;

-- ========================================
-- 12. OPERACIONES CON CONJUNTOS (Set Operations)
-- ========================================

-- 12.1 UNION
SELECT nombre AS resultado, 'cliente' AS tipo FROM clientes
UNION
SELECT nombre AS resultado, 'producto' AS tipo FROM productos;

-- 12.2 UNION ALL (incluye duplicados)
SELECT ciudad AS ubicacion FROM clientes
UNION ALL
SELECT nombre AS ubicacion FROM categorias;

-- 12.3 INTERSECT simulado con INNER JOIN
SELECT DISTINCT c1.nombre 
FROM clientes c1
INNER JOIN clientes c2 ON c1.nombre = c2.nombre 
WHERE c1.id < c2.id;

-- ========================================
-- 13. CONSULTAS AVANZADAS
-- ========================================

-- 13.1 Window Functions (ROW_NUMBER)
SELECT 
    nombre,
    precio,
    ROW_NUMBER() OVER (ORDER BY precio DESC) AS ranking_precio
FROM productos;

-- 13.2 Window Functions (RANK)
SELECT 
    categoria_id,
    nombre,
    precio,
    RANK() OVER (PARTITION BY categoria_id ORDER BY precio DESC) AS ranking_categoria
FROM productos;

-- 13.3 Window Functions (LAG)
SELECT 
    nombre,
    precio,
    LAG(precio, 1, 0) OVER (ORDER BY precio) AS precio_anterior
FROM productos
ORDER BY precio;

-- 13.4 CTE (Common Table Expression)
WITH productos_caros AS (
    SELECT * FROM productos WHERE precio > 100
),
categorias_lujo AS (
    SELECT * FROM categorias WHERE id IN (
        SELECT DISTINCT categoria_id FROM productos_caros
    )
)
SELECT 
    pc.nombre,
    pc.precio,
    cl.nombre AS categoria
FROM productos_caros pc
INNER JOIN categorias_lujo cl ON pc.categoria_id = cl.id;

-- 13.5 CTE recursivo simulado (jerarquía)
WITH RECURSIVE categoria_jerarquia AS (
    SELECT id, nombre, 0 AS nivel
    FROM categorias 
    WHERE id = 1
    
    UNION ALL
    
    SELECT c.id, c.nombre, cj.nivel + 1
    FROM categorias c
    INNER JOIN categoria_jerarquia cj ON c.id = cj.id + 1
    WHERE cj.nivel < 2
)
SELECT * FROM categoria_jerarquia;

-- ========================================
-- 14. CONSULTAS ESTADÍSTICAS Y ANALÍTICAS
-- ========================================

-- 14.1 Percentiles y cuartiles
SELECT 
    nombre,
    precio,
    PERCENT_RANK() OVER (ORDER BY precio) AS percentil_precio,
    NTILE(4) OVER (ORDER BY precio) AS cuartil_precio
FROM productos;

-- 14.2 Media móvil
SELECT 
    nombre,
    precio,
    AVG(precio) OVER (
        ORDER BY precio 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS media_movil_3
FROM productos
ORDER BY precio;

-- 14.3 Análisis de tendencias
SELECT 
    DATE(fecha_pedido) AS fecha,
    COUNT(*) AS pedidos_diarios,
    SUM(total) AS ventas_diarias,
    LAG(COUNT(*), 1) OVER (ORDER BY DATE(fecha_pedido)) AS pedidos_dia_anterior
FROM pedidos
GROUP BY DATE(fecha_pedido)
ORDER BY fecha;

-- ========================================
-- 15. CONSULTAS DE VALIDACIÓN DE DATOS
-- ========================================

-- 15.1 Detección de duplicados
SELECT 
    email,
    COUNT(*) AS duplicados
FROM clientes
GROUP BY email
HAVING COUNT(*) > 1;

-- 15.2 Validación de integridad referencial
SELECT 
    p.id,
    p.nombre,
    p.categoria_id
FROM productos p
LEFT JOIN categorias c ON p.categoria_id = c.id
WHERE c.id IS NULL;

-- 15.3 Análisis de completitud de datos
SELECT 
    'clientes' AS tabla,
    COUNT(*) AS total_registros,
    COUNT(email) AS con_email,
    COUNT(telefono) AS con_telefono,
    COUNT(direccion) AS con_direccion
FROM clientes

UNION ALL

SELECT 
    'productos' AS tabla,
    COUNT(*) AS total_registros,
    COUNT(nombre) AS con_nombre,
    COUNT(descripcion) AS con_descripcion,
    COUNT(categoria_id) AS con_categoria
FROM productos;