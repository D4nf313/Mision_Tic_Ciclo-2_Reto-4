SELECT 'Consulta 1';

SELECT *  FROM chofer ORDER BY c_nombre  ASC;

SELECT *  FROM renta;
SELECT 'Consulta 2';

SELECT v.v_nombre,v.v_especie,  v.v_genero,p.r_fecha,p.r_valor,c.c_nombre FROM viajero v 
INNER JOIN renta p ON v.v_identidad = p.r_viajero INNER JOIN chofer  c ON  v.v_identidad= c.c_licencia 
WHERE  c.c_nombre= "General Grievous";

SELECT 'Consulta 3';
SELECT n.n_nombre, n.n_velocidad, MAX(n.n_longitud) AS "Longitud mayor"  FROM renta r 
INNER JOIN nave n ON r.r_nave=n.n_matricula WHERE r.r_temporada  = "El Retorno del JEDI";

SELECT 'Consulta 4';
SELECT r.r_nave,c.c_nombre as "Nombre chofer" ,COUNT( r.r_nave) as "Cantidad servicios", AVG(r.r_valor) AS "Promedio renta" 
FROM renta r  INNER JOIN chofer c ON r.r_nave = c.c_masivo 
GROUP BY c.c_nombre HAVING COUNT(r.r_nave)>2;

SELECT r_nave FROM renta ORDER BY r_nave ASC;

SELECT 'Consulta 5';
SELECT r_temporada, COUNT(*) AS "Cantidad de servicios" , SUM(r_valor) as "Total valor", SUM(r_duracion) AS "Total duracion" 
FROM renta GROUP BY  r_temporada ORDER BY SUM(r_duracion) DESC;

SELECT 'Consulta 6';
SELECT v.v_nombre AS "Nombre viajero",  SUM(r.r_duracion) AS "Total duracion rentas"  FROM renta r INNER JOIN viajero v ON r.r_viajero=v.v_identidad 
GROUP BY v.v_nombre ORDER BY SUM(r.r_duracion) DESC;

