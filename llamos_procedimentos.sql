
CALL RegistrarPedido(
    p_id_cliente := 5,          
    p_id_producto := 10,        
    p_cantidad := 2             
);
CALL RegistrarReseña(
    p_id_producto := 15,       
    p_id_cliente := 3,          
    p_calificacion := 4,        
    p_comentario := 'Buen producto, pero el envío tardó' 
);
CALL ActualizarStockProducto(
    p_id_producto := 8,         
    p_cantidad := 5             
);
CALL CambiarEstadoPedido(
    p_id_pedido := 27,          
    p_nuevo_estado := 'enviado'
);
CALL EliminarReseñasProducto(
    p_id_producto := 12         
);
CALL AgregarNuevoProducto(
    p_nombre := 'Smartwatch X200',
    p_descripcion := 'Reloj inteligente con monitor cardiaco',
    p_precio := 199.99,
    p_stock := 50,
    p_id_categoria := 3         
);
CALL ActualizarCliente(
    p_id_cliente := 7,          
    p_nombre := 'María González',
    p_telefono := '5551234567', 
    p_direccion := 'Calle Nueva 123' 
);
CALL ReporteStockBajo();