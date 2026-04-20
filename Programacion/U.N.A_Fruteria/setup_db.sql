USE instituto_avanzado;

CREATE TABLE IF NOT EXISTS clientes (
    dni VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    id INT,
    fecha_nacimiento DATE,
    telefono INT
);

CREATE TABLE IF NOT EXISTS trabajadores (
    dni VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    id INT,
    fecha_nacimiento DATE,
    disponibilidad VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS proveedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_empresa VARCHAR(100),
    precio_unidad DECIMAL(10,2),
    coste_envio DECIMAL(10,2),
    fecha_entrega DATE,
    tlfn_proveedor INT
);

CREATE TABLE IF NOT EXISTS administradores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50) UNIQUE,
    contrasena VARCHAR(100)
);
