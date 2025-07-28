--idx_productos_nombre_categoria (usa id_categoria).
EXPLAIN SELECT
    p.nombre AS nombre_producto,
    p.precio,
    p.stock,
    c.nombre AS nombre_categoria
FROM Productos AS p
INNER JOIN Categorias AS c ON p.id_categoria = c.id_categoria
WHERE p.stock > 0
ORDER BY c.nombre, p.precio;

--idx_pedidos_cliente.
EXPLAIN SELECT
    c.id_cliente,
    c.nombre AS nombre_cliente,
    SUM(dp.cantidad * dp.precio_unitario) AS total_compras
FROM Clientes AS c
INNER JOIN Pedidos AS p ON c.id_cliente = p.id_cliente
INNER JOIN Detalles_Pedido AS dp ON p.id_pedido = dp.id_pedido
WHERE p.estado = 'pendiente'
GROUP BY c.id_cliente, c.nombre
ORDER BY total_compras DESC;

--idx_resenas_producto.
EXPLAIN SELECT
    p.id_producto,
    p.nombre AS nombre_producto,
    AVG(r.calificacion) AS calificacion_promedio
FROM Productos AS p
INNER JOIN Resenas AS r ON p.id_producto = r.id_producto
GROUP BY p.id_producto, p.nombre
ORDER BY calificacion_promedio DESC
LIMIT 5;

--idx_pedidos_cliente, índice implícito en Detalles_Pedido.id_pedido y Detalles_Pedido.id_producto.
EXPLAIN SELECT COUNT(*)
FROM Detalles_Pedido AS dp
JOIN Pedidos AS p ON dp.id_pedido = p.id_pedido
WHERE dp.id_producto = 15 AND p.id_cliente = 3;
