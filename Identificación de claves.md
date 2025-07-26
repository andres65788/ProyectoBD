# Claves Primarias, Foráneas y Candidatas en este Modelo de Datos

## Claves Primarias (Primary Keys)

Las **claves primarias** son aquellos atributos o conjunto de atributos que **identifican de forma única cada registro** en una tabla.

### Claves Primarias por Tabla:

- **Clientes:** `id_cliente`
- **Productos:** `id_producto`
- **Categorías:** `id_categoria`
- **Pedidos:** `id_pedido`
- **Detalles_Pedido:** `id_detalle`
- **Reseñas:** `id_reseña`

## Claves Foráneas (Foreing Keys)

Las **claves foráneas** son atributos en una tabla que establecen un vínculo con la **clave primaria de otra tabla**, permitiendo relacionar los datos entre diferentes entidades.

### Claves Foráneas por Tabla:

- **Productos:**
  - `id_categoria` -> Referencia a `Categorías`

- **Pedidos:**
  - `id_cliente` -> Referencia a `Clientes`

- **Detalles_Pedido:**
  - `id_pedido` -> Referencia a `Pedidos`
  - `id_producto` -> Referencia a `Productos`

- **Reseñas:**
  - `id_producto` -> Referencia a `Productos`
  - `id_cliente` -> Referencia a `Clientes`

## Claves Candidatas (Candidate Keys)

Las **claves candidatas** son aquellos atributos o conjunto de atributos que pueden identificar de forma única un registro, aunque **no necesariamente sean la clave primaria**.

- En la tabla **Clientes**, el atributo `correo` puede considerarse una **clave candidata**, ya que se asume que cada cliente tiene un correo único.
- Cabe señalar que todas las claves primarias también son **claves candidatas**, pero no todas las claves candidatas son elegidas como **claves primariaa**.

