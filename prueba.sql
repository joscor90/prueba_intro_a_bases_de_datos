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

