USE tienda_online;

-- Procedimiento Almacenado 1: Registrar un nuevo pedido[cite: 44].
-- Registra un pedido y sus detalles, verificando el límite de 5 pedidos pendientes por cliente
-- y el stock disponible del producto.
DELIMITER $$
CREATE PROCEDURE RegistrarPedido(
    IN p_id_cliente INT,
    IN p_id_producto INT,
    IN p_cantidad INT
)
BEGIN
    DECLARE v_stock_actual INT;
    DECLARE v_pedidos_pendientes INT;

    -- Verificar el límite de pedidos pendientes del cliente [cite: 15, 44]
    SELECT COUNT(*) INTO v_pedidos_pendientes
    FROM Pedidos
    WHERE id_cliente = p_id_cliente AND estado = 'pendiente';

    IF v_pedidos_pendientes >= 5 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cliente tiene 5 o más pedidos pendientes. No se puede registrar un nuevo pedido.';
    ELSE
        -- Verificar si hay stock suficiente [cite: 16, 44]
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
            
            -- Llamar al procedimiento para actualizar el stock [cite: 46]
            CALL ActualizarStockProducto(p_id_producto, p_cantidad);
            
            SELECT 'Pedido registrado exitosamente.' AS Mensaje;
        ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stock insuficiente para el producto solicitado.';
        END IF;
    END IF;
END$$
DELIMITER ;

-- Procedimiento Almacenado 2: Registrar una reseña[cite: 45].
-- Inserta una nueva reseña, verificando previamente que el cliente haya comprado el producto.
DELIMITER $$
CREATE PROCEDURE RegistrarReseña(
    IN p_id_producto INT,
    IN p_id_cliente INT,
    IN p_calificacion TINYINT,
    IN p_comentario TEXT
)
BEGIN
    DECLARE v_ha_comprado INT;

    -- Verificar si el cliente ha comprado el producto [cite: 12, 17, 45]
    SELECT COUNT(*) INTO v_ha_comprado
    FROM Detalles_Pedido AS dp
    JOIN Pedidos AS p ON dp.id_pedido = p.id_pedido
    WHERE dp.id_producto = p_id_producto AND p.id_cliente = p_id_cliente;

    IF v_ha_comprado > 0 THEN
        -- Insertar la reseña
        INSERT INTO Reseñas (id_producto, id_cliente, calificacion, comentario)
        VALUES (p_id_producto, p_id_cliente, p_calificacion, p_comentario);
        
        SELECT 'Reseña registrada exitosamente.' AS Mensaje;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cliente no ha comprado este producto.';
    END IF;
END$$
DELIMITER ;

-- Procedimiento Almacenado 3: Actualizar el stock de un producto después de un pedido[cite: 46].
-- Reduce el stock de un producto por la cantidad especificada.
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

-- Procedimiento Almacenado 4: Cambiar el estado de un pedido[cite: 47].
-- Modifica el estado de un pedido dado su ID.
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

-- Procedimiento Almacenado 5: Eliminar reseñas de un producto[cite: 49].
-- Elimina todas las reseñas de un producto específico.
DELIMITER $$
CREATE PROCEDURE EliminarReseñasProducto(
    IN p_id_producto INT
)
BEGIN
    DELETE FROM Reseñas WHERE id_producto = p_id_producto;
    SELECT 'Reseñas eliminadas exitosamente.' AS Mensaje;
END$$
DELIMITER ;

-- Procedimiento Almacenado 6: Agregar un nuevo producto[cite: 50].
-- Inserta un nuevo producto, verificando que no exista uno con el mismo nombre y categoría.
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

    -- Verificar si ya existe un producto con el mismo nombre y categoría [cite: 50]
    SELECT COUNT(*) INTO v_duplicado
    FROM Productos
    WHERE nombre = p_nombre AND id_categoria = p_id_categoria;

    IF v_duplicado = 0 THEN
        INSERT INTO Productos (nombre, descripcion, precio, stock, id_categoria)
        VALUES (p_nombre, p_descripcion, p_precio, p_stock, p_id_categoria);
        
        SELECT 'Producto agregado exitosamente.' AS Mensaje;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe un producto con el mismo nombre y categoría.';
    END IF;
END$$
DELIMITER ;

-- Procedimiento Almacenado 7: Actualizar la información de un cliente[cite: 51].
-- Modifica el nombre, teléfono y dirección de un cliente dado su ID.
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

-- Procedimiento Almacenado 8: Generar un reporte de productos con stock bajo[cite: 52].
-- Muestra el nombre y stock de los productos con menos de 5 unidades.
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