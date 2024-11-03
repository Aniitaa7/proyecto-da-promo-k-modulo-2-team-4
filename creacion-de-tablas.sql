CREATE SCHEMA `musica2`;
USE `musica2`;

CREATE TABLE `artistas_spotify` (
	id INT AUTO_INCREMENT,
    nombre_artista VARCHAR(100) NOT NULL UNIQUE,  
    PRIMARY KEY (id));
    
SELECT * FROM artistas_spotify ORDER BY id ASC;

CREATE TABLE `canciones_spotify` (
	artista_id INT AUTO_INCREMENT PRIMARY KEY,
    artista VARCHAR(50) NOT NULL,
    tipo ENUM('track', 'album') NOT NULL,
    título_canción VARCHAR(100) NOT NULL,
    nombre_album VARCHAR(100) NOT NULL,
    año INT NOT NULL,
    genero VARCHAR(50) NOT NULL
    -- CONSTRAINT fk_artista_id_spotify FOREIGN KEY (artista_id) REFERENCES artistas_spotify(id) ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT * FROM canciones_spotify;


CREATE TABLE `info_artistas_musicbrainz` (
	id_musicbrainz INT AUTO_INCREMENT PRIMARY KEY,
    artista_nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(100),
    pais_origen VARCHAR(20),
    area_origen VARCHAR(50),
    inicio_actividad VARCHAR(50),
    fin_actividad VARCHAR(50),
    fecha_nacimiento VARCHAR(50),
    fecha_fallecimiento VARCHAR(50)
    -- CONSTRAINT fk_id_musicbrainz FOREIGN KEY (id_musicbrainz) REFERENCES artistas_spotify(id) ON DELETE CASCADE ON UPDTE CASCADE  -- Referencia al nombre del artista
);

SELECT * FROM info_artistas_musicbrainz;





CREATE TABLE `info_artistas_last_fm` (
	id_lastfm INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    artista_nombre VARCHAR(100) NOT NULL,
    biografia LONGTEXT,
    listeners VARCHAR(100),
    playcount VARCHAR(100),
    artistas_similares TEXT);
    -- PRIMARY KEY(artista_nombre),  -- Usar nombre_artista como la clave primaria
    -- CONSTRAINT fk_id_lastfm FOREIGN KEY (id_lastfm) REFERENCES artistas_spotify(id) ON DELETE CASCADE ON UPDTE CASCADE 
SELECT * FROM info_artistas_last_fm;

ALTER TABLE info_artistas_last_fm
	MODIFY COLUMN listeners INT;
    
    