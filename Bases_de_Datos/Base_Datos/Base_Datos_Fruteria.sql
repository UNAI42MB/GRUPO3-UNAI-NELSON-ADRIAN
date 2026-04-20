DROP DATABASE IF EXISTS Fruteria;
CREATE DATABASE Fruteria;
USE Fruteria;
CREATE TABLE tienda (
    ident_tiend INT AUTO_INCREMENT PRIMARY KEY,
    nombre CHAR(15) NOT NULL,
    tlfn VARCHAR(17) NOT NULL UNIQUE,
    CHECK (tlfn REGEXP "^\\+[0-9]{1,3}[ ]?[0-9]{3}[ ]?[0-9]{2}[ ]?[0-9]{2}[ ]?[0-9]{2}$")
);

CREATE TABLE proveedor(
    ident_prov INT AUTO_INCREMENT PRIMARY KEY,
    empresa VARCHAR(30) NOT NULL,
    tlfn VARCHAR(17) NOT NULL UNIQUE,
    CHECK (tlfn REGEXP "^\\+[0-9]{1,3}[ ]?[0-9]{3}[ ]?[0-9]{2}[ ]?[0-9]{2}[ ]?[0-9]{2}$")
);

CREATE TABLE transportista(
    ident_trasp INT AUTO_INCREMENT PRIMARY KEY,
    nombre_trasp CHAR(15) NOT NULL,
    apellidos CHAR(30) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    tlfn VARCHAR(17) NOT NULL UNIQUE,
    DNI VARCHAR(9) NOT NULL UNIQUE,
    CHECK (tlfn REGEXP "^\\+[0-9]{1,3}[ ]?[0-9]{3}[ ]?[0-9]{2}[ ]?[0-9]{2}[ ]?[0-9]{2}$"),
    CHECK (DNI REGEXP "[0-9]{8}[A-Z]$")
);

