-- Indices para la optimización de uso
-- Estos índices mejoran las consultas más comunes que pueden haber en estas tablas.
CREATE INDEX idx_productos_nombre_categoria ON Productos (nombre, id_categoria);
CREATE INDEX idx_pedidos_cliente ON Pedidos (id_cliente);
CREATE INDEX idx_resenas_producto ON Resenas (id_producto);
CREATE INDEX idx_resenas_cliente ON Resenas (id_cliente);