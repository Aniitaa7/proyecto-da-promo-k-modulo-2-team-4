-- Tabla de informacion de MusicBrainz para artistas solistas

CREATE TABLE info_mb_artistas AS SELECT
		id_info_mb, 
        id_artista_mb, 
		tipo, 
        pais_origen, 
		area_origen, 
		fecha_nacimiento, 
		fecha_fallecimiento
FROM info_artistas_musicbrainz
WHERE tipo = 'Person';

SELECT * FROM info_mb_artistas;

-- Tabla de informacion de MusicBrainz para grupos

CREATE TABLE info_mb_grupos AS SELECT
		id_info_mb, 
        id_artista_mb, 
		tipo, 
        pais_origen, 
		area_origen, 
		inicio_actividad, 
		fin_actividad
FROM info_artistas_musicbrainz
WHERE tipo = 'Group';

SELECT * FROM info_mb_grupos;
