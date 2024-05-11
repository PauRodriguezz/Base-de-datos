DROP DATABASE IF EXISTS EMarket;
CREATE DATABASE UniversoLector;
USE UniversoLector;

DROP TABLE IF EXISTS Autor;
CREATE TABLE Autor(
	Codigo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Apellido VARCHAR(100) NOT NULL,
	Nombre VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS Editorial;
CREATE TABLE Editorial(
	Codigo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Razon_Social VARCHAR(100) NOT NULL,
    Telefono VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS Libro;
CREATE TABLE Libro(
	Codigo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ISBN VARCHAR(13) NOT NULL,
    Titulo VARCHAR (200) NOT NULL,
    Anio_Escritura DATE,
    Anio_Edicion DATE NOT NULL,
    Codigo_Autor INT,
    Codigo_Editorial INT,
    FOREIGN KEY (Codigo_Autor) REFERENCES autor(Codigo),
    FOREIGN KEY (Codigo_Editorial)REFERENCES  editorial(Codigo)
);

DROP TABLE IF EXISTS Volumen;
CREATE TABLE Volumen(
	Codigo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Codigo_Libro INT,
    Deteriorado BOOL,
    FOREIGN KEY (Codigo_Libro) REFERENCES libro(Codigo)
);

DROP TABLE IF EXISTS Socio;
CREATE TABLE Socio(
	Codigo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    DNI INT NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(200),
    Localidad VARCHAR(100)
);

DROP TABLE IF EXISTS Prestamo;
CREATE TABLE Prestamo(
	Codigo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Codigo_socio INT,
    Fecha DATETIME NOT NULL,
    Fecha_Devolucion DATE,
    Fecha_Tope DATE NOT NULL,
    FOREIGN KEY (Codigo_socio) REFERENCES socio(Codigo)
);

DROP TABLE IF EXISTS PrestamoxVolumen;
CREATE TABLE PrestamoxVolumen(
	Codigo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Codigo_Prestamo INT,
    Codigo_Volumen INT,
    FOREIGN KEY (Codigo_Prestamo) REFERENCES Prestamo(Codigo),
    FOREIGN KEY( Codigo_Volumen) REFERENCES Volumen(Codigo)
);

/*Insertar datos en la tabla socio*/
INSERT INTO socio(Codigo, DNI, Apellido, Nombre, Direccion, Localidad)
VALUE (DEFAULT, 3000000, "PATRICIA", "JOHNSON", "28 MySQL Boulevard", "QLD"), 
 (DEFAULT, 2988800, "LINDA", "WILLIAMS", "23 Workhaven Lane", "Alberta"),
 (DEFAULT, 2500000, "BARBARA", "JONES", "1411 Lillydale Drive", "QLD"),
 (DEFAULT, 32980002, "LOIS", "BUTLER", "1688 Okara Way", "Nothwest Border Prov"),
 (DEFAULT, 2313909, "ROBIN", "HAYES", "262 A Corua (La Corua) Parkway", "Dhaka");

/*Eliminar un socio*/
DELETE FROM socio WHERE Codigo=2;

/*Editar informacion de socio*/
UPDATE socio
SET Direccion = 'Monroe 860'
WHERE Codigo = 3;

/*Insertar datos en la tabla autor*/
INSERT INTO autor(Codigo, Apellido, Nombre)
VALUE (DEFAULT, "Rowling", "J. K. ");

/*Insertar datos en la tabla editorial*/
INSERT INTO editorial(Codigo, Razon_Social, Telefono)
VALUES (DEFAULT, "Bloomsbury Publishing", 54911564874),
(DEFAULT, "Scholastic", 223483646),
(DEFAULT, "Pottermore Limited", 5694839582),
(DEFAULT, "Editorial Salamandra", 011-239-2343); #Modificar el dato del telefono

/*Editar el tipo de dato de la tabla libro (date a year)*/
ALTER TABLE libro 
MODIFY COLUMN Anio_Escritura YEAR, 
MODIFY COLUMN Anio_Edicion YEAR;

/*Insertar datos en la tabla libro*/
INSERT INTO libro(Codigo, ISBN, Titulo, Anio_Escritura, Anio_Edicion, Codigo_Autor, Codigo_Editorial)
VALUES (DEFAULT, '9781907545009', 'Harry Potter y la piedra filosofal', 1997, 1997, 1, 4),
(DEFAULT,'9789878000114', 'Harry Potter Y La Camara Secreta', 2020, 2020, 1, 4);

/*Insertar datos en la tabla volumen*/
INSERT INTO volumen(Codigo, Codigo_Libro, Deteriorado)
VALUE (DEFAULT, 1, 0),
(DEFAULT, 1, 0),
(DEFAULT, 2, 0);

/*Insertar datos en la tabla prestamo*/
INSERT INTO prestamo(Codigo, Codigo_Socio, Fecha, Fecha_Devolucion, Fecha_Tope)
VALUE (DEFAULT, 1,'2020-01-01 00:00:00', '2020-07-01', '2020-07-01' ),
(DEFAULT, 1, '2020-01-07 00:00:00', '2020-01-15', '2020-01-14'),
(DEFAULT, 3, '2020-03-04 00:00:00', '2020-03-08', '2020-03-11');

/*Insertar datos en la tabla prestamoxvolumen*/
INSERT INTO prestamoxvolumen(Codigo, Codigo_Prestamo, Codigo_Volumen)
VALUE (DEFAULT, 4, 1),
(DEFAULT, 5, 2),
(DEFAULT, 6, 1),
(DEFAULT, 6, 3);