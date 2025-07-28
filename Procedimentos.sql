USE Tienda_Online;

-- Procedimiento1: Registrar un nuevo pedido
DELIMITER $$
CREATE PROCEDURE RegistrarPedido(
    IN p_id_cliente INT,
    IN p_id_producto INT,
    IN p_cantidad INT
)
BEGIN
    DECLARE v_stock_actual INT;
    DECLARE v_pedidos_pendientes INT;
    -- Verificar el límite de pedidos pendientes del cliente
    SELECT COUNT(*) INTO v_pedidos_pendientes
    FROM Pedidos
    WHERE id_cliente = p_id_cliente AND estado = 'pendiente';
    IF v_pedidos_pendientes >= 5 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cliente tiene 5 o mas pedidos pendientes. No se puede registrar un nuevo pedido.';
    ELSE
        -- Verificar si hay stock suficiente
        SELECT stock INTO v_stock_actual
        FROM Productos
        WHERE id_producto = p_id_producto;
        IF v_stock_actual >= p_cantidad THEN
            -- Insertar el nuevo pedido
            INSERT INTO Pedidos (id_cliente, estado) VALUES (p_id_cliente, 'pendiente');
            -- Obtener el ID del nuevo pedido
            SET @last_pedido_id = LAST_INSERT_ID();
            -- Insertar el detalle del pedido
            INSERT INTO Detalles_Pedido (id_pedido, id_producto, cantidad, precio_unitario)
            SELECT @last_pedido_id, id_producto, p_cantidad, precio FROM Productos WHERE id_producto = p_id_producto;
            -- Llamar al procedimiento para actualizar el stock
            CALL ActualizarStockProducto(p_id_producto, p_cantidad);
            SELECT 'Pedido registrado exitosamente.' AS Mensaje;
        ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stock insuficiente para el producto solicitado.';
        END IF;
    END IF;
END$$
DELIMITER ;

-- Procedimiento2: Registrar una reseña

DELIMITER $$
CREATE PROCEDURE RegistrarResena(
    IN p_id_producto INT,
    IN p_id_cliente INT,
    IN p_calificacion TINYINT,
    IN p_comentario TEXT
)
BEGIN
    DECLARE v_ha_comprado INT;
    -- Verificar si el cliente ha comprado el producto
    SELECT COUNT(*) INTO v_ha_comprado
    FROM Detalles_Pedido AS dp
    JOIN Pedidos AS p ON dp.id_pedido = p.id_pedido
    WHERE dp.id_producto = p_id_producto AND p.id_cliente = p_id_cliente;
    IF v_ha_comprado > 0 THEN
        -- Insertar la reseña
        INSERT INTO Resenas (id_producto, id_cliente, calificacion, comentario)
        VALUES (p_id_producto, p_id_cliente, p_calificacion, p_comentario);
        SELECT 'Resena registrada exitosamente.' AS Mensaje;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cliente no ha comprado este producto.';
    END IF;
END$$
DELIMITER ;

-- Procedimiento3: Actualizar el stock de un producto

DELIMITER $$
CREATE PROCEDURE ActualizarStockProducto(
    IN p_id_producto INT,
    IN p_cantidad INT
)
BEGIN
    UPDATE Productos
    SET stock = stock - p_cantidad
    WHERE id_producto = p_id_producto AND stock >= p_cantidad;
END$$
DELIMITER ;

-- Procedimiento4: Cambiar el estado de un pedido

DELIMITER $$
CREATE PROCEDURE CambiarEstadoPedido(
    IN p_id_pedido INT,
    IN p_nuevo_estado ENUM('pendiente', 'enviado', 'entregado', 'cancelado')
)
BEGIN
    UPDATE Pedidos
    SET estado = p_nuevo_estado
    WHERE id_pedido = p_id_pedido;
END$$
DELIMITER ;


-- Procedimiento5: Eliminar reseñas de un producto

DELIMITER $$
CREATE PROCEDURE EliminarResenasProducto(
    IN p_id_producto INT
)
BEGIN
    DELETE FROM Resenas WHERE id_producto = p_id_producto;
    SELECT 'Resenas eliminadas exitosamente.' AS Mensaje;
END$$
DELIMITER ;

-- Procedimiento6: Agregar un nuevo producto

DELIMITER $$
CREATE PROCEDURE AgregarNuevoProducto(
    IN p_nombre VARCHAR(255),
    IN p_descripcion TEXT,
    IN p_precio DECIMAL(10, 2),
    IN p_stock INT,
    IN p_id_categoria INT
)
BEGIN
    DECLARE v_duplicado INT;

    -- Verificar si ya existe un producto con el mismo nombre y categoría
    SELECT COUNT(*) INTO v_duplicado
    FROM Productos
    WHERE nombre = p_nombre AND id_categoria = p_id_categoria;

    IF v_duplicado = 0 THEN
        INSERT INTO Productos (nombre, descripcion, precio, stock, id_categoria)
        VALUES (p_nombre, p_descripcion, p_precio, p_stock, p_id_categoria);
        
        SELECT 'Producto agregado exitosamente.' AS Mensaje;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe un producto con el mismo nombre y categoria.';
    END IF;
END$$
DELIMITER ;

-- Procedimiento7: Actualizar la información de un cliente

DELIMITER $$
CREATE PROCEDURE ActualizarCliente(
    IN p_id_cliente INT,
    IN p_nombre VARCHAR(100),
    IN p_telefono VARCHAR(20),
    IN p_direccion VARCHAR(255)
)
BEGIN
    UPDATE Clientes
    SET nombre = p_nombre, telefono = p_telefono, direccion = p_direccion
    WHERE id_cliente = p_id_cliente;
END$$
DELIMITER ;

-- Procedimiento8: Generar un reporte de productos con stock bajo

DELIMITER $$
CREATE PROCEDURE ReporteStockBajo()
BEGIN
    SELECT
        nombre AS nombre_producto,
        stock
    FROM Productos
    WHERE stock < 5
    ORDER BY stock ASC;
END$$
DELIMITER ;