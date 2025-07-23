-- Script SQL para poblar las tablas de la base de datos de la Tienda Online
-- Mínimos requeridos: 30 productos, 15 clientes, 20 pedidos, 25 detalles de pedido, 10 reseñas.

USE tienda_online;

-- Poblar la tabla Categorias (mínimo 3 categorías)
INSERT INTO Categorias (nombre, descripcion) VALUES
('Electrónica', 'Dispositivos electrónicos, gadgets y accesorios.'),
('Hogar y Cocina', 'Productos para el hogar, electrodomésticos y utensilios de cocina.'),
('Moda', 'Ropa, calzado y accesorios para hombres y mujeres.'),
('Libros', 'Novelas, libros de texto y literatura.');

-- Poblar la tabla Clientes (mínimo 15 clientes)
INSERT INTO Clientes (nombre, correo, telefono, direccion) VALUES
('Ana García', 'ana.garcia@example.com', '5511223344', 'Av. Siempre Viva 123'),
('Juan Pérez', 'juan.perez@example.com', '5522334455', 'Calle Falsa 123'),
('María López', 'maria.lopez@example.com', '5533445566', 'Paseo de la Reforma 456'),
('Carlos Ruiz', 'carlos.ruiz@example.com', '5544556677', 'Bosques de las Lomas 789'),
('Sofía Hernández', 'sofia.hernandez@example.com', '5555667788', 'Av. Insurgentes 987'),
('Pedro Gómez', 'pedro.gomez@example.com', '5566778899', 'Calle San Pablo 321'),
('Laura Díaz', 'laura.diaz@example.com', '5577889900', 'Eje Central 555'),
('Jorge Morales', 'jorge.morales@example.com', '5588990011', 'Calle Madero 111'),
('Fernanda Castro', 'fernanda.castro@example.com', '5599001122', 'Av. Juárez 222'),
('Luis Torres', 'luis.torres@example.com', '5500112233', 'Viaducto Miguel Alemán 333'),
('Gabriel Reyes', 'gabriel.reyes@example.com', '5511002244', 'Av. Universidad 444'),
('Daniela Vargas', 'daniela.vargas@example.com', '5522113355', 'Calzada de Tlalpan 555'),
('Roberto Mendoza', 'roberto.mendoza@example.com', '5533224466', 'Periférico Sur 666'),
('Valeria Ortiz', 'valeria.ortiz@example.com', '5544335577', 'Circuito Interior 777'),
('Héctor Jimenez', 'hector.jimenez@example.com', '5555446688', 'Paseo de la Reforma 888');

-- Poblar la tabla Productos (mínimo 30 productos)
-- Usando las categorías: Electrónica (1), Hogar y Cocina (2), Moda (3), Libros (4)
INSERT INTO Productos (nombre, descripcion, precio, stock, id_categoria) VALUES
('Smartphone S20', 'Teléfono móvil de última generación con cámara 4K.', 899.99, 50, 1),
('Laptop Gamer X1', 'Potente laptop para juegos y tareas de alta demanda.', 1499.50, 25, 1),
('Auriculares Inalámbricos', 'Auriculares con cancelación de ruido y gran autonomía.', 99.00, 150, 1),
('Smartwatch FitPro', 'Reloj inteligente con monitor de actividad y ritmo cardíaco.', 120.00, 75, 1),
('Televisor 4K 55"', 'Televisor inteligente de 55 pulgadas con resolución 4K.', 650.00, 30, 1),
('Licuadora 12 velocidades', 'Licuadora de alta potencia para batidos y jugos.', 75.50, 100, 2),
('Cafetera programable', 'Cafetera con temporizador y filtro permanente.', 45.00, 80, 2),
('Sartén Antiadherente', 'Juego de sartenes de diferentes tamaños con recubrimiento antiadherente.', 55.00, 120, 2),
('Juego de cuchillos profesional', 'Set de cuchillos de acero inoxidable con base de madera.', 85.99, 60, 2),
('Robot de cocina', 'Robot multifuncional para preparar diversas recetas.', 299.99, 40, 2),
('Robot aspirador', 'Aspiradora robotizada con mapeo de habitaciones.', 250.00, 50, 2),
('Microondas con grill', 'Microondas con función de grill y programas preestablecidos.', 110.00, 70, 2),
('Juego de toallas de bambú', 'Toallas suaves y absorbentes hechas de fibra de bambú.', 35.00, 200, 2),
('Vaso térmico 500ml', 'Vaso de acero inoxidable que mantiene la temperatura de las bebidas.', 15.00, 300, 2),
('Camisa de Lino Azul', 'Camisa de lino para hombre, ideal para climas cálidos.', 45.00, 90, 3),
('Pantalón Jeans Skinny', 'Pantalones vaqueros ajustados con tejido elástico.', 60.00, 110, 3),
('Vestido de verano floreado', 'Vestido ligero para mujer con estampado floral.', 55.00, 70, 3),
('Zapatillas Deportivas', 'Zapatillas de running con amortiguación avanzada.', 85.00, 150, 3),
('Gafas de sol polarizadas', 'Gafas de sol con protección UV y lentes polarizadas.', 30.00, 250, 3),
('Bolso de piel', 'Bolso de mano de piel genuina con múltiples compartimentos.', 120.00, 50, 3),
('Bufanda de cachemir', 'Bufanda suave y cálida, perfecta para el invierno.', 40.00, 80, 3),
('Corbata de seda', 'Corbata elegante para ocasiones especiales.', 25.00, 100, 3),
('Cinturón de cuero', 'Cinturón de cuero genuino con hebilla de metal.', 30.00, 120, 3),
('Calcetines de algodón', 'Pack de 5 pares de calcetines de algodón.', 15.00, 500, 3),
('Falda plisada', 'Falda midi plisada de color neutro.', 50.00, 60, 3),
('Novela de misterio', 'Una intrigante novela de misterio y suspenso.', 18.50, 200, 4),
('Libro de cocina italiana', 'Recetas clásicas de la cocina italiana.', 25.00, 150, 4),
('Guía de viajes por Europa', 'Guía completa con consejos y rutas por Europa.', 22.00, 100, 4),
('El Señor de los Anillos', 'Edición especial de la trilogía completa.', 65.00, 50, 4),
('Programación en Python', 'Manual para principiantes de programación en Python.', 30.00, 75, 4),
('Historia de México', 'Un libro de texto que narra la historia de México.', 28.00, 90, 4);

