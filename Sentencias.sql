USE Tienda_Online;

-- Consulta 1: Listar productos disponibles por categoría, ordenados por precio.
SELECT
    p.nombre AS nombre_producto,
    p.precio,
    p.stock,
    c.nombre AS nombre_categoria
FROM Productos AS p
 INNER JOIN Categorias AS c ON p.id_categoria = c.id_categoria
WHERE p.stock > 0
ORDER BY c.nombre, p.precio;

-- Consulta 2: Mostrar clientes con pedidos pendientes y el total de sus compras.
SELECT
    c.id_cliente,
    c.nombre AS nombre_cliente,
    SUM(dp.cantidad * dp.precio_unitario) AS total_compras
FROM Clientes AS c
INNER JOIN Pedidos AS p ON c.id_cliente = p.id_cliente
INNER JOIN Detalles_Pedido AS dp ON p.id_pedido = dp.id_pedido
WHERE p.estado = 'pendiente'
GROUP BY c.id_cliente, c.nombre
ORDER BY total_compras DESC;

-- Consulta 3: Reporte de los 5 productos con mejor calificación promedio en reseñas.
SELECT
    p.id_producto,
    p.nombre AS nombre_producto,
    AVG(r.calificacion) AS calificacion_promedio
FROM Productos AS p
INNER JOIN Resenas AS r ON p.id_producto = r.id_producto
GROUP BY p.id_producto, p.nombre
ORDER BY calificacion_promedio DESC
LIMIT 5;