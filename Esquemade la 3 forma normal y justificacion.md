# Modelo de Base de Datos: Normalización hasta tercera forma fomral (3nf)

Este modelo de base de datos se ha diseñado de acuerdo con la **3NF**, lo que garantiza que:

- Cada tabla representa una sola entidad.
- Todos los atributos no clave dependen directamente de la clave primaria.
- Se minimizan las dependencias transitivas y la redundancia de datos.
- Se asegura consistencia, eficiencia y facilidad de mantenimiento.

## Tablas y Atributos

### Tabla: Clientes
- `id_cliente` (PK): Identificador único del cliente.
- `nombre`: Nombre completo del cliente.
- `correo`: Dirección de correo electrónico del cliente (debe ser única).
- `telefono`: Número de teléfono del cliente.
- `direccion`: Dirección postal del cliente.

### Tabla: Productos
- `id_producto` (PK): Identificador único del producto.
- `nombre`: Nombre del producto.
- `descripcion`: Descripción detallada del producto.
- `precio`: Precio unitario del producto.
- `stock`: Cantidad disponible en inventario (no debe ser negativa).
- `id_categoria` (FK → Categorías.id_categoria): Categoría a la que pertenece el producto.

### Tabla: Categorías
- `id_categoria` (PK): Identificador único de la categoría.
- `nombre`: Nombre de la categoría de los productos.
- `descripcion`: Descripción general de la categoría.

### Tabla: Pedidos
- `id_pedido` (PK): Identificador único del pedido.
- `id_cliente` (FK → Clientes.id_cliente): Cliente que realizó el pedido.
- `fecha_pedido`: Fecha en que se realizó el pedido.
- `estado`: Estado actual del pedido (pendiente, enviado, entregado).

### Tabla: Detalles_Pedido
- `id_detalle` (PK): Identificador único del detalle del pedido.
- `id_pedido` (FK → Pedidos.id_pedido): Pedido al que pertenece este detalle.
- `id_producto` (FK → Productos.id_producto): Producto incluido en este detalle.
- `cantidad`: Cantidad del producto solicitada en el pedido.
- `precio_unitario`: Precio del producto en el momento del pedido.

### Tabla: Reseñas
- `id_reseña` (PK): Identificador único de la reseña.
- `id_producto` (FK → Productos.id_producto): Producto al que se refiere la reseña.
- `id_cliente` (FK → Clientes.id_cliente): Cliente que escribió la reseña.
- `calificacion`: Calificación del producto (de 1 a 5 estrellas).
- `comentario`: Comentario escrito por el cliente sobre el producto.
- `fecha`: Fecha en que se publicó la reseña.

## Justificación de la Normalización a 3NF

### General
El diseño propuesto cumple con la **Tercera Forma Normal (3NF)**. Esto significa que cada atributo no clave depende directamente de la clave primaria de su tabla. Además, se evitan dependencias transitivas y redundancia de datos, lo que garantiza integridad y eficiencia.

## Justificación por Tabla

### Clientes (`id_cliente`, `nombre`, `correo`, `telefono`, `direccion`)
- Todos los atributos dependen directamente de `id_cliente`.
- El campo `correo` también podría ser considerado una **clave candidata** por su unicidad.

### Categorías (`id_categoria`, `nombre`, `descripcion`)
- Atributos `nombre` y `descripcion` dependen directamente de `id_categoria`.
- Cada categoría representa una entidad independiente.

### Productos (`id_producto`, `nombre`, `descripcion`, `precio`, `stock`, `id_categoria`)
- Todos los atributos dependen de `id_producto`.
- `id_categoria` es una clave foránea que evita la duplicación de datos relacionados con la categoría en esta tabla.

### Pedidos (`id_pedido`, `id_cliente`, `fecha_pedido`, `estado`)
- Atributos `fecha_pedido` y `estado` dependen directamente de `id_pedido`.
- `id_cliente` es una clave foránea que enlaza con `Clientes`, sin repetir información del cliente.

### Detalles_Pedido (`id_detalle`, `id_pedido`, `id_producto`, `cantidad`, `precio_unitario`)
- La tabla actúa como tabla de unión para la relación muchos-a-muchos entre `Pedidos` y `Productos`.
- `cantidad` y `precio_unitario` dependen directamente de `id_detalle` (o de la clave compuesta `id_pedido` + `id_producto`).

### Reseñas (`id_reseña`, `id_producto`, `id_cliente`, `calificacion`, `comentario`, `fecha`)
- Los campos `calificacion`, `comentario` y `fecha` dependen directamente de `id_reseña`.
- `id_producto` y `id_cliente` son claves foráneas que conectan con `Productos` y `Clientes`, evitando duplicación de datos.


## Conclusión

La normalización hasta **3NF** permite:

- Minimizar la redundancia.
- Evitar anomalías en inserciones, actualizaciones y eliminaciones.
- Facilitar la integridad referencial entre tablas.
- Optimizar la estructura para mantenimiento y escalabilidad.


