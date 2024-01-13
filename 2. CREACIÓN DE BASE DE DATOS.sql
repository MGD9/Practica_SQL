CREATE DATABASE keepcoding;

CREATE TABLE profesor (
	profesor_id SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	apellido1 VARCHAR(255),
	apellido2 VARCHAR(255),
	email VARCHAR(255) NOT NULL
);


CREATE TABLE direccion (
	direccion_id SERIAL PRIMARY KEY,
	pais VARCHAR(255),
	ciudad VARCHAR(255),
	calle VARCHAR(255),
	numero VARCHAR(255),
	profesor_id INT,
	FOREIGN KEY (profesor_id) REFERENCES profesor(profesor_id)
);

alter table alumno ADD COLUMN telefono VARCHAR(20);
alter table alumno ADD COLUMN nif VARCHAR(15);

-- Tabla de alumnos
CREATE TABLE alumnos (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(255),
  apellido1 VARCHAR(255),
  apellido2 VARCHAR(255),
  email VARCHAR(255),
  telefono VARCHAR(255),
  nif VARCHAR(255)
);

INSERT INTO alumno (nombre, apellido1, apellido2, email, telefono, nif)
VALUES
  ('Laura', 'Suárez', 'López', 'laura.suarez.lopez@gmail.com', '666123457', '12345678B'),
  ('Diego', 'Pérez', 'Rodríguez', 'diego.perez.rodriguez@gmail.com', '666123458', '12345678C'),
  ('Sara', 'Rodríguez', 'López', 'sara.rodríguez.lopez@gmail.com', '666123459', '12345678D'),
  ('David', 'Martínez', 'López', 'david.martinez.lopez@gmail.com', '666123460', '12345678E'),
  ('Alejandro', 'Sánchez', 'García', 'alejandro.sanchez.garcia@gmail.com', '666123461', '987654321'),
  ('Marta', 'García', 'Rodríguez', 'marta.garcia.rodríguez@gmail.com', '666123462', '987654322'),
  ('Daniel', 'López', 'Suárez', 'daniel.lopez.suarez@gmail.com', '666123463', '987654323'),
  ('Elena', 'Martínez', 'Pérez', 'elena.martinez.perez@gmail.com', '666123464', '987654324'),
  ('Pablo', 'García', 'Sánchez', 'pablo.garcia.sanchez@gmail.com', '666123465', '987654325'),
  ('Alba', 'Rodríguez', 'Martínez', 'alba.rodríguez.martinez@gmail.com', '666123466', '987654326'),
  ('Aarón', 'López', 'Suárez', 'aarón.lopez.suarez@gmail.com', '666123467', '987654327'),
  ('Lucía', 'Martínez', 'Pérez', 'lucía.martinez.perez@gmail.com', '666123468', '987654328'),
  ('Antonio', 'García', 'Sánchez', 'antonio.garcia.sanchez@gmail.com', '666123469', '987654329'),
  ('Carmen', 'Rodríguez', 'Martínez', 'carmen.rodríguez.martinez@gmail.com', '666123470', '987654330'),
  ('Iván', 'López', 'Suárez', 'iván.lopez.suarez@gmail.com', '666123471', '987654331'),
  ('Nora', 'Martínez', 'Pérez', 'nora.martinez.perez@gmail.com', '666123472', '987654332');

-- Tabla de alumnos
CREATE TABLE alumnos (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(255),
  apellido1 VARCHAR(255),
  apellido2 VARCHAR(255),
  email VARCHAR(255),
  telefono VARCHAR(255),
  nif VARCHAR(255)
);


INSERT INTO alumno (nombre, apellido1, apellido2, email, telefono, nif)
VALUES
  ('Juan', 'Pérez', NULL, 'juan.perez@keepcoding.com', '666123456', '12345678A'),
  ('María', 'López', NULL, 'maria.lopez@keepcoding.com', '999876543', '987654321'),
  ('Antonio', 'García', 'Martínez', 'antonio.garcia.martinez@keepcoding.com', '666123457', '12345678B'),
  ('Luisa', 'Rodríguez', 'Martínez', 'luisa.rodriguez.martinez@keepcoding.com', '999876544', '987654322'),
  ('Pedro', 'López', 'García', 'pedro.lopez.garcia@keepcoding.com', '666123458', '12345678C'),
  ('Carmen', 'Martín', 'García', 'carmen.martin.garcia@keepcoding.com', '999876545', '987654323'),
  ('José', 'García', 'Pérez', 'jose.garcia.perez@keepcoding.com', '666123459', '12345678D'),
  ('Ana', 'López', 'Martínez', 'ana.lopez.martinez@keepcoding.com', '999876546', '987654324'),
  ('Alberto', 'Rodríguez', 'López', 'alberto.rodriguez.lopez@keepcoding.com', '666123460', '12345678E');

INSERT INTO profesor (nombre, apellido1, apellido2, email)
VALUES 
  ('Izan', 'Vicente', 'Serrano', 'izan.vicente@example.com'),
  ('Agostina', 'López', 'Paredes', 'agostina.lopez@example.com'),
  ('Elva', 'Castañeda', 'Santana', 'elva.castaneda@example.com'),
  ('Adrián', 'Vargas', 'Mendoza', 'adrian.vargas@example.com'),
  ('Lucía', 'Ortega', 'Gallego', 'lucia.ortega@example.com'),
  ('Santiago', 'Gómez', 'Requena', 'santiago.gomez@example.com'),
  ('Amelia', 'Herrera', 'Villalobos', 'amelia.herrera@example.com'),
  ('Iker', 'Ramírez', 'Aranda', 'iker.ramirez@example.com');

