
-- PREGUNTA: Obtén los pedidos con total igual a 150

SELECT * FROM pedidos WHERE total = 150;

-- corrección: 
UPDATE pedidos
SET precio_unitario = 150,
    total = cantidad * 150
WHERE id = 2;


-- PREGUNTA: Obtén los pedidos realizados entre '2024-01-01' y '2024-12-31'

SELECT * FROM pedidos WHERE fecha_pedido BETWEEN '2024-01-01' AND '2024-12-31';

-- Corrección

UPDATE pedidos
SET fecha_pedido = '2024-06-15'
WHERE id <> 500;

-- PREGUNTA: Obtén los productos cuyo categoria_id sea 10, 20 o 30
SELECT * FROM productos WHERE categoria_id IN (10, 20, 30);

-- corrección
UPDATE productos
SET categoria_id = 10
WHERE id IN (1,2);

-- PREGUNTA: Obtén los clientes cuyo email termine en '@gmail.com'

select * from clientes where email like '%@gmail.com';
-- corrección
UPDATE clientes
SET email = CONCAT(nombre,ciudad, '@gmail.com')
WHERE id in (1, 3, 5);

-- PREGUNTA: Obtén los clientes cuyo país NO sea 'España'
Select * from clientes where pais <> 'España';
-- corrección
insert clientes (nombre, email, telefono, direccion, ciudad, pais)
values ('Maria Gomez', 'mariagomez@gmail.com', '555-0202', 'Calle Secundaria 456', 'Barcelona', 'Ecuador'),
       ('Carlos Ruiz', 'carlos@gmail.com', '555-0303', 'Avenida Central 789', 'Valencia', 'Italia'),
       ('Ana Torres', 'ana@gmail.com', '555-0404', 'Plaza Mayor 321', 'Sevilla', 'Portugal');