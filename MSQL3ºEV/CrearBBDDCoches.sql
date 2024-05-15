-- *Crea un script de sql y dentro introduce:*

-- 1. Crea un BBDD llamada concesionario
CREATE DATABASE concesionario;

-- 2. Crea una tabla llamada coches con:
  -- matricula tipo texto (11) que no sea nulo y que sea PK
  -- Marca tipo texto (50) con valor por defecto 'Seat'
  -- Modelo tipo texto (100) con valor por defecto NULL
 CREATE TABLE coches (
    matricula VARCHAR(11) NOT NULL,
    Marca VARCHAR(50) DEFAULT 'Seat',
    Modelo VARCHAR(100) DEFAULT NULL,
    PRIMARY KEY (matricula)); 
    
-- 3. Introduce 3 coches introduciendo datos en todas las columnas (con 3 sentencias)
INSERT INTO coches (matricula, Marca, Modelo) VALUES
('123ABC', 'Seat', 'Ibiza');
INSERT INTO coches (matricula, Marca, Modelo) VALUES
('456DEF', 'Renault', 'Clio');
INSERT INTO coches (matricula, Marca, Modelo) VALUES
('789GHI', 'Ford', 'Focus');

-- 4. Introduce 2 coches introduciendo datos en todas las columnas (con una sola sentencia)
INSERT INTO coches (matricula, Marca, Modelo) VALUES
('987ZYX', 'Volkswagen', 'Golf'), ('654WVU', 'BMW', 'Series 3');

-- 5. Introduce 2 coches introduciendo datos con algunos valores DEFAULT
INSERT INTO coches (matricula, marca) VALUES ('222ZZZ', DEFAULT), ('333WWW', DEFAULT);

-- 6. Introduce 2 coches dejando algunas de las columnas sin definir/usar (con dos sentencias)
INSERT INTO coches (matricula) VALUES ('111ZZZ'), ('555WWW');

-- 7. Introduce 2 coches dejando algunas de las columnas sin definir/usar (con una sola sentencia)
INSERT INTO coches (matricula, Marca) VALUES ('444XXX', 'Toyota'), ('555YYY', 'Yaris');

-- 8. Crea una tabla idéntica a "coches" y llámala "coches_copia"
CREATE TABLE coches_copia AS
SELECT * FROM coches LIMIT 0;

-- 9. Introduce en la tabla anterior 5 coches de la tabla "coches". Utiliza, para ello, 
   -- una SELECT con todos los coches ordenados por matrícula y solo introduce 5.
INSERT INTO coches_copia
SELECT * FROM coches LIMIT 5;
   
-- 10. Crea una tabla llamada "copias_copia_auto" con una sentencia CREATE TABLE AS SELECT 
   -- cuya tabla origen sea "coches". Introduce solo los coches de una determinada marca.
CREATE TABLE coches_copia_auto AS
SELECT * FROM coches WHERE Marca like 'seat';



























