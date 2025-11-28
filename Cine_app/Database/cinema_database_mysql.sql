-- ============================================
-- Script de Base de Datos para Cine_app (MySQL)
-- Base de Datos: Cine_(nombre) (AWS RDS)
-- ============================================

-- Eliminar la base de datos si existe
DROP DATABASE IF EXISTS Cine_(nombre);

-- Crear la base de datos
CREATE DATABASE Cine_(nombre) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

SELECT 'Base de datos Cine_(nombre) creada' AS Mensaje;

-- Usar la base de datos
USE Cine_(nombre);

-- ============================================
-- Crear Tabla: Usuarios
-- ============================================
CREATE TABLE Usuarios (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Apellidos VARCHAR(100) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    Telefono VARCHAR(20),
    FechaRegistro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Activo BOOLEAN NOT NULL DEFAULT TRUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SELECT 'Tabla Usuarios creada' AS Mensaje;

-- ============================================
-- Crear Tabla: Peliculas
-- ============================================
CREATE TABLE Peliculas (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR(200) NOT NULL,
    Descripcion TEXT,
    Director VARCHAR(100),
    Duracion INT, -- En minutos
    Genero VARCHAR(50),
    FechaEstreno DATE,
    ImagenUrl VARCHAR(500),
    Calificacion DECIMAL(3,1),
    Activa BOOLEAN NOT NULL DEFAULT TRUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SELECT 'Tabla Peliculas creada' AS Mensaje;

-- ============================================
-- Crear Tabla: Salas
-- ============================================
CREATE TABLE Salas (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Filas INT NOT NULL,
    ColumnasPerFila INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SELECT 'Tabla Salas creada' AS Mensaje;

-- ============================================
-- Crear Tabla: Sesiones
-- ============================================
CREATE TABLE Sesiones (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    PeliculaId INT NOT NULL,
    SalaId INT NOT NULL,
    FechaHora DATETIME NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    Activa BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT FK_Sesiones_Peliculas FOREIGN KEY (PeliculaId) REFERENCES Peliculas(Id) ON DELETE CASCADE,
    CONSTRAINT FK_Sesiones_Salas FOREIGN KEY (SalaId) REFERENCES Salas(Id),
    INDEX IX_Sesiones_PeliculaId (PeliculaId),
    INDEX IX_Sesiones_FechaHora (FechaHora),
    INDEX IX_Sesiones_SalaId (SalaId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SELECT 'Tabla Sesiones creada' AS Mensaje;

-- ============================================
-- Crear Tabla: Butacas
-- ============================================
CREATE TABLE Butacas (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    SalaId INT NOT NULL,
    Fila INT NOT NULL,
    Columna INT NOT NULL,
    Tipo VARCHAR(20) NOT NULL DEFAULT 'Normal', -- Normal, VIP, Discapacitado
    Activa BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT FK_Butacas_Salas FOREIGN KEY (SalaId) REFERENCES Salas(Id) ON DELETE CASCADE,
    CONSTRAINT UQ_Butacas_Sala_Fila_Columna UNIQUE (SalaId, Fila, Columna),
    INDEX IX_Butacas_SalaId (SalaId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SELECT 'Tabla Butacas creada' AS Mensaje;

-- ============================================
-- Crear Tabla: Reservas
-- ============================================
CREATE TABLE Reservas (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    UsuarioId INT NOT NULL,
    SesionId INT NOT NULL,
    FechaReserva DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Total DECIMAL(10,2) NOT NULL,
    Estado VARCHAR(20) NOT NULL DEFAULT 'Pendiente', -- Pendiente, Confirmada, Cancelada
    CodigoReserva VARCHAR(50),
    CONSTRAINT FK_Reservas_Usuarios FOREIGN KEY (UsuarioId) REFERENCES Usuarios(Id),
    CONSTRAINT FK_Reservas_Sesiones FOREIGN KEY (SesionId) REFERENCES Sesiones(Id),
    INDEX IX_Reservas_UsuarioId (UsuarioId),
    INDEX IX_Reservas_SesionId (SesionId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SELECT 'Tabla Reservas creada' AS Mensaje;

-- ============================================
-- Crear Tabla: ReservaButacas (nombre corregido)
-- ============================================
CREATE TABLE ReservasButacas (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    ReservaId INT NOT NULL,
    ButacaId INT NOT NULL,
    SesionId INT NOT NULL,
    CONSTRAINT FK_ReservaButacas_Reservas FOREIGN KEY (ReservaId) REFERENCES Reservas(Id) ON DELETE CASCADE,
    CONSTRAINT FK_ReservaButacas_Butacas FOREIGN KEY (ButacaId) REFERENCES Butacas(Id),
    CONSTRAINT FK_ReservaButacas_Sesiones FOREIGN KEY (SesionId) REFERENCES Sesiones(Id),
    CONSTRAINT UQ_ReservaButacas_Butaca_Sesion UNIQUE (ButacaId, SesionId),
    INDEX IX_ReservaButacas_SesionId (SesionId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SELECT 'Tabla ReservasButacas creada' AS Mensaje;

-- ============================================
-- INSERTAR DATOS DE PRUEBA
-- ============================================

SELECT 'Insertando datos de prueba...' AS Mensaje;

-- ============================================
-- Insertar Usuarios de prueba
-- ============================================
INSERT INTO Usuarios (Nombre, Apellidos, Email, Password, Telefono, FechaRegistro) VALUES
('Juan', 'Pérez García', 'juan.perez@email.com', 'password123', '612345678', NOW()),
('María', 'López Martínez', 'maria.lopez@email.com', 'password123', '623456789', NOW()),
('Carlos', 'González Ruiz', 'carlos.gonzalez@email.com', 'password123', '634567890', NOW()),
('Ana', 'Rodríguez Sánchez', 'ana.rodriguez@email.com', 'password123', '645678901', NOW());

SELECT '4 Usuarios insertados' AS Mensaje;

-- ============================================
-- Insertar Películas de prueba
-- ============================================
INSERT INTO Peliculas (Titulo, Descripcion, Director, Duracion, Genero, FechaEstreno, ImagenUrl, Calificacion, Activa) VALUES
('Oppenheimer', 'La historia del científico J. Robert Oppenheimer y su papel en el desarrollo de la bomba atómica.', 'Christopher Nolan', 180, 'Drama/Histórico', '2023-07-21', 'https://image.tmdb.org/t/p/w500/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg', 8.5, TRUE),
('Barbie', 'Barbie y Ken están teniendo el mejor momento de sus vidas en el colorido y aparentemente perfecto mundo de Barbie Land.', 'Greta Gerwig', 114, 'Comedia/Fantasía', '2023-07-21', 'https://image.tmdb.org/t/p/w500/iuFNMS8U5cb6xfzi51Dbkovj7vM.jpg', 7.8, TRUE),
('Dune: Parte Dos', 'Paul Atreides se une a Chani y los Fremen mientras busca venganza contra los conspiradores que destruyeron a su familia.', 'Denis Villeneuve', 166, 'Ciencia Ficción', '2024-03-01', 'https://image.tmdb.org/t/p/w500/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg', 8.9, TRUE),
('Guardianes de la Galaxia Vol. 3', 'Peter Quill debe reunir a su equipo para defender el universo y proteger a uno de los suyos.', 'James Gunn', 150, 'Acción/Aventura', '2023-05-05', 'https://image.tmdb.org/t/p/w500/r2J02Z2OpNTctfOSN1Ydgii51I3.jpg', 8.1, TRUE),
('Spider-Man: Across the Spider-Verse', 'Miles Morales regresa para la próxima aventura del Spider-Verse.', 'Joaquim Dos Santos', 140, 'Animación/Acción', '2023-06-02', 'https://image.tmdb.org/t/p/w500/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg', 8.7, TRUE),
('The Super Mario Bros. Movie', 'Un fontanero llamado Mario viaja a través de un laberinto subterráneo con su hermano Luigi.', 'Aaron Horvath', 92, 'Animación/Aventura', '2023-04-05', 'https://image.tmdb.org/t/p/w500/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg', 7.5, TRUE),
('Inception', 'Un ladrón que roba secretos corporativos a través del uso de la tecnología de compartir sueños.', 'Christopher Nolan', 148, 'Ciencia Ficción/Thriller', '2010-07-16', 'https://image.tmdb.org/t/p/w500/9gk7adHYeDvHkCSEqAvQNLV5Uge.jpg', 8.8, TRUE),
('The Dark Knight', 'Cuando la amenaza conocida como el Joker emerge, Batman debe aceptar una de las mayores pruebas psicológicas y físicas.', 'Christopher Nolan', 152, 'Acción/Crimen', '2008-07-18', 'https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg', 9.0, TRUE),
('Interstellar', 'Un equipo de exploradores viaja a través de un agujero de gusano en el espacio para asegurar la supervivencia de la humanidad.', 'Christopher Nolan', 169, 'Ciencia Ficción/Drama', '2014-11-07', 'https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg', 8.7, TRUE),
('Avatar: The Way of Water', 'Jake Sully vive con su nueva familia formada en el planeta de Pandora.', 'James Cameron', 192, 'Ciencia Ficción/Aventura', '2022-12-16', 'https://image.tmdb.org/t/p/w500/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg', 7.9, TRUE);

SELECT '10 Películas insertadas' AS Mensaje;

-- ============================================
-- Insertar Salas
-- ============================================
INSERT INTO Salas (Nombre, Filas, ColumnasPerFila) VALUES
('Sala 1 - Premium', 8, 10),
('Sala 2 - Estándar', 10, 12),
('Sala 3 - VIP', 6, 8),
('Sala 4 - IMAX', 12, 15);

SELECT '4 Salas insertadas' AS Mensaje;

-- ============================================
-- Insertar Butacas para cada sala
-- ============================================

SELECT 'Generando butacas para las salas...' AS Mensaje;

-- Procedimiento para insertar butacas de Sala 1 (8 filas x 10 columnas = 80 butacas)
DELIMITER //
CREATE PROCEDURE InsertarButacasSala1()
BEGIN
    DECLARE vFila INT DEFAULT 1;
    DECLARE vColumna INT;
    
    WHILE vFila <= 8 DO
        SET vColumna = 1;
        WHILE vColumna <= 10 DO
            INSERT INTO Butacas (SalaId, Fila, Columna, Tipo, Activa) 
            VALUES (1, vFila, vColumna, 
                    CASE 
                        WHEN vFila >= 6 THEN 'VIP'
                        ELSE 'Normal'
                    END, TRUE);
            SET vColumna = vColumna + 1;
        END WHILE;
        SET vFila = vFila + 1;
    END WHILE;
END //
DELIMITER ;

CALL InsertarButacasSala1();
DROP PROCEDURE InsertarButacasSala1;

-- Procedimiento para insertar butacas de Sala 2 (10 filas x 12 columnas = 120 butacas)
DELIMITER //
CREATE PROCEDURE InsertarButacasSala2()
BEGIN
    DECLARE vFila INT DEFAULT 1;
    DECLARE vColumna INT;
    
    WHILE vFila <= 10 DO
        SET vColumna = 1;
        WHILE vColumna <= 12 DO
            INSERT INTO Butacas (SalaId, Fila, Columna, Tipo, Activa) 
            VALUES (2, vFila, vColumna, 'Normal', TRUE);
            SET vColumna = vColumna + 1;
        END WHILE;
        SET vFila = vFila + 1;
    END WHILE;
END //
DELIMITER ;

CALL InsertarButacasSala2();
DROP PROCEDURE InsertarButacasSala2;

-- Procedimiento para insertar butacas de Sala 3 (6 filas x 8 columnas = 48 butacas VIP)
DELIMITER //
CREATE PROCEDURE InsertarButacasSala3()
BEGIN
    DECLARE vFila INT DEFAULT 1;
    DECLARE vColumna INT;
    
    WHILE vFila <= 6 DO
        SET vColumna = 1;
        WHILE vColumna <= 8 DO
            INSERT INTO Butacas (SalaId, Fila, Columna, Tipo, Activa) 
            VALUES (3, vFila, vColumna, 'VIP', TRUE);
            SET vColumna = vColumna + 1;
        END WHILE;
        SET vFila = vFila + 1;
    END WHILE;
END //
DELIMITER ;

CALL InsertarButacasSala3();
DROP PROCEDURE InsertarButacasSala3;

-- Procedimiento para insertar butacas de Sala 4 (12 filas x 15 columnas = 180 butacas)
DELIMITER //
CREATE PROCEDURE InsertarButacasSala4()
BEGIN
    DECLARE vFila INT DEFAULT 1;
    DECLARE vColumna INT;
    
    WHILE vFila <= 12 DO
        SET vColumna = 1;
        WHILE vColumna <= 15 DO
            INSERT INTO Butacas (SalaId, Fila, Columna, Tipo, Activa) 
            VALUES (4, vFila, vColumna, 
                    CASE 
                        WHEN vFila = 1 AND vColumna IN (1, 2, 14, 15) THEN 'Discapacitado'
                        WHEN vFila >= 10 THEN 'VIP'
                        ELSE 'Normal'
                    END, TRUE);
            SET vColumna = vColumna + 1;
        END WHILE;
        SET vFila = vFila + 1;
    END WHILE;
END //
DELIMITER ;

CALL InsertarButacasSala4();
DROP PROCEDURE InsertarButacasSala4;

SELECT '428 Butacas insertadas (Sala 1: 80, Sala 2: 120, Sala 3: 48, Sala 4: 180)' AS Mensaje;

-- ============================================
-- Insertar Sesiones para hoy y próximos días
-- ============================================

SELECT 'Insertando sesiones...' AS Mensaje;

-- Sesiones para HOY
INSERT INTO Sesiones (PeliculaId, SalaId, FechaHora, Precio, Activa) VALUES
-- Oppenheimer
(1, 4, DATE_ADD(CURDATE(), INTERVAL 16 HOUR), 12.50, TRUE),
(1, 4, DATE_ADD(CURDATE(), INTERVAL 20 HOUR), 14.00, TRUE),
-- Barbie
(2, 2, DATE_ADD(CURDATE(), INTERVAL 17 HOUR), 9.50, TRUE),
(2, 2, DATE_ADD(CURDATE(), INTERVAL 19 HOUR), 9.50, TRUE),
(2, 2, DATE_ADD(CURDATE(), INTERVAL 21 HOUR), 11.00, TRUE),
-- Dune: Parte Dos
(3, 4, DATE_ADD(CURDATE(), INTERVAL 18 HOUR), 13.00, TRUE),
(3, 1, DATE_ADD(CURDATE(), INTERVAL 22 HOUR), 12.00, TRUE),
-- Guardianes de la Galaxia Vol. 3
(4, 2, DATE_ADD(CURDATE(), INTERVAL 16 HOUR), 10.00, TRUE),
(4, 3, DATE_ADD(CURDATE(), INTERVAL 20 HOUR), 15.00, TRUE),
-- Spider-Man
(5, 1, DATE_ADD(CURDATE(), INTERVAL 17 HOUR), 10.50, TRUE),
(5, 1, DATE_ADD(CURDATE(), INTERVAL 21 HOUR), 11.50, TRUE);

-- Sesiones para MAÑANA
INSERT INTO Sesiones (PeliculaId, SalaId, FechaHora, Precio, Activa) VALUES
-- Oppenheimer
(1, 4, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 1 DAY), INTERVAL 15 HOUR), 12.50, TRUE),
(1, 4, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 1 DAY), INTERVAL 19 HOUR), 14.00, TRUE),
(1, 4, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 1 DAY), INTERVAL 22 HOUR), 14.00, TRUE),
-- Barbie
(2, 2, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 1 DAY), INTERVAL 16 HOUR), 9.50, TRUE),
(2, 2, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 1 DAY), INTERVAL 18 HOUR), 9.50, TRUE),
(2, 2, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 1 DAY), INTERVAL 20 HOUR), 11.00, TRUE),
(2, 2, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 1 DAY), INTERVAL 22 HOUR), 11.00, TRUE),
-- Dune: Parte Dos
(3, 4, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 1 DAY), INTERVAL 17 HOUR), 13.00, TRUE),
(3, 1, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 1 DAY), INTERVAL 21 HOUR), 12.00, TRUE),
-- The Super Mario Bros
(6, 2, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 1 DAY), INTERVAL 15 HOUR), 8.50, TRUE),
(6, 2, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 1 DAY), INTERVAL 17 HOUR), 8.50, TRUE),
-- Inception
(7, 3, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 1 DAY), INTERVAL 20 HOUR), 14.00, TRUE),
-- The Dark Knight
(8, 3, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 1 DAY), INTERVAL 18 HOUR), 14.00, TRUE);

