-- Script para crear datos de prueba
-- Ejecuta este script para poblar tu base de datos con datos de ejemplo

-- Eliminar tablas si existen (limpieza)
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;

-- Crear tabla de categorías
CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear tabla de clientes
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    direccion TEXT,
    ciudad VARCHAR(50),
    pais VARCHAR(50),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear tabla de productos
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    categoria_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- Crear tabla de pedidos
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    fecha_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('pendiente', 'procesando', 'enviado', 'entregado', 'cancelado') DEFAULT 'pendiente',
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

-- Insertar categorías
INSERT INTO categorias (nombre, descripcion) VALUES
('Electrónica', 'Dispositivos electrónicos y gadgets'),
('Ropa', 'Prendas de vestir y accesorios'),
('Libros', 'Libros de diversos géneros'),
('Hogar', 'Artículos para el hogar y decoración'),
('Deportes', 'Equipamiento deportivo y accesorios');

-- Insertar clientes
INSERT INTO clientes (nombre, email, telefono, direccion, ciudad, pais) VALUES
('Juan Pérez', 'juan.perez@email.com', '555-0101', 'Calle Principal 123', 'Madrid', 'España'),
('María García', 'maria.garcia@email.com', '555-0102', 'Avenida Central 456', 'Barcelona', 'España'),
('Carlos López', 'carlos.lopez@email.com', '555-0103', 'Plaza Mayor 789', 'Valencia', 'España'),
('Ana Martínez', 'ana.martinez@email.com', '555-0104', 'Calle Secundaria 321', 'Sevilla', 'España'),
('Luis Rodríguez', 'luis.rodriguez@email.com', '555-0105', 'Boulevard 654', 'Bilbao', 'España');

-- Insertar productos
INSERT INTO productos (nombre, descripcion, precio, stock, categoria_id) VALUES
('Laptop Pro 15"', 'Laptop de alto rendimiento con 16GB RAM', 1299.99, 25, 1),
('Smartphone X', 'Teléfono inteligente con cámara de 48MP', 699.99, 50, 1),
('Camiseta Algodón', 'Camiseta de algodón orgánico', 19.99, 100, 2),
('Jeans Classic', 'Pantalones vaqueros clásicos', 49.99, 75, 2),
('Novela Bestseller', 'Libro de ficción bestselling', 24.99, 200, 3),
('Manual Programación', 'Guía completa de programación', 39.99, 150, 3),
('Juego de Sartenes', 'Set de 3 sartenes antiadherentes', 89.99, 30, 4),
('Lámpara LED', 'Lámpara de escritorio LED', 34.99, 60, 4),
('Pelota Fútbol', 'Balón oficial de fútbol', 29.99, 80, 5),
('Raqueta Tenis', 'Raqueta profesional de tenis', 159.99, 20, 5);

-- Insertar pedidos
INSERT INTO pedidos (cliente_id, producto_id, cantidad, precio_unitario, total, estado) VALUES
(1, 1, 1, 1299.99, 1299.99, 'entregado'),
(2, 2, 2, 699.99, 1399.98, 'enviado'),
(3, 3, 5, 19.99, 99.95, 'entregado'),
(4, 4, 2, 49.99, 99.98, 'procesando'),
(5, 5, 3, 24.99, 74.97, 'pendiente'),
(1, 6, 1, 39.99, 39.99, 'entregado'),
(2, 7, 1, 89.99, 89.99, 'enviado'),
(3, 8, 2, 34.99, 69.98, 'procesando'),
(4, 9, 1, 29.99, 29.99, 'entregado'),
(5, 10, 1, 159.99, 159.99, 'pendiente');

-- Mostrar resumen de datos insertados
SELECT 'Categorías creadas:' as mensaje;
SELECT COUNT(*) as total_categorias FROM categorias;

SELECT 'Clientes creados:' as mensaje;
SELECT COUNT(*) as total_clientes FROM clientes;

SELECT 'Productos creados:' as mensaje;
SELECT COUNT(*) as total_productos FROM productos;

SELECT 'Pedidos creados:' as mensaje;
SELECT COUNT(*) as total_pedidos FROM pedidos;
