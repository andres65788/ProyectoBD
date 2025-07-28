USE Tienda_Online;

CALL RegistrarPedido(1, 1, 100);

INSERT INTO Pedidos (id_cliente, fecha_pedido, estado) VALUES 
(4, '2025-07-20', 'pendiente'),
(4, '2025-07-21', 'pendiente'),
(4, '2025-07-22', 'pendiente'),
(4, '2025-07-23', 'pendiente');
CALL RegistrarPedido(4, 2, 1);

CALL RegistrarReseña(15, 2, 4, 'Intentando reseñar sin haber comprado');

CALL ActualizarStockProducto(3, 200);

CALL CambiarEstadoPedido(999, 'enviado');

CALL EliminarReseñasProducto(12);

CALL AgregarNuevoProducto('Smartphone S20', 'Teléfono móvil duplicado', 1200.00, 50, 1);

CALL ActualizarCliente(999, 'Cliente Inexistente', '5550000000', 'Calle Falsa 999');

UPDATE Productos SET stock = 10 WHERE stock < 5;
CALL ReporteStockBajo();