USE `musica2`;

/* EJERCICIO 1: ¿Qué género tiene el promedio más alto de reproducciones? */

SELECT ROUND(AVG(playcount)) AS Promedio, genre as Género -- Redondeo al entero, ya que vamos a tratar en millones de reproducciones.
	FROM info_artistas_last_fm as lfm
	INNER JOIN canciones_spotify as sp
		ON lfm.artista_nombre = sp.artista
	GROUP BY genre;
    
	
/* EJERCICIO 2: ¿Cuántos artistas pertenecen a cada género en la base de datos y cuál es el género con más artistas?. */

-- artistas por genero
SELECT genre AS genero, COUNT(DISTINCT(artista)) AS numero_artistas
    FROM canciones_spotify
    GROUP BY genre;

-- genero con mas artistas
WITH ArtistasPorGenero AS (
    SELECT genre AS genero, COUNT(DISTINCT(artista)) AS numero_artistas
    FROM canciones_spotify
    GROUP BY genre
)
SELECT genre, numero_artistas AS genero_con_mas_artistas
FROM ArtistasPorGenero
WHERE numero_artistas = (SELECT MAX(numero_artistas) FROM ArtistasPorGenero);


/* EJERCICIO 3: ¿Cuántos artistas tienen menos de 100,000 reproducciones? */ 

SELECT COUNT(artista_nombre) AS artitas_con_menos_10000
	FROM info_artistas_last_fm
    WHERE playcount < 100000;


/* EJERCICIO 4: ¿Cuál es el artista con más Listeners?. */

SELECT artista_nombre, listeners
	FROM info_artistas_last_fm
	WHERE listeners = (SELECT MAX(listeners) FROM info_artistas_last_fm);


/* EJERCICIO 5: ¿Qué país tiene mas artistas? (ordenar por cantidad) */ 
SELECT pais_origen AS pais,  COUNT(DISTINCT artista_nombre) AS numero_artistas
	FROM info_artistas_musicbrainz
	GROUP BY pais_origen
    ORDER BY numero_artistas DESC
    LIMIT 1;
	
    


/* EJERCICIO 6: ¿Qué artista estuvo mas tiempo y cuantas canciones tiene en el rango extraído de información? */ 

SELECT artista_nombre AS Artista, 
       DATEDIFF(COALESCE(fin_actividad, CURRENT_DATE()), inicio_actividad) AS TiempoActivoDias,
       COUNT(canciones_spotify.artista_id) AS NumeroCanciones
FROM info_artistas_musicbrainz
JOIN canciones_spotify ON info_artistas_musicbrainz.artista_nombre = canciones_spotify.artista
GROUP BY Artista, TiempoActivoDias
ORDER BY TiempoActivoDias DESC
LIMIT 1;