-- Sesiones para PASADO MAÑANA
INSERT INTO Sesiones (PeliculaId, SalaId, FechaHora, Precio, Activa) VALUES
-- Spider-Man
(5, 1, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 2 DAY), INTERVAL 16 HOUR), 10.50, TRUE),
(5, 1, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 2 DAY), INTERVAL 19 HOUR), 11.50, TRUE),
(5, 4, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 2 DAY), INTERVAL 21 HOUR), 13.00, TRUE),
-- Interstellar
(9, 4, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 2 DAY), INTERVAL 17 HOUR), 12.50, TRUE),
(9, 3, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 2 DAY), INTERVAL 21 HOUR), 15.00, TRUE),
-- Avatar
(10, 4, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 2 DAY), INTERVAL 15 HOUR), 13.50, TRUE),
(10, 4, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 2 DAY), INTERVAL 19 HOUR), 14.50, TRUE),
-- Barbie
(2, 2, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 2 DAY), INTERVAL 18 HOUR), 9.50, TRUE),
(2, 2, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 2 DAY), INTERVAL 20 HOUR), 11.00, TRUE);

-- Sesiones para dentro de 3 días
INSERT INTO Sesiones (PeliculaId, SalaId, FechaHora, Precio, Activa) VALUES
-- Dune: Parte Dos
(3, 4, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 3 DAY), INTERVAL 16 HOUR), 13.00, TRUE),
(3, 4, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 3 DAY), INTERVAL 20 HOUR), 14.00, TRUE),
-- The Dark Knight
(8, 3, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 3 DAY), INTERVAL 19 HOUR), 14.00, TRUE),
-- Guardianes de la Galaxia
(4, 2, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 3 DAY), INTERVAL 17 HOUR), 10.00, TRUE),
(4, 2, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 3 DAY), INTERVAL 21 HOUR), 11.00, TRUE);