ALTER TABLE direccion
ADD COLUMN alumno_id INT;

INSERT INTO direccion (pais, ciudad, calle, numero, alumno_id, profesor_id) VALUES
('España', 'Madrid', 'Gran Vía', '123', 1, NULL),
('España', 'Barcelona', 'Passeig de Gràcia', '456', 2, NULL),
('España', 'Sevilla', 'Callejón del Agua', '789', 3, NULL),
('España', 'Valencia', 'Carrer de la Pau', '101', 4, NULL),
('España', 'Bilbao', 'Ría de Bilbao', '234', 5, NULL),
('España', 'Málaga', 'Calle Larios', '567', 6, NULL),
('España', 'Zaragoza', 'Paseo de la Independencia', '890', 7, NULL),
('España', 'Granada', 'Calle de los Tristes', '112', 8, NULL),
('España', 'Palma de Mallorca', 'Passeig Mallorca', '345', 9, NULL),
('España', 'Murcia', 'Plaza Circular', '678', 10, NULL),
('España', 'Salamanca', 'Plaza Mayor', '901', 11, NULL),
('España', 'Valladolid', 'Paseo Zorrilla', '123', 12, NULL),
('España', 'Cádiz', 'Playa de la Victoria', '456', 13, NULL),
('España', 'Santander', 'Paseo Pereda', '789', 14, NULL),
('España', 'A Coruña', 'Rúa da Franxa', '101', 15, NULL),
('España', 'Pamplona', 'Calle Estafeta', '234', 16, NULL),
('España', 'Gijón', 'Playa de San Lorenzo', '567', 17, NULL),
('España', 'Tarragona', 'Rambla Nova', '890', 18, NULL),
('España', 'Almería', 'Paseo de Almería', '112', 19, NULL),
('España', 'Burgos', 'Calle de la Paloma', '345', 20, NULL),
('España', 'Córdoba', 'Puente Romano', '901', 22, NULL),
('España', 'Logroño', 'Calle del Laurel', '123', 23, NULL),
('España', 'Huelva', 'Muelle de las Carabelas', '456', 24, NULL),
('España', 'Oviedo', 'Calle Uría', '789', 25, NULL),
('España', 'Badajoz', 'Puerta Palmas', '101', NULL, 1),
('España', 'Jaén', 'Paseo de la Estación', '234', NULL, 2),
('España', 'Segovia', 'Calle Real', '567', NULL, 3),
('España', 'Lleida', 'Rambla Ferran', '890', NULL, 4),
('España', 'Teruel', 'Plaza del Torico', '112', NULL, 5),
('España', 'Guadalajara', 'Calle Mayor', '345', NULL, 6),
('España', 'Ávila', 'Muralla de Ávila', '678', NULL, 7),
('Argentina', 'Buenos Aires', 'Avenida 9 de Julio', '345', 21, NULL),
('Argentina', 'Córdoba', 'Bulevar San Juan', '678', NULL, 8);


INSERT INTO precio (precio_contado, precio_financiado)
VALUES
    (7999, 9999),
    (4999, 6249),
    (5999, 7499);

ALTER TABLE direccion
ADD CONSTRAINT alumno_id FOREIGN KEY (alumno_id) REFERENCES alumno(alumno_id);

INSERT INTO bootcamp (nombre_bootcamp, fecha_inicio, fecha_fin)
VALUES
('Big data', DATE '2023-10-01',  DATE '2024-09-30'),
('Ciberseguridad', DATE '2023-10-01',  DATE '2024-09-30'),
('Programacion', DATE '2023-10-01',  DATE '2024-09-30');


CREATE TABLE precio_bootcamp (
	precio_bootcamp_id SERIAL PRIMARY KEY,
	bootcamp_id INT,
    precio_id INT,
	FOREIGN KEY (bootcamp_id) REFERENCES bootcamp(bootcamp_id),
	FOREIGN KEY (precio_id) REFERENCES precio(precio_id)
);

INSERT INTO precio_bootcamp (bootcamp_id, precio_id)
VALUES
(1, 1),
(2, 2),
(3, 3);

CREATE TABLE alumno_bootcamp (
	alumno_bootcamp_id SERIAL PRIMARY KEY,
	bootcamp_id INT,
    alumno_id INT,
	FOREIGN KEY (bootcamp_id) REFERENCES bootcamp(bootcamp_id),
	FOREIGN KEY (alumno_id) REFERENCES alumno(alumno_id)
);

INSERT INTO alumno_bootcamp (bootcamp_id, alumno_id)
VALUES
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(2, 22),
(3, 23),
(1, 24),
(2, 17),
(3, 16),
(1, 15),
(2, 14),
(2, 1),
(1, 2),
(2, 3),
(3, 4),
(1, 5),
(2, 6),
(1, 7),
(1, 8),
(2, 9),
(3, 10),
(1, 11),
(2, 12),
(3, 13),
(1, 25);


CREATE TABLE profesor_bootcamp (
	profesor_bootcamp_id SERIAL PRIMARY KEY,
	bootcamp_id INT,
    profesor_id INT,
	FOREIGN KEY (bootcamp_id) REFERENCES bootcamp(bootcamp_id),
	FOREIGN KEY (profesor_id) REFERENCES profesor(profesor_id)
);

INSERT INTO profesor_bootcamp (bootcamp_id, profesor_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 1),
(2, 3),
(2, 5),
(2, 7),
(3, 8),
(3, 1),
(3, 4),
(3, 2);


ALTER TABLE bootcamp
DROP COLUMN precio_id;


