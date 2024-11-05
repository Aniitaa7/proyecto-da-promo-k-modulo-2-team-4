 CREATE SCHEMA music_sp_mb_lfm;
 
 USE music_sp_mb_lfm;
 
 
 /* creamos la tabla artistas_spotify, que recogerá los datos de lista_artistas_spotify.csv */
 
 CREATE TABLE artistas_spotify (
	id_artista INT AUTO_INCREMENT NOT NULL,
    artista VARCHAR(100),
		PRIMARY KEY (id_artista));
        

SELECT * FROM artistas_spotify;

-- Ahora creamos el resto de talbas, teniendo en cuenta las relaciones para crear las FK
-- Relaciones: 	artistas_spotify => (id_artista/id_artista_spotify) => canciones_spotify
-- 								 
-- 				artistas_spotify => (id_artista/id_artista_lastfm) => info_artistas_last_fm
-- 								
-- 				artistas_spotify => (id_artista/id_artista_musicbrainz) => info_artistas_musicbrainz


/* creamos la tabla canciones_spotify, que recogerá los datos de spotify_df_concatenado.csv */

CREATE TABLE canciones_spotify (
	-- creamos este id para crear una PK que se relacione con todos los datos que contiene esta tabla
	id_cancion INT AUTO_INCREMENT NOT NULL,
    -- creamos este id que va a contener la FK para relacionar con la tabla artistas(tiene que venir dado del csv)
    id_artista INT NOT NULL,
    /* del nombre de artista prescindimos, porque vamos a hacer FK a id_artista_sp 
    con id_artista de la tabla artistas_spotify, que contiene ese dato*/
    tipo VARCHAR(100), 
    título_canción  VARCHAR(100),
    nombre_album VARCHAR(100),
    año INT,
    genre VARCHAR(50),
		PRIMARY KEY (id_cancion),
        CONSTRAINT fk_canciones_spotify_artistas_spotify
			FOREIGN KEY (id_artista)
            REFERENCES artistas_spotify (id_artista));

-- Renombrar las columnas de los id
ALTER TABLE canciones_spotify 
RENAME COLUMN id_artista TO id_artista_sp;

-- comprobación de los datos
SELECT * FROM canciones_spotify;

            
/* creamos la tabla info_artistas_musicbrainz, que recogerá los datos de musicbrainz_df_concatenado.csv */

CREATE TABLE info_artistas_musicbrainz (
	-- creamos este id para crear una PK que se relacione con todos los datos que contiene esta tabla
	id_info_mb INT AUTO_INCREMENT NOT NULL,
    -- creamos este id que va a contener la FK para relacionar con la tabla artistas(tiene que venir dado del csv)
    id_artista INT NOT NULL,
    /* del nombre de artista prescindimos, porque vamos a hacer FK a id_artista_mb
    con id_artista de la tabla artistas_spotify, que contiene ese dato*/
    tipo VARCHAR(50),
    pais_origen VARCHAR(100),
    area_origen VARCHAR(100),
    inicio_actividad VARCHAR(100),
    fin_actividad VARCHAR(100),
    fecha_nacimiento VARCHAR(100),
    fecha_fallecimiento VARCHAR(100),
		PRIMARY KEY (id_info_mb),
        CONSTRAINT fk_info_artistas_musicbranin_artistas_spotity
			FOREIGN KEY (id_artista)
            REFERENCES artistas_spotify (id_artista));

-- Renombrar las columnas de los id
ALTER TABLE info_artistas_musicbrainz 
RENAME COLUMN id_artista TO id_artista_mb;

-- comprobación de los datos
SELECT * FROM info_artistas_musicbrainz;


/* creamos la tabla info_artistas_lastfm, que recogerá los datos de lastfm_df_concatenado.csv */

CREATE TABLE info_artistas_lastfm (
	-- creamos este id para crear una PK que se relacione con todos los datos que contiene esta tabla
	id_info_lfm INT AUTO_INCREMENT NOT NULL,
    id_artista INT NOT NULL,
    /* del nombre de artista prescindimos, porque vamos a hacer FK a id_artista_mb
    con id_artista de la tabla artistas_spotify, que contiene ese dato*/
    biografia LONGTEXT,
    listeners INT,
    playcount BIGINT,
    artistas_similares TEXT,
		PRIMARY KEY (id_info_lfm),
        CONSTRAINT fk_info_artistas_lastfm_artistas_spotify
			FOREIGN KEY (id_artista)
			REFERENCES artistas_spotify (id_artista));
            
-- Renombrar las columnas de los id
ALTER TABLE info_artistas_lastfm 
RENAME COLUMN id_artista TO id_artista_lfm;

-- comprobación de los datos
SELECT * FROM info_artistas_lastfm;



-- Relaciones: 	artistas_spotify => (id_artista/id_artista_spotify) => canciones_spotify
-- 								 
-- 				artistas_spotify => (id_artista/id_artista_lastfm) => info_artistas_last_fm
-- 								
-- 				artistas_spotify => (id_artista/id_artista_musicbrainz) => info_artistas_musicbrainz

    
    