
CALL RegistrarPedido(
    p_id_cliente := 5,          -- ID del cliente que hace el pedido
    p_id_producto := 10,        -- ID del producto solicitado
    p_cantidad := 2             -- Cantidad deseada
);
CALL RegistrarReseña(
    p_id_producto := 15,        -- ID del producto a reseñar
    p_id_cliente := 3,          -- ID del cliente que escribe
    p_calificacion := 4,        -- Valoración (1-5 estrellas)
    p_comentario := 'Buen producto, pero el envío tardó' -- Opinión
);
CALL ActualizarStockProducto(
    p_id_producto := 8,         -- ID del producto
    p_cantidad := 5             -- Cantidad a restar del stock
);
CALL CambiarEstadoPedido(
    p_id_pedido := 27,          -- ID del pedido a modificar
    p_nuevo_estado := 'enviado' -- Nuevo estado (pendiente|enviado|entregado|cancelado)
);
CALL EliminarReseñasProducto(
    p_id_producto := 12         -- ID del producto cuyas reseñas eliminar
);
CALL AgregarNuevoProducto(
    p_nombre := 'Smartwatch X200',
    p_descripcion := 'Reloj inteligente con monitor cardiaco',
    p_precio := 199.99,
    p_stock := 50,
    p_id_categoria := 3         -- ID de categoría "Electrónicos"
);
CALL ActualizarCliente(
    p_id_cliente := 7,          -- ID del cliente a actualizar
    p_nombre := 'María González',-- Nuevo nombre
    p_telefono := '5551234567', -- Nuevo teléfono
    p_direccion := 'Calle Nueva 123' -- Nueva dirección
);
CALL ReporteStockBajo();