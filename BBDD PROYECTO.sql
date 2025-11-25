-- Crear base de datos (opcional)
drop DATABASE IF EXISTS todomail_sig;
create database todomail_sig;
USE todomail_sig;

-- Tabla: clientes
CREATE TABLE clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    rut VARCHAR(12) NOT NULL UNIQUE,
    nombre_completo VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    empresa_rubro VARCHAR(100),
    fecha_primer_contacto DATE NOT NULL,
    canal_adquisicion VARCHAR(50) NOT NULL,
    estado ENUM('activo', 'inactivo') DEFAULT 'activo',
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    INDEX idx_email (email),
    INDEX idx_estado (estado),
    INDEX idx_canal_adquisicion (canal_adquisicion)
);

-- Tabla: campanias
CREATE TABLE campanias (
    campania_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    plan_id INT NOT NULL,
    fecha_envio DATETIME NOT NULL,
    tipo_servicio VARCHAR(50) NOT NULL,
    estado_campania ENUM('planificada', 'enviada', 'cancelada') DEFAULT 'planificada',
    tasa_apertura DECIMAL(5,2) DEFAULT 0.00,
    tasa_clics DECIMAL(5,2) DEFAULT 0.00,
    destinatarios_enviados INT DEFAULT 0,
    asunto_campania VARCHAR(255),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id) ON DELETE CASCADE,
    
    INDEX idx_cliente_id (cliente_id),
    INDEX idx_fecha_envio (fecha_envio),
    INDEX idx_estado_campania (estado_campania)
);

-- Tabla: interacciones
CREATE TABLE interacciones (
    interaccion_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    fecha_interaccion DATETIME NOT NULL,
    tipo_interaccion VARCHAR(50) NOT NULL,
    descripcion TEXT,
    medio_contacto VARCHAR(50) NOT NULL,
    responsable VARCHAR(100),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id) ON DELETE CASCADE,
    
    INDEX idx_cliente_id (cliente_id),
    INDEX idx_fecha_interaccion (fecha_interaccion),
    INDEX idx_tipo_interaccion (tipo_interaccion)
);

-- transacciones 
CREATE TABLE transacciones (
    transaccion_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    fecha_transaccion DATETIME NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    tipo_servicio VARCHAR(50) NOT NULL,
    descripcion TEXT,
    estado_pago ENUM('pendiente', 'pagado', 'cancelado') DEFAULT 'pendiente',
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id) ON DELETE CASCADE,
    
    INDEX idx_cliente_id (cliente_id),
    INDEX idx_fecha_transaccion (fecha_transaccion)
);