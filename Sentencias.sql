USE tienda_online;

-- Consulta 1: Listar productos disponibles por categoría, ordenados por precio[cite: 40].
-- Muestra el nombre del producto, su precio, stock y la categoría a la que pertenece.
SELECT
    p.nombre AS nombre_producto,
    p.precio,
    p.stock,
    c.nombre AS nombre_categoria
FROM Productos AS p
JOIN Categorias AS c ON p.id_categoria = c.id_categoria
WHERE p.stock > 0
ORDER BY c.nombre, p.precio;

-- Consulta 2: Mostrar clientes con pedidos pendientes y el total de sus compras[cite: 41].
-- Muestra el nombre del cliente y el monto total gastado en todos sus pedidos (entregados o no).
SELECT
    c.nombre AS nombre_cliente,
    SUM(dp.cantidad * dp.precio_unitario) AS total_compras
FROM Clientes AS c
JOIN Pedidos AS p ON c.id_cliente = p.id_cliente
JOIN Detalles_Pedido AS dp ON p.id_pedido = dp.id_pedido
GROUP BY c.nombre
ORDER BY total_compras DESC;

-- Consulta 3: Reporte de los 5 productos con mejor calificación promedio en reseñas[cite: 42].
-- Muestra el nombre del producto y su calificación promedio, limitado a los 5 mejores.
SELECT
    p.nombre AS nombre_producto,
    AVG(r.calificacion) AS calificacion_promedio
FROM Productos AS p
JOIN Reseñas AS r ON p.id_producto = r.id_producto
GROUP BY p.nombre
ORDER BY calificacion_promedio DESC
LIMIT 5;