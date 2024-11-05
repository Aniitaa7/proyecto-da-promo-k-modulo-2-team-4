########### ANÁLISIS Y CONSULTA DE DATOS #############

/*  1. ==>> Género que tiene el promedio más alto de reproducciones */ 

/* Relaciones: 	canciones_spotify ## género ## => (id_artista_sp/id_artista) => artistas_spotify)
		        artistas_spotify => (id_artista/id_artista_lfm) => info_artistas_lastfm ## listeners ## */


SELECT csp.genre AS genero, AVG(lfm.playcount) AS media_reproducciones
	FROM canciones_spotify AS csp
    INNER JOIN info_artistas_lastfm AS lfm
		ON csp.id_artista_sp = lfm.id_artista_lfm
	GROUP BY csp.genre
    ORDER BY media_reproducciones DESC
    LIMIT 1 ;
    
/*  2.1. ==>> Artistas que pertenecen a cada género */

/*  Relaciones: 	canciones_spotify ## género ## => (id_artista_sp/id_artista) => artistas_spotify)## artista ## */

SELECT csp.genre AS genero, COUNT(DISTINCT a.artista) AS num_artistas
	FROM canciones_spotify AS csp
    INNER JOIN artistas_spotify AS a
		ON csp.id_artista_sp = a.id_artista
	GROUP BY genre;
        
/*  2.2. ==>> Qué género tiene más artistas */

SELECT csp.genre AS genero, COUNT(DISTINCT a.artista) AS num_artistas
	FROM canciones_spotify AS csp
    INNER JOIN artistas_spotify AS a
		ON csp.id_artista_sp = a.id_artista
	GROUP BY genre
    ORDER BY num_artistas DESC
    LIMIT 1;

/*  3. ==>> Número de artistas que tienen menos de 100.000 reproducciones */

SELECT COUNT(id_artista_lfm) AS num_artistas
	FROM info_artistas_lastfm  
	WHERE playcount < 100000;

/*  4. ==> Artista con más Listeners */

/*  Relaciones: 	info_artistas_lastfm # listeners # => (id_artista_lfm/id_artista) => artistas_spotify # artista # */

SELECT a.artista AS artista_con_mas_reproducciones
	FROM artistas_spotify AS a
    INNER JOIN info_artistas_lastfm AS lfm
		ON a.id_artista = lfm.id_artista_lfm
	ORDER BY lfm.listeners DESC
    -- LIMIT 1
    ;

/*  5.1. ==> Países y número de artistas. Ordenados de mayor a menor */

SELECT pais_origen AS pais, COUNT(id_artista_mb) AS num_artistas
	FROM info_artistas_musicbrainz
    GROUP BY pais_origen
    ORDER BY num_artistas DESC;
 
 /*  5.2. ==> El país con mayor número de artistas */ 

SELECT pais_origen AS pais, COUNT(id_artista_mb) AS num_artistas
	FROM info_artistas_musicbrainz
    GROUP BY pais_origen
    ORDER BY num_artistas DESC
    LIMIT 1;
    
/*  6. ==> Artista/grupo mas longevo y el número de canciones que tiene */

/*  Como tenemos fechas diferentes si es artista o grupo, podemos hacerlo por artista y por grupo */

/*  6.1. ==> Artista mas longevo y el número de canciones que tiene */
 
/*  Como tenemos fechas diferentes si es artista o grupo, podemos hacerlo por artista y por grupo */
 
/*  Relaciones:	info_artistas_musicbrainz ## longevidad ## => (id_artista_mb/id_artista) => artistas_spotify)## artista ##
				artistas_spotify => (id_artista/id_artista_sp) => canciones_spotify # num_canciones #	*/	
				
SELECT C.artista AS Artista,
       DATEDIFF(COALESCE(fin_actividad, CURRENT_DATE()), inicio_actividad) AS TiempoActivoDias,
       COUNT(B.id_artista_sp) AS NumeroCanciones
FROM info_artistas_musicbrainz as A
INNER JOIN canciones_spotify as B
	ON A.id_artista_mb = B.id_artista_sp
INNER JOIN artistas_spotify as C
	ON C.id_artista = B.id_artista_sp
GROUP BY Artista, TiempoActivoDias
ORDER BY TiempoActivoDias DESC
LIMIT 1; 
 
 
 
 
 
 
 
 
 



		