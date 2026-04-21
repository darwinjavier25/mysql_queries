-- Consultas de prueba para explorar los datos
-- Usa estas consultas para probar diferentes funcionalidades

-- 1. Ver todas las tablas
SHOW TABLES;

-- 2. Consultar clientes
SELECT * FROM clientes;

-- 3. Consultar productos con sus categorías
SELECT 
    p.nombre as producto,
    p.precio,
    p.stock,
    c.nombre as categoria
FROM productos p
LEFT JOIN categorias c ON p.categoria_id = c.id
ORDER BY p.precio DESC;

-- 4. Pedidos con detalles de cliente y producto
SELECT 
    pe.id as pedido_id,
    cl.nombre as cliente,
    pr.nombre as producto,
    pe.cantidad,
    pe.precio_unitario,
    pe.total,
    pe.fecha_pedido,
    pe.estado
FROM pedidos pe
JOIN clientes cl ON pe.cliente_id = cl.id
JOIN productos pr ON pe.producto_id = pr.id
ORDER BY pe.fecha_pedido DESC;

-- 5. Estadísticas básicas
SELECT 
    'Total Clientes' as metrica,
    COUNT(*) as valor
FROM clientes
UNION ALL
SELECT 
    'Total Productos' as metrica,
    COUNT(*) as valor
FROM productos
UNION ALL
SELECT 
    'Total Pedidos' as metrica,
    COUNT(*) as valor
FROM pedidos;

-- 6. Productos con bajo stock (< 30 unidades)
SELECT 
    nombre,
    stock,
    precio,
    CASE 
        WHEN stock < 10 THEN 'Crítico'
        WHEN stock < 20 THEN 'Bajo'
        ELSE 'Moderado'
    END as nivel_stock
FROM productos
WHERE stock < 30
ORDER BY stock ASC;

-- 7. Clientes con más pedidos
SELECT 
    c.nombre,
    c.email,
    COUNT(p.id) as total_pedidos,
    SUM(p.total) as total_gastado
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.id, c.nombre, c.email
ORDER BY total_pedidos DESC;

-- 8. Productos más vendidos
SELECT 
    pr.nombre,
    SUM(pe.cantidad) as total_vendido,
    SUM(pe.total) as ingresos_totales
FROM productos pr
LEFT JOIN pedidos pe ON pr.id = pe.producto_id
GROUP BY pr.id, pr.nombre
ORDER BY total_vendido DESC;

-- 9. Pedidos por estado
SELECT 
    estado,
    COUNT(*) as cantidad,
    SUM(total) as valor_total
FROM pedidos
GROUP BY estado
ORDER BY cantidad DESC;

-- 10. Búsqueda de productos por nombre
SELECT 
    nombre,
    descripcion,
    precio,
    stock
FROM productos
WHERE nombre LIKE '%lap%' OR descripcion LIKE '%lap%';

-- 12. Actualizar precio de productos electrónicos
UPDATE productos 
SET precio = precio * 0.9 
WHERE categoria_id = 1;

-- 13. Eliminar pedidos cancelados
DELETE FROM pedidos WHERE estado = 'cancelado';

-- 14. Consulta compleja con JOIN múltiples
SELECT 
    c.nombre as categoria,
    COUNT(p.id) as total_productos,
    AVG(p.precio) as precio_promedio,
    SUM(p.stock) as stock_total
FROM categorias c
LEFT JOIN productos p ON c.id = p.categoria_id
GROUP BY c.id, c.nombre
ORDER BY total_productos DESC;