SELECT '40 Sesiones insertadas (distribuidas en 4 días)' AS Mensaje;

-- ============================================
-- Insertar algunas Reservas de ejemplo
-- ============================================
INSERT INTO Reservas (UsuarioId, SesionId, FechaReserva, Total, Estado, CodigoReserva) VALUES
(1, 1, NOW(), 25.00, 'Confirmada', 'RES-2024-00001'),
(2, 3, NOW(), 19.00, 'Confirmada', 'RES-2024-00002'),
(3, 5, NOW(), 22.00, 'Pendiente', 'RES-2024-00003');

SELECT '3 Reservas de ejemplo insertadas' AS Mensaje;

-- ============================================
-- Insertar ReservaButacas de ejemplo
-- ============================================
-- Reserva 1: Usuario 1, Sesión 1 (Oppenheimer Sala 4 hoy 16:00), 2 butacas
INSERT INTO ReservasButacas (ReservaId, ButacaId, SesionId)
SELECT 1, Id, 1 FROM Butacas WHERE SalaId = 4 AND Fila = 6 AND Columna = 7 LIMIT 1;

INSERT INTO ReservasButacas (ReservaId, ButacaId, SesionId)
SELECT 1, Id, 1 FROM Butacas WHERE SalaId = 4 AND Fila = 6 AND Columna = 8 LIMIT 1;

