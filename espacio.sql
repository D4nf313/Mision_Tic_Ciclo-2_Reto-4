DROP DATABASE IF EXISTS Spacecraft;
CREATE DATABASE Spacecraft;

USE Spacecraft;


DROP TABLE  IF EXISTS nave;
CREATE TABLE nave (
n_matricula INT PRIMARY KEY,
n_nombre CHAR(50) ,
n_velocidad FLOAT ,
n_longitud FLOAT 
);

INSERT INTO nave VALUES (1, "Halcón Milenario",75,34.37);
INSERT INTO nave VALUES (2, "Ala-X",100,12.5);
INSERT INTO nave VALUES (3, "Ala-Y",80,14);
INSERT INTO nave VALUES (4, "Ala-A",120,9.6);
INSERT INTO nave VALUES (5, "Interceptor TIE",105,9.2);
INSERT INTO nave VALUES (6, "Esclavo 1",70, 21.1);
INSERT INTO nave VALUES (7, "Destructor Estelar",60, 1600);
INSERT INTO nave VALUES (8, "Estrella de la Muerte",10, 120000);
INSERT INTO nave VALUES (9, "Transbordador Imperial",50, 20);
INSERT INTO nave VALUES (10, "Ejecutor" ,40, 19000);

DROP TABLE  IF EXISTS individual;
CREATE TABLE individual (
i_matricula INT PRIMARY KEY,
i_color VARCHAR(30) ,
i_androide VARCHAR(30),

FOREIGN KEY (i_matricula) REFERENCES nave (n_matricula)
 
);
INSERT INTO individual VALUES (2,"BLANCO/ROJO","R2-D2");
INSERT INTO individual VALUES (3,"AMARILLO","C-3PO");
INSERT INTO individual VALUES (4,"ROJO",NULL);
INSERT INTO individual VALUES (5,"NEGRO",NULL);

DROP TABLE  IF EXISTS masivo;
CREATE TABLE masivo (
m_matricula INT PRIMARY KEY,
m_tripulantes INT ,
m_pasajeros INT,

FOREIGN KEY (m_matricula) REFERENCES nave (n_matricula) 
);
INSERT INTO  masivo VALUES ( 1 , 4 , 6 ) ;
INSERT INTO  masivo VALUES ( 6 , 1 , 6 ) ;
INSERT INTO  masivo VALUES ( 7 , 47060 , 0 ) ;
INSERT INTO  masivo VALUES ( 8 , 342953 , 843342 ) ;
INSERT INTO  masivo VALUES ( 9 , 6 , 20 ) ;
INSERT INTO  masivo VALUES ( 10 , 2791444 , 38000 ) ;


DROP TABLE  IF EXISTS chofer;
CREATE TABLE chofer (
c_licencia INT PRIMARY KEY,
c_nombre CHAR(40),
c_especie CHAR(30) ,
c_masivo  INT (10),
FOREIGN KEY (c_masivo) REFERENCES masivo (m_matricula)

);
INSERT INTO  chofer VALUES ( 1 , "Han Solo" ,"Humano", 1 ) ;
INSERT INTO  chofer VALUES ( 2 , "Jango Fett" , "Mandaloriano",6) ;
INSERT INTO  chofer VALUES ( 3 , "General Grievous", "Androide",7 ) ;
INSERT INTO  chofer VALUES ( 4 , 	"Grand Moff Tarkin" , "Humano",8 ) ;
INSERT INTO  chofer VALUES ( 5 , "Darth Vader", "Humano/Androide",9	 ) ;
INSERT INTO  chofer VALUES ( 6 , "Kendal Ozzel ", "Humano",10 ) ;


DROP TABLE  IF EXISTS viajero;
CREATE TABLE viajero(
v_identidad INT PRIMARY KEY,
v_nombre CHAR(40) ,
v_especie CHAR(30) ,
v_genero CHAR(30) 

);


INSERT INTO  viajero VALUES ( 1 , "Luke Skywalker" , "Humano ", "Masculino" ) ;
INSERT INTO  viajero VALUES ( 2 , "Leia Organa" , "Humano" , "Femenino ") ;
INSERT INTO  viajero VALUES ( 3 , "Rey Skywalker ", "Humano" , "Femenino ") ;
INSERT INTO  viajero VALUES ( 4 , "Obi-Wan Kenobi" , "Humano ", "Masculino" ) ;
INSERT INTO  viajero VALUES ( 5 , "Maz Kanata" , "Humanoide" , "Femenino" ) ;
INSERT INTO  viajero VALUES ( 6 , "Anakin Skywalker" , "Humano" , "Masculino" ) ;
INSERT INTO  viajero VALUES ( 7 , "Yoda"  , "Yoda"  , "Masculino" ) ;
INSERT INTO  viajero VALUES ( 8 , "Ahsoka Tano" , "Togruta" , "Femenino" ) ;
INSERT INTO  viajero VALUES ( 9 , "Grogu " , "Yoda" , "Masculino" ) ;
INSERT INTO  viajero VALUES ( 10 , "Aayla Secura" , "Twi'lek ", "Femenino" ) ;
INSERT INTO  viajero VALUES ( 11 , "Chewbacca" , "Wookiee"  ,"Masculino" ) ;
INSERT INTO  viajero VALUES ( 12 , "Wicket W. Warrick" , "Ewok" , "Masculino ") ;




DROP TABLE  IF EXISTS renta;
CREATE TABLE renta(
r_id INT PRIMARY KEY,
r_viajero INT,
r_nave INT ,
r_fecha DATETIME ,
r_temporada VARCHAR(50),
r_duracion INT ,
r_valor DOUBLE,

FOREIGN KEY (r_nave ) REFERENCES nave (n_matricula ),
FOREIGN KEY (r_viajero) REFERENCES viajero (v_identidad ) 

);


