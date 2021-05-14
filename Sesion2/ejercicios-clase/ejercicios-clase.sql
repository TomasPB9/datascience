-- --------------------------------SESION 2 ----------------------------------------------------------------- 
-- -------------------------------EJEMPLO 1 -----------------------------------------------------------------
USE tienda;

SELECT *
FROM empleado
WHERE nombre LIKE 'M%';

SELECT *
FROM empleado
WHERE nombre LIKE '%a';

--  todos los empleados cuyo nombre empieza con M y termina con a (no importa si son mayuscula o minuscula)
SELECT *
FROM empleado
WHERE nombre LIKE 'M%a';

-- traer los empleados que tienen la estructura M_losa
SELECT *
FROM empleado
WHERE nombre LIKE 'M_losa';

-- regresa los empleados que su nombre tenga 5 caracteres (por los 5 guiones bajos que pusimos)
SELECT *
FROM empleado
WHERE nombre LIKE '_____';


-- -------------------------------RETO 1 ----------------------------------------------------------------
SELECT * 
FROM articulo
WHERE nombre LIKE '%pasta%';

SELECT *
FROM articulo
WHERE nombre LIKE '%cannelloni%';

SELECT nombre
FROM articulo
WHERE nombre LIKE '%-%';

-- ---------------------------------------------------------------------------------------------------------
-- ------------------------------------------EJEMPLO 2 -----------------------------------------------------

-- SELECT se puede usar como calculadora
SELECT (1 + 7) * (10 / (6 - 4));

-- DISTINCT => Quita repetidos a la tabla y depues hace el conteo
SELECT DISTINCT precio
FROM articulo;

-- TODOS LOS RESULTADOS QUE DEVUELVEN SIEMPRE SON TABLAS
-- AS => sirve para dar alias a columnas creadas por nosotros 
SELECT avg(precio) AS Promedio, count(precio) AS Total, MAX(precio) AS Maximo, MIN(precio) AS Minimo
FROM articulo;

-- COUNT => Ignora los registros con valores null

-- ---------------------------------------RETO 2 -----------------------------------------------------------
SELECT concat("$", round(AVG(salario),2)) AS SalarioPromedio
FROM puesto;

SELECT COUNT(id_articulo) AS NombresConPasta
FROM articulo
WHERE nombre LIKE '%pasta%';

SELECT MAX(salario) AS SalarioMaximo, MIN(salario)  AS SalarioMinimo
FROM puesto;

SELECT SUM(salario)
FROM  puesto
ORDER BY id_pues DESC
LIMIT 5;
-- ---------------------------------------------------------------------------------------------------------
-- --------------------------------------- EJEMPLO 3 ------------------------------------------------------

-- Agrupamiento , debe de ir antes de las funciones de agrupamiento (en este ejemplo nombre)
SELECT nombre, sum(precio) AS total
FROM articulo
GROUP BY nombre;

SELECT nombre, count(*) AS cantidad
FROM articulo
GROUP BY nombre
ORDER BY cantidad DESC;

SELECT nombre, min(salario) AS menor, max(salario) AS mayor
FROM puesto
GROUP BY nombre;

-- 
SELECT  nombre, apellido_paterno, sum(id_puesto)
FROM empleado
GROUP BY nombre, apellido_paterno;

-- ----------------------------------------------------------------------------------------------------------
-- -------------------------------------RETO 3 ---------------------------------------------------------------
SELECT nombre, COUNT(*)
FROM puesto
GROUP BY nombre;

SELECT nombre, SUM(salario)
FROM puesto
GROUP BY nombre;

-- Número total de ventas por vendedor
SELECT id_empleado, COUNT(clave) AS Ventas
FROM venta
GROUP BY id_empleado;

-- Número total de ventas por artículos
SELECT id_articulo, COUNT(*)
FROM venta
GROUP BY id_articulo;

----------------------------------------------------------------------------------------------------------
-- -----------------------------------EJEMPLO 4 -----------------------------------------------------------

-- para filtrar a partir de otra consulta
-- filtramos aquellos empleados cuyo id_puesto esté en los resultados de la misma.
-- usandola desde WHERE
SELECT *
FROM empleado
WHERE id_puesto IN 
   (SELECT id_puesto
   FROM puesto
   WHERE nombre = 'Junior Executive');

-- construyes tabla y la consumes del SELECT (consultar lo que trajo otra consulta)
-- usandola desde FROM
SELECT id_articulo, min(cantidad), max(cantidad)
FROM 
   (SELECT clave, id_articulo, count(*) AS cantidad
   FROM venta
   GROUP BY clave, id_articulo
   ORDER BY clave) AS subconsulta
GROUP BY id_articulo;

-- pegar un valor a la tabla 
-- usandola desde SELECT
SELECT nombre, apellido_paterno, (SELECT salario FROM puesto WHERE id_puesto = e.id_puesto) AS sueldo
FROM empleado AS e;

-- ---------------------------------------------------------------------------------------------------------
-- ------------------------------------RETO 4 --------------------------------------------------------------
-- Nombre de los empleados cuyo sueldo es menor a 10000
SELECT nombre
FROM empleado
WHERE id_puesto IN
	(SELECT id_puesto
    FROM puesto
    WHERE salario > 10000 );
    
-- Cantidad minima y maxima de ventas de cada empleado
SELECT id_empleado, MIN(TotalVentas), MAX(TotalVentas)
FROM 
	(SELECT clave, id_empleado, COUNT(*)  AS TotalVentas
    FROM venta
    GROUP BY clave, id_empleado) AS sq
GROUP BY id_empleado;

-- Nombre del puesto de cada empleado
SELECT nombre, apellido_paterno, (SELECT nombre FROM puesto WHERE id_puesto = e.id_puesto)
FROM empleado AS e;