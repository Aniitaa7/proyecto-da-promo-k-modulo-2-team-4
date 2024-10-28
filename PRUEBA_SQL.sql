CREATE SCHEMA `musica`;
USE `musica`;

CREATE TABLE `artistas_spotify` (
    id INT AUTO_INCREMENT,
    nombre_artista VARCHAR(50) NOT NULL,
    PRIMARY KEY(id),
    UNIQUE(nombre_artista) 
);
SELECT * FROM  artistas_spotify
ORDER BY id ASC;


CREATE TABLE `canciones_spotify`(
	id INT AUTO_INCREMENT, 
    artista VARCHAR(50) NOT NULL, 
    tipo ENUM('track', 'album') NOT NULL,
    titulo_cancion VARCHAR(50), 
    nombre_album VARCHAR(100) NOT NULL, 
    año INT NOT NULL, 
    genero VARCHAR(50) NOT NULL,
    PRIMARY KEY(id, titulo_cancion),
    FOREIGN KEY(artista) REFERENCES artistas_spotify(nombre_artista)
    );
    
    ALTER TABLE canciones_spotify

CREATE TABLE `info_artistas_musicbrainz`(
	artista VARCHAR(50) NOT NULL,
    tipo ENUM('group', 'person') NOT NULL,
    pais_origen VARCHAR(20) NULL,
    area_origen VARCHAR(50) NULL,
    inicio_actividad DATE NULL,
    fin_actividad DATE NULL,
    fecha_nacimiento DATE NULL,
    fecha_fallecimiento DATE NULL,
    PRIMARY KEY(artista),
    FOREIGN KEY (artista) REFERENCES artistas_spotify(nombre_artista) ON DELETE CASCADE
    );
    
CREATE TABLE `info_artistas_last_fm`(
	artista VARCHAR(50) NOT NULL,
    biografia TEXT,
    listeners INT DEFAULT 0,  
	playcount INT DEFAULT 0,
    artistas_similares TEXT, 
    PRIMARY KEY(artista),
	FOREIGN KEY (artista) REFERENCES artistas_spotify(nombre_artista) ON DELETE CASCADE
    );
    


    
SHOW GLOBAL VARIABLES LIKE 'local_infile';
 SET GLOBAL local_infile = 'ON';
SHOW GLOBAL VARIABLES LIKE 'local_infile';


LOAD DATA LOCAL INFILE 'C:/Users/Anita/OneDrive/Escritorio/Prueba de importar datos/lista_artistas_spotify.csv'
INTO TABLE artistas_spotify
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;  -- Usa esto si el CSV tiene una cabecera

		