-- Poblar la tabla Pedidos (mínimo 20 pedidos)
-- Asignando pedidos a los clientes
INSERT INTO Pedidos (id_cliente, fecha_pedido, estado) VALUES
(1, '2025-07-01 10:30:00', 'entregado'),
(2, '2025-07-01 11:45:00', 'enviado'),
(3, '2025-07-02 14:00:00', 'entregado'),
(4, '2025-07-02 16:20:00', 'pendiente'),
(5, '2025-07-03 09:10:00', 'entregado'),
(6, '2025-07-03 12:55:00', 'enviado'),
(7, '2025-07-04 18:00:00', 'entregado'),
(8, '2025-07-05 10:00:00', 'entregado'),
(9, '2025-07-05 15:30:00', 'pendiente'),
(10, '2025-07-06 11:20:00', 'entregado'),
(11, '2025-07-07 13:40:00', 'enviado'),
(12, '2025-07-08 16:50:00', 'pendiente'),
(13, '2025-07-09 08:30:00', 'entregado'),
(14, '2025-07-09 10:15:00', 'enviado'),
(15, '2025-07-10 14:00:00', 'entregado'),
(1, '2025-07-11 11:00:00', 'entregado'),
(2, '2025-07-12 12:30:00', 'enviado'),
(3, '2025-07-13 15:45:00', 'entregado'),
(4, '2025-07-14 09:00:00', 'pendiente'),
(5, '2025-07-15 17:00:00', 'entregado');

-- Poblar la tabla Detalles_Pedido (mínimo 25 detalles)
INSERT INTO Detalles_Pedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 1, 899.99),
(1, 3, 2, 99.00),
(2, 6, 1, 75.50),
(2, 7, 1, 45.00),
(3, 10, 1, 299.99),
(4, 15, 2, 45.00),
(4, 16, 1, 60.00),
(5, 1, 1, 899.99),
(6, 1, 1, 899.99),
(7, 26, 3, 18.50),
(8, 27, 1, 25.00),
(8, 28, 1, 22.00),
(9, 29, 1, 65.00),
(9, 30, 1, 30.00),
(10, 1, 1, 899.99),
(11, 2, 1, 1499.50),
(11, 4, 1, 120.00),
(12, 1, 1, 899.99),
(13, 2, 1, 1499.50),
(14, 3, 5, 99.00),
(15, 6, 2, 75.50),
(16, 1, 1, 899.99),
(17, 7, 1, 45.00),
(18, 10, 1, 299.99),
(19, 15, 1, 45.00),
(20, 16, 1, 60.00);


-- Poblar la tabla Reseñas (mínimo 10 reseñas)
-- Asignando reseñas a productos comprados por los clientes
INSERT INTO Reseñas (id_producto, id_cliente, calificacion, comentario, fecha) VALUES
(1, 1, 5, 'Excelente teléfono, la cámara es increíble.', '2025-07-05 10:00:00'),
(3, 1, 4, 'Muy buenos auriculares, pero la batería podría durar más.', '2025-07-06 12:00:00'),
(6, 2, 5, 'La licuadora es muy potente, ideal para batidos.', '2025-07-03 15:00:00'),
(10, 3, 5, 'El robot de cocina ha cambiado mi vida, muy recomendable.', '2025-07-08 17:00:00'),
(15, 4, 3, 'La camisa es bonita pero el tejido es un poco áspero.', '2025-07-10 11:00:00'),
(26, 7, 4, 'Una novela de misterio muy entretenida.', '2025-07-12 14:00:00'),
(27, 8, 5, 'El libro de cocina es muy útil, las recetas son fáciles.', '2025-07-14 18:00:00'),
(2, 11, 5, 'La laptop es super rápida y funciona perfectamente para gaming.', '2025-07-16 10:00:00'),
(3, 14, 5, 'Compré 5 pares de auriculares y todos funcionan perfecto.', '2025-07-17 11:00:00'),
(6, 15, 4, 'La licuadora funciona bien, el color es un poco diferente al de la foto.', '2025-07-18 13:00:00');