-- Reserva 2: Usuario 2, Sesión 3 (Barbie Sala 2 hoy 17:00), 2 butacas
INSERT INTO ReservasButacas (ReservaId, ButacaId, SesionId)
SELECT 2, Id, 3 FROM Butacas WHERE SalaId = 2 AND Fila = 5 AND Columna = 5 LIMIT 1;

INSERT INTO ReservasButacas (ReservaId, ButacaId, SesionId)
SELECT 2, Id, 3 FROM Butacas WHERE SalaId = 2 AND Fila = 5 AND Columna = 6 LIMIT 1;

-- Reserva 3: Usuario 3, Sesión 5 (Barbie Sala 2 hoy 21:00), 2 butacas
INSERT INTO ReservasButacas (ReservaId, ButacaId, SesionId)
SELECT 3, Id, 5 FROM Butacas WHERE SalaId = 2 AND Fila = 7 AND Columna = 6 LIMIT 1;

INSERT INTO ReservasButacas (ReservaId, ButacaId, SesionId)
SELECT 3, Id, 5 FROM Butacas WHERE SalaId = 2 AND Fila = 7 AND Columna = 7 LIMIT 1;

SELECT 'ReservasButacas insertadas (6 butacas reservadas en total)' AS Mensaje;

-- ============================================
-- CONSULTAS DE VERIFICACIÓN
-- ============================================

