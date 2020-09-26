-- CREACIÓN DE BASE DE DATOS Y TABLAS

-- Creación de base de datos "prueba"
CREATE DATABASE prueba;

-- Creación de tabla "direcciones"

CREATE TABLE direcciones(id INT NOT NULL UNIQUE, latitud FLOAT NOT NULL, longitud FLOAT NOT NULL, PRIMARY KEY (id));

-- Creación de tabla "clientes"

CREATE TABLE clientes(id INT NOT NULL UNIQUE, nombre VARCHAR(50) NOT NULL, rut INT NOT NULL, direccion INT NOT NULL, PRIMARY KEY (id), FOREIGN KEY (direccion) REFERENCES direcciones(id));

-- Creación de tabla "fechas"

CREATE TABLE fechas(id INT NOT NULL UNIQUE, fecha DATE NOT NULL, PRIMARY KEY (id));

-- Creación de tabla "facturas"

CREATE TABLE facturas(numero_factura INT NOT NULL UNIQUE, fecha INT NOT NULL, subtotal INT NOT NULL, cliente INT NOT NULL, PRIMARY KEY (numero_factura), FOREIGN KEY (fecha) REFERENCES fechas(id), FOREIGN KEY (cliente) REFERENCES clientes(id));

-- Creación de tabla "categorias"

CREATE TABLE categorias(id INT NOT NULL UNIQUE, nombre VARCHAR(50) NOT NULL, descripcion VARCHAR(200), PRIMARY KEY (id));

-- Creación de tabla "productos"

CREATE TABLE productos(id INT NOT NULL UNIQUE, nombre VARCHAR(50) NOT NULL, descripcion VARCHAR(200), valor_unitario INT NOT NULL, categoria INT NOT NULL, PRIMARY KEY (id), FOREIGN KEY (categoria) REFERENCES categorias(id));

-- Creación de tabla "factura_producto"

CREATE TABLE factura_producto(id INT NOT NULL UNIQUE, factura_id INT NOT NULL, producto_id INT NOT NULL, cantidad INT NOT NULL, valor_total INT NOT NULL, PRIMARY KEY (id), FOREIGN KEY (factura_id) REFERENCES facturas(numero_factura), FOREIGN KEY (producto_id) REFERENCES productos(id));

-- INSERCIÓN DE VALORES EN LA BASE DE DATOS

-- 5 clientes

INSERT INTO direcciones(id, latitud, longitud) VALUES (1, 1.1, 1.2), (2, 1.2, 1.3), (3, 1.3, 1.4), (4, 1.4, 1.5), (5, 1.5, 1.6);

INSERT INTO clientes(id, nombre, rut, direccion) VALUES (1, 'Jose', 111111111, 1), (2, 'Romina', 222222222, 2), (3, 'Diego', 333333333, 3), (4, 'Sebastian', 444444444, 4), (5, 'Eva', 555555555, 5);

-- 3 categorías

INSERT INTO categorias(id, nombre, descripcion) VALUES (1, 'computacion', 'cosas de computacion'), (2, 'ropa', 'cosas para vestir'), (3, 'herramientas', 'cosas para armar y desarmar');

-- 8 productos

INSERT INTO productos(id, nombre, descripcion, valor_unitario, categoria) VALUES (1, 'mouse', 'un mouse para pc', 200, 1), (2, 'teclado', 'teclado para pc', 400, 1), (3, 'monitor', 'monitor para pc', 700, 1), (4, 'gorro', 'gorro de lana', 120, 2), (5, 'polera', 'polera veraniega', 150, 2), (6, 'zapatillas', 'zapatillas deportivas', 250, 2), (7, 'martillo', 'martillo de hierro', 50, 3), (8, 'sierra', 'sierra muy afilada', 100, 3);

-- 10 fechas para las facturas

INSERT INTO fechas(id, fecha) VALUES (1, '2020-01-01'), (2, '2020-01-02'), (3, '2020-01-03'), (4, '2020-01-04'), (5, '2020-01-05'), (6, '2020-01-06'), (7, '2020-01-07'), (8, '2020-01-08'), (9, '2020-01-09'), (10, '2020-01-10');

-- 10 facturas de acuerdo a lo siguiente: 
-- 2 para el cliente 1, con 2 y 3 productos
-- 3 para el cliente 2, con 3, 2 y 3 productos
-- 1 para el cliente 3, con 1 producto
-- 4 para el cliente 4, con 2, 3, 4 y 1 producto

INSERT INTO facturas(numero_factura, fecha, subtotal, cliente) VALUES (1, 1, 600, 1), (2, 2, 1090, 1), (3, 3, 270, 2), (4, 4, 250, 2), (5, 4, 600, 2), (6, 5, 300, 3), (7, 5, 600, 4), (8, 6, 490, 4), (9, 7, 600, 4), (10, 7, 150, 4);

-- Añadiendo el detalle de la compra para cada factura en la tabla "factura_producto"