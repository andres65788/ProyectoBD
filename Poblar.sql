-- Script SQL para poblar las tablas de la base de datos de la Tienda Online
USE Tienda_Online;

INSERT INTO Categorias (nombre, descripcion) VALUES
('Electronica', 'Dispositivos electronicos, gadgets y accesorios en lo mas actulizado del mercadow.'),
('Hogar', 'Productos para el hogar, electrodomesticos y utensilios de cocina, limpiadores y mas.'),
('Moda', 'Ropa, calzado y accesorios para hombres y mujeres.'),
('Libros', 'Novelas, libros de texto y literatura, terror comedia y todo para largas horas de comcimiento entrentenimiento.');

-- Poblar la tabla Clientes (mínimo 15 clientes)
INSERT INTO Clientes (nombre, correo, telefono, direccion) VALUES
('Ana Garcia', 'ana.garcia@example.com', '5511223344', 'Av. Siempre Viva 123'),
('Juan Perez', 'juan.perez@example.com', '1922334455', 'Calle Falsa 123'),
('Maria Lopez', 'maria.lopez@example.com', '5533445566', 'Paseo de la Reforma 456'),
('Carlos Ruiz', 'carlos.ruiz@example.com', '2944556677', 'Bosques de las Lomas 789'),
('Sofia Hernandez', 'sofia.hernandez@example.com', '7755667788', 'Av. Insurgentes 987'),
('Pedro Gomez', 'pedro.gomez@example.com', '2966778899', 'Calle San Pablo 321'),
('Laura Diaz', 'laura.diaz@example.com', '3677889900', 'Eje Central 555'),
('Jorge Morales', 'jorge.morales@example.com', '4188990011', 'Calle Madero 111'),
('Fernanda Castro', 'fernanda.castro@example.com', '1799001122', 'Av. Juarez 222'),
('Luis Torres', 'luis.torres@example.com', '5500112233', 'Viaducto Miguel Aleman 333'),
('Gabriel Reyes', 'gabriel.reyes@example.com', '5511002244', 'Av. Universidad 444'),
('Daniela Vargas', 'daniela.vargas@example.com', '2822113355', 'Calzada de Tlalpan 555'),
('Roberto Mendoza', 'roberto.mendoza@example.com', '23733224466', 'Periferico Sur 666'),
('Valeria Ortiz', 'valeria.ortiz@example.com', '0144335577', 'Circuito Interior 777'),
('Hector Jimenez', 'hector.jimenez@example.com', '9055446688', 'Paseo de la Reforma 888');

