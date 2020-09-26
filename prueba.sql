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