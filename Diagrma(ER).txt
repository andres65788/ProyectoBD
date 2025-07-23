@startuml
skinparam linetype ortho
skinparam handwritten false
skinparam classAttributeIconSize 0

' Definición de Entidades (Tablas)
entity Clientes {
  *id_cliente : PK
  --
  nombre
  correo
  telefono
  direccion
}

entity Productos {
  *id_producto : PK
  --
  nombre
  descripcion
  precio
  stock
  id_categoria : FK
}

entity Categorias {
  *id_categoria : PK
  --
  nombre
  descripcion
}

entity Pedidos {
  *id_pedido : PK
  --
  id_cliente : FK
  fecha_pedido
  estado
}

entity Detalles_Pedido {
  *id_detalle : PK
  --
  id_pedido : FK
  id_producto : FK
  cantidad
  precio_unitario
}

entity Reseñas {
  *id_reseña : PK
  --
  id_producto : FK
  id_cliente : FK
  calificacion
  comentario
  fecha
}

' Relaciones de las tablas
Clientes ||--o{ Pedidos 
Clientes ||--o{ Reseñas 
Categorias ||--o{ Productos 
Productos ||--o{ Detalles_Pedido 
Productos ||--o{ Reseñas 
Pedidos ||--o{ Detalles_Pedido 

@enduml

![alt text](DIAGRAMA.png)