
USE Tienda_Online;

-- Registrar un nuevo pedido
CALL RegistrarPedido(5, 10, 2);

-- Registrar una nueva reseña
CALL RegistrarResena(15, 3, 4, 'Buen producto, pero el envío tardo');

-- Actualizar el stock de un producto
CALL ActualizarStockProducto(8, 5);

-- Cambiar el estado de un pedido
CALL CambiarEstadoPedido(27, 'enviado');

-- Eliminar reseñas de un producto
CALL EliminarReseñasProducto(12);

-- Agregar un nuevo producto
CALL AgregarNuevoProducto('Smartwatch X200', 'Reloj inteligente con monitor cardiaco', 199.99, 50, 3);

-- Actualizar la información de un cliente
CALL ActualizarCliente(7, 'Maria Gonzalez', '5551234567', 'Calle Nueva 123');

-- Generar reporte de stock bajo
CALL ReporteStockBajo();