CREATE TABLE cliente (
    ident_client INT AUTO_INCREMENT PRIMARY KEY,
    nombre_client CHAR(15) NOT NULL,
    apellidos CHAR(30) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    tlfn VARCHAR(17) NOT NULL UNIQUE,
    DNI VARCHAR(9) NOT NULL UNIQUE,
    CHECK (tlfn REGEXP "^\\+[0-9]{1,3}[ ]?[0-9]{3}[ ]?[0-9]{2}[ ]?[0-9]{2}[ ]?[0-9]{2}$"),
    CHECK (DNI REGEXP "[0-9]{8}[A-Z]$"),
    ident_tiend INT,
    FOREIGN KEY (ident_tiend) REFERENCES tienda(ident_tiend)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE TABLE transportista_tienda(
    ident_trasp INT,
    ident_tiend INT,
    FOREIGN KEY (ident_trasp) REFERENCES transportista(ident_trasp)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (ident_tiend) REFERENCES tienda(ident_tiend)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    PRIMARY KEY (ident_tiend, ident_trasp)
);

CREATE TABLE proveedor_tienda (
    ident_prov INT,
    ident_tiend INT,
    FOREIGN KEY (ident_prov) REFERENCES proveedor(ident_prov)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (ident_tiend) REFERENCES tienda(ident_tiend)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    PRIMARY KEY (ident_tiend, ident_prov)
);

CREATE TABLE producto(
    ident_product INT AUTO_INCREMENT PRIMARY KEY,
    nombre_product VARCHAR(30) NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    precios DOUBLE(4,2) NOT NULL,
    ident_prov INT,
    ident_client INT,
    ident_trasp INT,
    FOREIGN KEY (ident_prov) REFERENCES proveedor(ident_prov)
        ON UPDATE CASCADE
        ON DELETE SET NULL,
    FOREIGN KEY (ident_client) REFERENCES cliente(ident_client)
        ON UPDATE CASCADE
        ON DELETE SET NULL,
    FOREIGN KEY (ident_trasp) REFERENCES transportista(ident_trasp)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE TABLE verdura(
    ident_Verd INT PRIMARY KEY,
    part_comestible ENUM("Raíz","Tallo","Hoja","Flor") DEFAULT "Tallo",
    FOREIGN KEY (ident_Verd) REFERENCES producto(ident_product)
);

CREATE TABLE fruta(
    ident_Frut INT PRIMARY KEY,
    tipo_Semilla ENUM("Hueso","Pepita","citrico","Sin semilla") DEFAULT "Hueso",
    FOREIGN KEY (ident_Frut) REFERENCES producto(ident_product)
);
INSERT INTO tienda(nombre, tlfn)
VALUES ("U.N.A", "+34 910 48 27 35");
INSERT INTO proveedor(empresa, tlfn)
VALUES ("Eurogroup España","+34 612 84 92 57"),
       ("Frutas Peyfi","+34 722 91 04 66"),
       ("Frutas Ibérika","+34 693 55 28 41");
INSERT INTO transportista(nombre_trasp, apellidos, fecha_nacimiento, tlfn, dni)
VALUES 
("Laura","Fernández López",'1999-02-14',"+34 693 48 29 15",'91820463L'),
("Sergio","Martínez Gómez",'1988-09-22',"+12 028 84 73 12",'64012958R'),
("Daniela","Rodríguez Torres",'2003-05-03',"+52 449 90 35 52",'28471950K'),
("Pablo","Sánchez Ruiz",'1995-12-19',"+49 171 88 23 04",'75918420M'),
("Andrea","Morales Castillo",'2001-06-28',"+552 198 41 27 30",'49281736Z'),
("Hugo","Navarro Días",'1984-06-05',"+81 705 52 18 82",'18304752H'),
("Sofía","Herrera Molina",'1997-10-30',"+33 674 21 98 04",'57392844P');
INSERT INTO cliente(nombre_client, apellidos, fecha_nacimiento, tlfn, dni, ident_tiend)
VALUES
("Maria","Zambrano",'2000-01-01',"+34 648 73 95 21",'49283751J',1),
("Juan","Marquez",'1990-07-12',"+1 305 77 16 24",'18392044M',1),
("Carlos","Perez",'2004-10-20',"+52 812 90 34 55",'50719382K',1),
("José","Hernandez",'2015-02-05',"+49 160 88 31 20",'92841057L',1),
("Alfredo","Lopez",'1998-03-07',"+55 119 82 41 66",'31485972C',1),
("Kevin","Rodriguez",'2002-08-17',"+81 805 53 19 04",'76029418H',1),
("Iker","Gonzalez",'2011-11-11',"+33 672 41 89 55",'24971380S',1);
INSERT INTO producto(nombre_product, fecha_vencimiento, precios, ident_prov, ident_client, ident_trasp)
VALUES
("Manzanas Fuji",'2026-04-18',12.49,1,1,1),
("Peras Conferencia",'2026-04-20',11.29,2,2,2),
("Plátanos de Canarias",'2026-04-16',13.85,3,3,3),
("Naranjas Valencia",'2026-04-25',14.30,1,4,4),
("Fresas frescas",'2026-04-22',15.60,2,5,5),
("Kiwi verde",'2026-04-19',16.25,3,6,6),
("Uvas blancas",'2026-04-17',17.40,1,7,7),
("Tomates rama",'2026-04-13',18.55,2,1,2),
("Lechuga iceberg",'2026-04-28',19.10,3,2,3),
("Zanahorias frescas",'2026-04-30',21.20,1,3,4),
("Patatas nuevas",'2026-05-05',22.45,2,4,5),
("Cebollas dulces",'2026-04-15',23.75,3,5,6),
("Aguacates Hass",'2026-04-16',24.80,1,6,7),
("Pepinos frescos",'2026-04-18',25.95,2,7,1),
("Pimientos rojos",'2027-09-08',26.70,3,1,2);
INSERT INTO transportista_tienda VALUES
(1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1);

INSERT INTO proveedor_tienda VALUES
(1,1),(2,1),(3,1);
INSERT INTO Fruta VALUES
(1,'Pepita'),   -- Manzanas
(2,'Pepita'),   -- Peras
(3,'Sin semilla'), -- Plátanos
(4,'citrico'),  -- Naranjas
(5,'Pepita'),   -- Fresas
(6,'Pepita'),   -- Kiwi
(7,'Pepita'),   -- Uvas
(13,'Pepita');  -- Aguacates

INSERT INTO Verdura VALUES
(8,'Tallo'),   -- Tomates
(9,'Hoja'),    -- Lechuga
(10,'Raíz'),   -- Zanahorias
(11,'Raíz'),   -- Patatas
(12,'Tallo'),  -- Cebollas
(14,'Tallo'),  -- Pepinos
(15,'Tallo');  -- Pimientos



