SHOW DATABASES;

USE tienda;

SHOW TABLES;

-- Esto es un comentario
-- Esta instrucción describe la estructura de una tabla
-- -------------------------------------------------------------- RETO 1 ---------------------------------------------------------------------
DESCRIBE puesto;
DESCRIBE articulo;
DESCRIBE venta;

SELECT nombre
FROM empleado;

------------------------------------------------------------------------------------------------------------

-- Operadores relacionales (= , < , > , <= , >= , !=, <>)
SELECT *
FROM empleado
WHERE apellido_paterno = 'Risom';

-- Operadores logicos (AND, OR)
-- AND (somos exigentes), OR (somos flexibles)
SELECT *
FROM empleado
WHERE id_puesto >=100
	AND id_puesto <=200;
    
SELECT *
FROM empleado
WHERE id_puesto >=100
	OR id_puesto <=200; 

-- IN(muchos OR resumido)
SELECT*
FROM empleado
WHERE id_puesto IN (100,110.200,20);

-- BETWEEN(establece un rango)
SELECT *
FROM empleado
WHERE id_puesto BETWEEN 100 AND 200;

-- --------------------------------RETO 2-----------------------------------------------------------------
SELECT id_puesto, nombre
FROM empleado
WHERE id_puesto=4;

SELECT id_puesto, salario
FROM puesto
WHERE salario > 10000;

SELECT id_articulo, nombre, iva
FROM articulo
WHERE precio > 1000 
	AND iva > 100;
    
SELECT *
FROM venta
WHERE id_articulo IN (135,963)
	AND id_empleado IN (835,369);
-- Es lo mismo 
SELECT *
FROM venta
WHERE (id_articulo = 135 OR id_articulo =963)
	AND (id_empleado = 835 OR id_empleado = 369);

-- ----------------------------------------------------------------------------------------------------------
    
-- ORDENAMIENTO (ORDER BY (por default es ASC))
SELECT *
FROM puesto
ORDER BY salario DESC;

-- Limitar numero de registros que trae una consulta (LIMIT)
SELECT salario
FROM puesto
ORDER BY salario
LIMIT 1;

-- ---------------------------RETO 3 ----------------------------------------------------------------------
SELECT *
FROM puesto
ORDER BY salario DESC
LIMIT 5;





 






