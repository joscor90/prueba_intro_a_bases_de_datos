-- Creación de base de datos "prueba"
CREATE DATABASE prueba;

-- Creación de tabla "direcciones"

CREATE TABLE direcciones(id INT NOT NULL UNIQUE, latitud FLOAT NOT NULL, longitud FLOAT NOT NULL, PRIMARY KEY (id));

-- Creación de tabla "clientes"

CREATE TABLE clientes(id INT NOT NULL UNIQUE, nombre VARCHAR(50) NOT NULL, rut INT NOT NULL, direccion INT NOT NULL, PRIMARY KEY (id), FOREIGN KEY (direccion) REFERENCES direcciones(id));

-- Creación de tabla "fechas"

CREATE TABLE fechas(id INT NOT NULL UNIQUE, fecha DATE NOT NULL, PRIMARY KEY (id));