SELECT '============================================' AS '';
SELECT 'VERIFICACIÓN DE DATOS' AS '';
SELECT '============================================' AS '';

-- Contar registros por tabla
SELECT 'Usuarios' as Tabla, COUNT(*) as Total FROM Usuarios
UNION ALL
SELECT 'Peliculas', COUNT(*) FROM Peliculas
UNION ALL
SELECT 'Salas', COUNT(*) FROM Salas
UNION ALL
SELECT 'Butacas', COUNT(*) FROM Butacas
UNION ALL
SELECT 'Sesiones', COUNT(*) FROM Sesiones
UNION ALL
SELECT 'Reservas', COUNT(*) FROM Reservas
UNION ALL
SELECT 'ReservasButacas', COUNT(*) FROM ReservasButacas;

-- Ver sesiones de hoy
SELECT '============================================' AS '';
SELECT 'SESIONES DISPONIBLES HOY' AS '';
SELECT '============================================' AS '';

SELECT 
    s.Id,
    p.Titulo as Pelicula,
    sa.Nombre as Sala,
    DATE_FORMAT(s.FechaHora, '%H:%i') as Hora,
    s.Precio,
    sa.Filas * sa.ColumnasPerFila as CapacidadTotal,
    IFNULL((SELECT COUNT(*) FROM ReservasButacas rb WHERE rb.SesionId = s.Id), 0) as ButacasReservadas