-- Poblar la tabla Productos (mínimo 30 productos)
INSERT INTO Productos (nombre, descripcion, precio, stock, id_categoria) VALUES
('Smartphone S20', 'Telefono movil de ultima generacion con camara 4K.', 12002.99, 50, 1),
('Laptop Gamer X1', 'Potente laptop para juegos y tareas de alta demanda.', 14999.50, 25, 1),
('Auriculares Inalambricos', 'Auriculares con cancelación de ruido y gran autonomia.', 959.00, 150, 1),
('Smartwatch FitPro', 'Reloj inteligente con monitor de actividad y ritmo cardiaco.', 15901.00, 75, 1),
('Televisor 4K 57"', 'Televisor inteligente de 57 pulgadas con resolucion 4K.', 65000.00, 30, 1),
('Licuadora 12 velocidades', 'Licuadora de alta potencia para batidos y jugos.', 705.50, 100, 2),
('Cafetera programable', 'Cafetera con temporizador y filtro permanente.', 454.00, 80, 2),
('Sarten Antiadherente', 'Juego de sartenes de diferentes tamaños con recubrimiento antiadherente.', 552.00, 120, 2),
('Juego de cuchillos profesional', 'Set de cuchillos de acero inoxidable con mango de madera.', 850.99, 60, 2),
('Robot de cocina', 'Robot multifuncional para preparar diversas recetas.', 2998.99, 40, 2),
('Robot aspirador', 'Aspiradora robotizada con mapeo de habitaciones.', 2570.00, 50, 2),
('Microondas con grill', 'Microondas con funcion de grill y programas preestablecidos.', 1120.00, 70, 2),
('Juego de toallas', 'Toallas suaves y absorbentes.', 365.00, 200, 2),
('Vaso termico 500ml', 'Vaso de acero inoxidable que mantiene la temperatura de las bebidas.', 155.00, 300, 2),
('Camisa de Lino Azul', 'Camisa de lino para hombre, ideal para climas calidos.', 45.00, 90, 3),
('Pantalon Jeans overside', 'Pantalones vaqueros ajustados con tejido elastico.', 60.00, 110, 3),
('Vestido de verano floreado', 'Vestido ligero para mujer con estampado floral.', 55.00, 70, 3),
('Zapatillas Deportivas', 'Zapatillas de running con amortiguacion avanzada.', 85.00, 150, 3),
('Gafas de sol', 'Gafas de sol con protección UV y lentes polarizadas.', 30.00, 250, 3),
('Bolso de piel sintetico', 'Bolso de mano de piel sintetica con múltiples compartimentos.', 120.00, 50, 3),
('Bufanda de lino', 'Bufanda suave y calida, perfecta para el invierno.', 40.00, 80, 3),
('Corbata de seda', 'Corbata elegante para ocasiones especiales.', 25.00, 100, 3),
('Cinturon de cuero rojo', 'Cinturon de cuero genuino de color rojo con hebilla de metal.', 30.00, 120, 3),
('Calcetines de algodon', 'Pack de 5 pares de calcetines de algodon.', 15.00, 500, 3),
('Falda corta', 'Falda corta de color marfil.', 50.00, 60, 3),
('Novela de misterio', 'Una intrigante novela de misterio y suspenso.', 138.50, 200, 4),
('Libro de cocina italiana', 'Recetas clasicas de la cocina italiana.', 225.00, 150, 4),
('Guia de viajes por Europa', 'Guia completa con consejos y rutas por Europa.', 22.00, 100, 4),
('El Senor de los Anillos', 'Edicion especial de la trilogia completa.', 652.00, 50, 4),
('Programación en Python', 'Manual para principiantes de programación en Python.', 30.00, 75, 4),
('Historia de Mexico', 'Un libro de texto que narra la historia de Mexico.', 268.00, 90, 4);

-- Poblar la tabla Pedidos (mínimo 20 pedidos)
INSERT INTO Pedidos (id_cliente, fecha_pedido, estado) VALUES
(1, '2025-07-01', 'entregado'),
(2, '2025-07-01', 'enviado'),
(3, '2025-07-02', 'entregado'),
(4, '2025-07-02', 'pendiente'),
(5, '2025-07-03', 'entregado'),
(6, '2025-07-03', 'enviado'),
(7, '2025-07-04', 'entregado'),
(8, '2025-07-05', 'entregado'),
(9, '2025-07-05', 'pendiente'),
(10, '2025-07-06', 'entregado'),
(11, '2025-07-07', 'enviado'),
(12, '2025-07-08', 'pendiente'),
(13, '2025-07-09', 'entregado'),
(14, '2025-07-09', 'enviado'),
(15, '2025-07-10', 'entregado'),
(1, '2025-07-11', 'entregado'),
(2, '2025-07-12', 'enviado'),
(3, '2025-07-13', 'entregado'),
(4, '2025-07-14', 'pendiente'),
(5, '2025-07-15', 'entregado');

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
INSERT INTO Resenas (id_producto, id_cliente, calificacion, comentario, fecha) VALUES
(1, 1, 5, 'Excelente telefono, la camara es increíble.', '2025-07-05'),
(3, 1, 3, 'Muy buenos auriculares, pero la bateraa podría durar mas.', '2025-07-06'),
(6, 2, 5, 'La licuadora es muy potente, ideal para batidos.', '2025-07-03'),
(10, 3, 4, 'El robot de cocina ha cambiado mi vida, muy recomendable.', '2025-07-08'),
(15, 4, 3, 'La camisa es bonita pero el tejido es un poco aspero.', '2025-07-10'),
(26, 7, 4, 'Una novela de misterio muy entretenida.', '2025-07-12 '),
(27, 8, 5, 'El libro de cocina es muy util, las recetas son fáciles.', '2025-07-14'),
(2, 11, 5, 'La laptop es super rápida y funciona perfectamente para gaming.', '2025-07-16'),
(3, 14, 4, 'Compre 5 pares de calcetines y estan muy suaves.', '2025-07-17'),
(6, 15, 3, 'La licuadora funciona bien, el color es un poco diferente al de la foto.', '2025-07-18');