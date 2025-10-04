--                                CONSULTAS DDL
CREATE TABLE Gama (
    id_gama INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    tarifa DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(100) NOT NULL,
    no_cedula VARCHAR(20) NOT NULL UNIQUE,
    correo VARCHAR(100) NOT NULL UNIQUE,
    activo BOOLEAN DEFAULT TRUE
);

CREATE TABLE Local (
    id_local INT AUTO_INCREMENT PRIMARY KEY,
    ciudad VARCHAR(50) NOT NULL
);

CREATE TABLE Producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    tipo VARCHAR(50) NOT NULL  
);


CREATE TABLE Empleado (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(100) NOT NULL,
    no_cedula VARCHAR(20) NOT NULL UNIQUE,
    correo VARCHAR(100) NOT NULL UNIQUE,
    salario DECIMAL(10, 2) NOT NULL,
    id_local INT NOT NULL,
    FOREIGN KEY (id_local) REFERENCES Local(id_local) ON DELETE CASCADE
);

CREATE TABLE Computadora (
    no_computadora INT AUTO_INCREMENT PRIMARY KEY,  
    estado VARCHAR(50) NOT NULL DEFAULT 'disponible',  
    tarifa DECIMAL(10, 2) NOT NULL,
    id_gama INT NOT NULL,
    id_local INT NOT NULL,
    id_cliente INT, 
    FOREIGN KEY (id_gama) REFERENCES Gama(id_gama) ON DELETE RESTRICT,
    FOREIGN KEY (id_local) REFERENCES Local(id_local) ON DELETE CASCADE,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente) ON DELETE SET NULL
);

CREATE TABLE Compra (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    cantidad INT NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_cliente INT NOT NULL,
    id_producto INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente) ON DELETE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto) ON DELETE CASCADE
);
