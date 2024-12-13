CREATE DATABASE gestion_finanzas_personales;

USE gestion_finanzas_personales;

-- Tabla: usuarios
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla: categorias
CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    tipo ENUM('ingreso', 'gasto', 'consumo', 'servicio', 'inversion') NOT NULL
);

-- Tabla: transacciones
CREATE TABLE transacciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    categoria_id INT NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    fecha DATE NOT NULL,
    descripcion TEXT,
    FOREIGN KEY (user_id) REFERENCES usuarios(id),
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- Tabla: inversiones
CREATE TABLE inversiones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    fecha_inversion DATE NOT NULL,
    fecha_recuperacion DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES usuarios(id)
);
