-- Ejemplo de consultas SQL para probar el sistema
-- Este archivo contiene múltiples consultas que se ejecutarán en secuencia

-- Consulta 1: Verificar conexión
SELECT 'Conexión exitosa' as mensaje, NOW() as fecha_hora;

-- Consulta 2: Mostrar bases de datos disponibles
SHOW DATABASES;

-- Consulta 3: Crear tabla de ejemplo (si no existe)
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Consulta 4: Insertar datos de ejemplo
INSERT IGNORE INTO usuarios (nombre, email) VALUES 
('Juan Pérez', 'juan.perez@email.com'),
('María García', 'maria.garcia@email.com'),
('Carlos López', 'carlos.lopez@email.com');

-- Consulta 5: Consultar todos los usuarios
SELECT * FROM usuarios ORDER BY fecha_creacion DESC;

-- Consulta 6: Contar usuarios
SELECT COUNT(*) as total_usuarios FROM usuarios;

-- Consulta 7: Actualizar un usuario
UPDATE usuarios SET nombre = 'Juan Pérez Modificado' WHERE email = 'juan.perez@email.com';

-- Consulta 8: Consultar usuarios actualizados
SELECT * FROM usuarios WHERE email = 'juan.perez@email.com';

-- Consulta 9: Eliminar un usuario
DELETE FROM usuarios WHERE email = 'carlos.lopez@email.com';

-- Consulta 10: Verificar usuarios restantes
SELECT * FROM usuarios;