INSERT INTO  renta VALUES ( 7110 , 1 , 10 , " 1977-05-25 00:00:00 " , "Una nueva esperanza" , 7 , 36.51 ) ;
INSERT INTO  renta VALUES ( 7143 , 2 , 1 , " 2015-12-18 00:00:00 " , "El Despertar de la Fuerza" , 3 , 275.96 ) ;
INSERT INTO  renta VALUES ( 7176 , 3 , 10 , " 2019-12-20 00:00:00 " , "El Ascenso de Skywalker" , 17 , 346.37 ) ;
INSERT INTO  renta VALUES ( 7187 , 1 , 6 , " 1983-05-25 00:00:00 " , "El Retorno del JEDI" , 21 , 529.97 ) ;
INSERT INTO  renta VALUES ( 7209 , 4 , 6 , " 	2016-12-16 00:00:00 " , "Rogue One " , 4 , 391.29 ) ;
INSERT INTO  renta VALUES ( 7220 , 2 , 7 , " 1977-05-25 00:00:00 " , "Una nueva esperanza" , 21 , 523.38 ) ;
INSERT INTO  renta VALUES ( 7242 , 5 , 6 , "	2005-05-19 00:00:00 " , "La Venganza de los Sith" , 5 , 452.94 ) ;
INSERT INTO  renta VALUES ( 7253 , 3 , 3 , " 1999-05-19 00:00:00 " , "La Amenaza Fantasma" , 12 , 810.32 ) ;
INSERT INTO  renta VALUES ( 7264 , 1 , 9 , " 1977-05-25 00:00:08 " , "Una nueva esperanza" , 19 , 89.79 ) ;
INSERT INTO  renta VALUES ( 7275 , 6 , 1 , "	1980-05-21 00:00:00 " , "El Imperio contraataca" , 16 , 283.05 ) ;
INSERT INTO  renta VALUES ( 7286 , 4 , 4 , " 	2018-05-25 00:00:00 " , "Han Solo" , 3 , 162.69 ) ;
INSERT INTO  renta VALUES ( 7297 , 2 , 2 , " 2019-12-20 00:00:00 " , "El Ascenso de Skywalker" , 5 , 330.68 ) ;
INSERT INTO  renta VALUES ( 7308 , 7 , 3 , " 	1999-05-19 00:00:00 " , "La Amenaza Fantasma" , 22 , 289.85 ) ;
INSERT INTO  renta VALUES ( 7319 , 5 , 1 , " 	1983-05-25 00:00:00 " , "El Retorno del JEDI" , 8 , 382.42 ) ;
INSERT INTO  renta VALUES ( 7330 , 3 , 6 , " 	2016-12-16 00:00:00 " , "Rogue One" , 28 , 361.42 ) ;
INSERT INTO  renta VALUES ( 7341 , 8 , 3 , " 	2005-05-19 00:00:00 " , "La Venganza de los Sith" , 4 , 228.06 ) ;
INSERT INTO  renta VALUES ( 7352 , 6 , 10 , " 	2018-05-25 00:00:00 " , "Han Solo" , 21 , 1331.33 ) ;
INSERT INTO  renta VALUES ( 7663 , 4 , 10 , " 2005-05-19 00:00:00 " , "La Venganza de los Sith" , 29 , 894.32 ) ;
INSERT INTO  renta VALUES ( 7374 , 9 , 1 , "	2015-12-18 00:00:00 " , "El Despertar de la Fuerza" , 28 , 2199.39 ) ;
INSERT INTO  renta VALUES ( 7385 , 7 , 5 , " 2019-12-20 00:00:00 " , "El Ascenso de Skywalker" , 13 , 996.26 ) ;
INSERT INTO  renta VALUES ( 7396 , 5 , 2 , " 2019-12-20 00:00:00 " , "El Ascenso de Skywalker" , 9 , 650.64 ) ;
INSERT INTO  renta VALUES ( 7407 , 10 , 2 , " 	2002-05-16 00:00:00 " , "El Ataque de los Clones" , 8 , 279.83 ) ;
INSERT INTO  renta VALUES ( 7418 , 8 , 3 , " 2017-12-15 00:00:00 " , "Los Últimos JEDI" , 6 , 365.99 ) ;
INSERT INTO  renta VALUES ( 7429 , 6 , 6 , "	1977-05-25 00:00:00 " , "Una nueva esperanza" , 2 , 108.55 ) ;
INSERT INTO  renta VALUES ( 7451 , 9 , 2 , " 1999-05-19 00:00:00 " , "La Amenaza Fantasma" , 16 , 1402.67 ) ;
INSERT INTO  renta VALUES ( 7462 , 7 , 5 , " 	2016-12-16 00:00:00 " , "Rogue One" , 24 , 2328.07 ) ;
INSERT INTO  renta VALUES ( 7484 , 10 , 10 , " 1999-05-19 00:00:00 " , "La Amenaza Fantasma" , 21 , 1069.46 ) ;
INSERT INTO  renta VALUES ( 7495 , 8 , 3 , " 1977-05-25 00:00:00" , "Una nueva esperanza", 25 , 2475.1 ) ;
INSERT INTO  renta VALUES ( 7528 , 9 , 5 , "	2016-12-16 00:00:00 " , "Rogue One" , 3 , 192.25 ) ;
INSERT INTO  renta VALUES ( 7561 , 10 , 4 , " 	1983-05-25 00:00:00 " , "El Retorno del JEDI" , 9,333 ) ;








