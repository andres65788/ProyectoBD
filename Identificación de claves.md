# Claves Primarias, Foráneas y Candidatas en el Modelo de Datos

## Claves Primarias (Primary Keys)

Las **claves primarias** son aquellos atributos o conjunto de atributos que **identifican de forma única cada registro** en una tabla.

### Claves Primarias por Tabla:

- **Clientes:** `id_cliente`
- **Productos:** `id_producto`
- **Categorías:** `id_categoria`
- **Pedidos:** `id_pedido`
- **Detalles_Pedido:** `id_detalle`
- **Reseñas:** `id_reseña`

## Claves Foráneas (Foreign Keys)

Las **claves foráneas** son atributos en una tabla que establecen un vínculo con la **clave primaria de otra tabla**, permitiendo relacionar los datos entre diferentes entidades.

### Claves Foráneas por Tabla:

- **Productos:**
  - `id_categoria` → Referencia a `Categorías(id_categoria)`

- **Pedidos:**
  - `id_cliente` → Referencia a `Clientes(id_cliente)`

- **Detalles_Pedido:**
  - `id_pedido` → Referencia a `Pedidos(id_pedido)`
  - `id_producto` → Referencia a `Productos(id_producto)`

- **Reseñas:**
  - `id_producto` → Referencia a `Productos(id_producto)`
  - `id_cliente` → Referencia a `Clientes(id_cliente)`

## Claves Candidatas (Candidate Keys)

Las **claves candidatas** son aquellos atributos o conjunto de atributos que **pueden identificar de forma única un registro**, aunque **no necesariamente sean la clave primaria**.

- En la tabla **Clientes**, el atributo `correo` puede considerarse una **clave candidata**, ya que se asume que **cada cliente tiene un correo único**.
- Cabe destacar que todas las claves primarias también son **claves candidatas**, pero no todas las claves candidatas son elegidas como primaria.