FROM Sesiones s
INNER JOIN Peliculas p ON s.PeliculaId = p.Id
INNER JOIN Salas sa ON s.SalaId = sa.Id
WHERE DATE(s.FechaHora) = CURDATE()
ORDER BY s.FechaHora;

-- Ver todas las reservas
SELECT '============================================' AS '';
SELECT 'RESERVAS EXISTENTES' AS '';
SELECT '============================================' AS '';

SELECT 
    r.CodigoReserva,
    CONCAT(u.Nombre, ' ', u.Apellidos) as Usuario,
    p.Titulo as Pelicula,
    DATE_FORMAT(s.FechaHora, '%d/%m/%Y %H:%i') as FechaHoraSesion,
    sa.Nombre as Sala,
    (SELECT COUNT(*) FROM ReservasButacas WHERE ReservaId = r.Id) as NumButacas,
    r.Total,
    r.Estado
FROM Reservas r
INNER JOIN Usuarios u ON r.UsuarioId = u.Id
INNER JOIN Sesiones s ON r.SesionId = s.Id
INNER JOIN Peliculas p ON s.PeliculaId = p.Id
INNER JOIN Salas sa ON s.SalaId = sa.Id
ORDER BY r.FechaReserva DESC;

SELECT '============================================' AS '';
SELECT '? Base de datos Cine_(nombre) creada exitosamente en AWS RDS' AS '';
SELECT '============================================' AS '';
SELECT '' AS '';
SELECT 'RESUMEN:' AS '';
SELECT '- Usuarios: 4' AS '';
SELECT '- Películas: 10' AS '';
SELECT '- Salas: 4' AS '';
SELECT '- Butacas: 428 (total en todas las salas)' AS '';
SELECT '- Sesiones: 40 (distribuidas en 4 días)' AS '';
SELECT '- Reservas: 3' AS '';
SELECT '- ReservasButacas: 6' AS '';
SELECT '' AS '';
SELECT 'La base de datos está lista para usar con tu aplicación Cine_app' AS '';
SELECT 'Conexión: dbinterfacesnixon.cn0swo6cw91x.us-east-1.rds.amazonaws.com' AS '';
SELECT '============================================' AS '';
