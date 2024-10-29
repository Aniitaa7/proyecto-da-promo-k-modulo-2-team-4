CREATE SCHEMA `musica`;
USE `musica`;

CREATE TABLE `artistas_spotify` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_artista VARCHAR(100) NOT NULL UNIQUE
);

SELECT *
FROM artistas_spotify 
ORDER BY id ASC;

CREATE TABLE `canciones_spotify` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    artista_id INT NOT NULL,
    tipo ENUM('track', 'album') NOT NULL,
    titulo_cancion VARCHAR(100) NOT NULL,
    nombre_album VARCHAR(100) NOT NULL,
    año INT NOT NULL,
    genero VARCHAR(50) NOT NULL,
    FOREIGN KEY(artista_id) REFERENCES artistas_spotify(id)
);
CREATE TABLE `info_artistas_musicbrainz` (
    artista_id INT NOT NULL,
    tipo ENUM('group', 'person') NOT NULL,
    pais_origen VARCHAR(20) NULL,
    area_origen VARCHAR(50) NULL,
    inicio_actividad DATE NULL,
    fin_actividad DATE NULL,
    fecha_nacimiento DATE NULL,
    fecha_fallecimiento DATE NULL,
    PRIMARY KEY(artista_id),
    FOREIGN KEY (artista_id) REFERENCES artistas_spotify(id) ON DELETE CASCADE
);
CREATE TABLE `info_artistas_last_fm` (
    artista_id INT NOT NULL,
    biografia TEXT,
    listeners INT DEFAULT 0,
    playcount INT DEFAULT 0,
