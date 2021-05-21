USE tienda;

SHOW KEYS FROM venta;
DESCRIBE venta;

SHOW KEYS FROM empleado;
SELECT * 
FROM empleado;

-- Ejemplo INNER JOIN
SELECT *
FROM empleado AS e
JOIN puesto AS p
	ON  e.id_puesto = p.id_puesto;
    
-- Ejemplo LEFT JOIN
SELECT *
FROM puesto AS p
LEFT JOIN empleado AS e
	ON  p.id_puesto = e.id_puesto;
    
-- Ejemplo RIGHT JOIN
SELECT *
FROM empleado AS e
RIGHT JOIN puesto AS p
	ON  e.id_puesto = p.id_puesto;
    
-- --------------------------------------------------------------------------------------------------------
-- ------------------------------------RETO 1 -------------------------------------------------------------
SELECT clave, nombre, apellido_paterno
FROM venta AS v
JOIN empleado AS e
	ON v.id_empleado = e.id_empleado
ORDER BY clave;
    
SELECT clave, nombre
FROM venta as v
JOIN articulo AS a
	ON v.id_articulo = a.id_articulo
ORDER BY clave;

-- clave => es identificador del ticket
SELECT clave, round(sum((precio+iva)*cantidad),2) Total
FROM venta AS v
JOIN articulo AS a
	ON v.id_articulo = a.id_articulo
GROUP BY clave
ORDER BY clave;

-- ---------------------------------------------------------------------------------------------------------
-- --------------------------------Ejemplos VISTAS ---------------------------------------------------------
CREATE VIEW tickets_795 AS
(SELECT v.clave, v.fecha, a.nombre AS Producto. a.precio, concat(e.nombre, ' ', e.apellido_paterno) AS empleado
FROM venta v
JOIN empleado e
	ON v.id_empleado = e.id_empleado
JOIN articulo a
	ON v.id_articulo = a.id_articulo);

-- ------------------------------------------------------------------------------------------------------
-- -------------------------------RETO 2 -----------------------------------------------------------
CREATE VIEW puestos_795 AS
SELECT CONCAT(e.nombre, ' ', e.apellido_paterno), p.nombre
FROM empleado e
JOIN puesto p
	ON e.id_puesto = p.id_puesto;

SELECT *
FROM puestos_795;

CREATE VIEW empleado_articulo_795 AS
SELECT v.clave, concat(e.nombre, ' ', e.apellido_paterno) AS Nombre, a.nombre AS Articulo
FROM venta v
JOIN empleado e
	ON v.id_empleado = e.id_empleado
JOIN articulo a 
	ON v.id_articulo = a.id_articulo
ORDER BY v.clave;

SELECT * 
FROM empleado_articulo_795;

CREATE VIEW puesto_ventas_795 AS
SELECT p.nombre, COUNT(v.clave) AS Total
FROM venta v
JOIN empleado e
	ON v.id_empleado = e.id_empleado
JOIN puesto p
	ON e.id_puesto = p.id_puesto
GROUP BY p.nombre;

SELECT *
FROM puesto_ventas_795
ORDER BY total DESC
LIMIT 5;
    
    
         