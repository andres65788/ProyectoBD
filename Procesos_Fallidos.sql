USE Tienda_Online;

-- Registrar un nuevo pedido con stock insuficiente
-- Fails because product ID 1 (Smartphone S20) has stock = 50, but we request 100 units
CALL RegistrarPedido(5, 1, 100); -- Expected error: 'Stock insuficiente para el producto solicitado.'

-- Registrar una reseña por un cliente que no ha comprado el producto
-- Fails because client ID 3 has not purchased product ID 15 (Camisa de Lino Azul)
CALL RegistrarResena(15, 3, 4, 'Intentando resenar sin comprar'); -- Expected error: 'El cliente no ha comprado este producto.'

-- Actualizar el stock de un producto con cantidad mayor al disponible
-- Fails because product ID 3 (Auriculares Inalámbricos) has stock = 150, but we try to reduce by 200
CALL ActualizarStockProducto(3, 200); -- Expected: No rows affected (silent failure)

-- Cambiar el estado de un pedido inexistente
-- Fails because order ID 999 does not exist
CALL CambiarEstadoPedido(999, 'enviado'); -- Expected: No rows affected (silent failure)

-- Eliminar reseñas de un producto sin reseñas
-- Product ID 12 (Microondas con grill) has no reviews in Poblar.sql
CALL EliminarResenasProducto(12); -- Expected: 'Resenas eliminadas exitosamente.' but 0 rows affected

-- Agregar un producto con nombre duplicado en la misma categoría
-- Fails because 'Smartphone S20' already exists in category ID 1 (Electrónica)
CALL AgregarNuevoProducto('Smartphone S20', 'Teléfono móvil duplicado', 1200.00, 50, 1, 1); -- Expected error: 'Ya existe el producto con el mismo nombre y categoria.'

-- Actualizar un cliente inexistente
-- Fails because client ID 999 does not exist
CALL ActualizarCliente(999, 'Cliente Inexistente', '5550000000', 'Calle Falsa 999'); -- Expected: No rows affected (silent failure)

-- Generar reporte de stock bajo cuando no hay productos con stock < 100
-- First, ensure no products have stock < 100 by setting all to at least 100
UPDATE Productos SET stock = 100 WHERE stock < 5;
CALL ReporteStockBajo(); -- Expected: Empty result set