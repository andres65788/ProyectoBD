-- Script SQL para pruebas unitarias de casos fallidos en procedimientos almacenados
-- Base de datos: Tienda_Online
USE Tienda_Online;

-- Prueba 1: Registrar un pedido con stock insuficiente
-- Procedimiento: RegistrarPedido
-- Caso: Intentar pedir 100 unidades del producto con id 1 (Smartphone S20, stock = 50)
-- Resultado esperado: Error con mensaje 'Stock insuficiente para el producto solicitado.'
CALL RegistrarPedido(1, 1, 100);

-- Prueba 2: Registrar un pedido cuando el cliente tiene 5 o más pedidos pendientes
-- Procedimiento: RegistrarPedido
-- Caso: Cliente con id 4 ya tiene un pedido pendiente (ver Poblar.sql). Simulamos 4 pedidos adicionales para exceder el límite.
-- Nota: Para esta prueba, primero insertamos 4 pedidos pendientes adicionales para el cliente 4.
INSERT INTO Pedidos (id_cliente, fecha_pedido, estado) VALUES 
(4, '2025-07-20', 'pendiente'),
(4, '2025-07-21', 'pendiente'),
(4, '2025-07-22', 'pendiente'),
(4, '2025-07-23', 'pendiente');
-- Intentamos registrar un nuevo pedido
-- Resultado esperado: Error con mensaje 'El cliente tiene 5 o más pedidos pendientes. No se puede registrar un nuevo pedido.'
CALL RegistrarPedido(4, 2, 1);

-- Prueba 3: Registrar una reseña de un cliente que no ha comprado el producto
-- Procedimiento: RegistrarReseña
-- Caso: Cliente con id 2 intenta reseñar el producto con id 15 (Camisa de Lino Azul), pero no lo ha comprado.
-- Resultado esperado: Error con mensaje 'El cliente no ha comprado este producto.'
CALL RegistrarReseña(15, 2, 4, 'Intentando reseñar sin haber comprado');

-- Prueba 4: Actualizar stock con cantidad mayor al disponible
-- Procedimiento: ActualizarStockProducto
-- Caso: Intentar reducir 100 unidades del producto con id 3 (Auriculares Inalámbricos, stock = 150).
-- Resultado esperado: No se actualiza el stock (la condición stock >= p_cantidad falla, por lo que no se realiza ninguna acción).
CALL ActualizarStockProducto(3, 200);

-- Prueba 5: Cambiar el estado de un pedido inexistente
-- Procedimiento: CambiarEstadoPedido
-- Caso: Intentar cambiar el estado del pedido con id 999 (no existe).
-- Resultado esperado: No se realiza ninguna actualización (afecta 0 filas, no se lanza error explícito).
CALL CambiarEstadoPedido(999, 'enviado');

-- Prueba 6: Eliminar reseñas de un producto sin reseñas
-- Procedimiento: EliminarReseñasProducto
-- Caso: Intentar eliminar reseñas del producto con id 12 (Microondas con grill), que no tiene reseñas en los datos poblados.
-- Resultado esperado: Mensaje 'Reseñas eliminadas exitosamente.', pero no se elimina nada (0 filas afectadas).
CALL EliminarReseñasProducto(12);

-- Prueba 7: Agregar un producto con nombre duplicado en la misma categoría
-- Procedimiento: AgregarNuevoProducto
-- Caso: Intentar agregar un producto con el mismo nombre 'Smartphone S20' en la categoría 1 (Electrónica).
-- Resultado esperado: Error con mensaje 'Ya existe un producto con el mismo nombre y categoría.'
CALL AgregarNuevoProducto('Smartphone S20', 'Teléfono móvil duplicado', 1200.00, 50, 1);

-- Prueba 8: Actualizar un cliente inexistente
-- Procedimiento: ActualizarCliente
-- Caso: Intentar actualizar los datos del cliente con id 999 (no existe).
-- Resultado esperado: No se realiza ninguna actualización (afecta 0 filas, no se lanza error explícito).
CALL ActualizarCliente(999, 'Cliente Inexistente', '5550000000', 'Calle Falsa 999');

-- Prueba 9: Generar reporte de stock bajo cuando no hay productos con stock < 5
-- Procedimiento: ReporteStockBajo
-- Caso: Modificamos temporalmente todos los productos para tener stock >= 5 y ejecutamos el reporte.
-- Nota: Actualizamos el stock de todos los productos a 10 para esta prueba.
UPDATE Productos SET stock = 10 WHERE stock < 5;
-- Ejecutamos el reporte
-- Resultado esperado: Retorna un conjunto de resultados vacío (ningún producto tiene stock < 5).
CALL ReporteStockBajo();