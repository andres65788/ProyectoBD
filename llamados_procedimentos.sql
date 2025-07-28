
USE Tienda_Online;

CALL RegistrarPedido(5, 10, 2);
CALL RegistrarResena(15, 3, 4, 'Buen producto, pero el envío tardo');
CALL ActualizarStockProducto(8, 5);
CALL CambiarEstadoPedido(27, 'enviado');
CALL EliminarResenasProducto(12);
CALL AgregarNuevoProducto('Smartwatch X200', 'Reloj inteligente con monitor cardiaco', 199.99, 50, 3);
CALL ActualizarCliente(7, 'Maria Gonzalez', '5551234567', 'Calle Nueva 123');
CALL ReporteStockBajo();