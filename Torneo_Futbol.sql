-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS torneo_futbol;
USE torneo_futbol;

-- Tabla Usuarios
CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    rol ENUM('administrador', 'jugador', 'seguidor') NOT NULL
);

-- Tabla Equipos
CREATE TABLE Equipos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    escudo VARCHAR(255) DEFAULT NULL
);

-- Tabla Jugadores
CREATE TABLE Jugadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    edad INT NOT NULL,
    posicion ENUM('portero', 'defensa', 'mediocampista', 'delantero') NOT NULL,
    numero_casaca INT NOT NULL,
    equipo_id INT,
    FOREIGN KEY (equipo_id) REFERENCES Equipos(id) ON DELETE SET NULL
);

-- Tabla Partidos
CREATE TABLE Partidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    equipo_local_id INT,
    equipo_visitante_id INT,
    fecha DATETIME NOT NULL,
    lugar VARCHAR(255) NOT NULL,
    resultado VARCHAR(50) DEFAULT NULL,
    FOREIGN KEY (equipo_local_id) REFERENCES Equipos(id) ON DELETE SET NULL,
    FOREIGN KEY (equipo_visitante_id) REFERENCES Equipos(id) ON DELETE SET NULL
);

-- Tabla Estadísticas
CREATE TABLE Estadisticas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    jugador_id INT NOT NULL,
    partido_id INT NOT NULL,
    goles INT DEFAULT 0,
    tarjetas ENUM('amarilla', 'roja') DEFAULT NULL,
    FOREIGN KEY (jugador_id) REFERENCES Jugadores(id) ON DELETE CASCADE,
    FOREIGN KEY (partido_id) REFERENCES Partidos(id) ON DELETE CASCADE
);
