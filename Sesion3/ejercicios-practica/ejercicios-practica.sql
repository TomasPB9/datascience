-- ---------------------------------EJERCICIOS PRACTICA -----------------------------------------------------
USE classicmodels;
-- ----------- CONSULTAS CON INNER JOIN ---------------------------------------------------------------
-- Ejercicio 1
SELECT SUM(quantityOrdered) AS Total, o.orderNumber
FROM orders o
JOIN orderdetails od
	ON o.orderNumber = od.orderNumber
GROUP BY o.orderNumber;

-- Ejercicio 2
SELECT o.orderNumber, o.status, SUM(quantityOrdered*priceEach) AS Total
FROM orders o
JOIN orderdetails od
	ON o.orderNumber = o.orderNumber
GROUP BY o.orderNumber, o.status;

-- Ejercicio 3
SELECT o.orderNumber, o.requiredDate, od.orderLineNumber, p.productName, od.quantityOrdered, od.priceEach
FROM orders o 
JOIN orderdetails od
	ON o.orderNumber = od.orderNumber
JOIN products p
	ON od.productCode = p.productCode;
    
-- Ejercicio 4
SELECT od.orderNumber, p.productName, p.MSRP, priceEach
FROM orderdetails od
JOIN products p
	ON od.productCode = p.productCode;

-- Ejercicio 5
SELECT c.customerNumber, customerName, orderNumber, status
FROM customers c
LEFT JOIN orders o
	ON c.customerNumber = o.customerNumber;

-- Ejercicio 6
SELECT c.customerNumber, c.customerName
FROM customers c
LEFT JOIN orders o
	ON c.customerNumber = o.customerNumber
WHERE orderNumber IS NULL;

-- Ejercicio 7
SELECT lastName, firstName, customerName, checkNumber, amount
FROM employees e
LEFT JOIN customers c
	ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN payments p 
	ON c.customerNumber = p.customerNumber
ORDER BY customerName, checkNumber;

--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------

-- Ejercicio 8.1
SELECT c.customerNumber, customerName, orderNumber, status
FROM customers c
RIGHT JOIN orders o
	ON c.customerNumber = o.customerNumber;

-- Ejercicio 8.2
SELECT c.customerNumber, c.customerName
FROM customers c
RIGHT JOIN orders o
	ON c.customerNumber = o.customerNumber
WHERE orderNumber IS NULL;

-- Ejercicio 8.3
SELECT lastName, firstName, customerName, checkNumber, amount
FROM employees e
RIGHT JOIN customers c
	ON e.employeeNumber = c.salesRepEmployeeNumber
RIGHT JOIN payments p 
	ON c.customerNumber = p.customerNumber
ORDER BY customerName, checkNumber;

-- No representa lo mismo una consulta con LEFT JOIN y RIGHT JOIN, la diferencia es que solo trae los registros 
-- que correspondan a su tabla (left or right) y cumplan la condicion de relacion de la otra tabla

-- Ejercicio 9

CREATE VIEW ejerciciotres795 AS
(SELECT c.customerNumber, customerName, orderNumber, status
FROM customers c
LEFT JOIN orders o
	ON c.customerNumber = o.customerNumber);
SELECT *
FROM ejerciciotres795
ORDER BY status
LIMIT 10;
    
CREATE VIEW ejercicio1795 AS
(SELECT SUM(quantityOrdered) AS Total, o.orderNumber
FROM orders o
JOIN orderdetails od
	ON o.orderNumber = od.orderNumber
GROUP BY o.orderNumber);
SELECT Total
FROM ejercicio1795
WHERE Total > 1500;

CREATE VIEW ejercicioocho795 AS
(SELECT lastName, firstName, customerName, checkNumber, amount
FROM employees e
RIGHT JOIN customers c
	ON e.employeeNumber = c.salesRepEmployeeNumber
RIGHT JOIN payments p 
	ON c.customerNumber = p.customerNumber
ORDER BY customerName, checkNumber);
SELECT SUM(amount)
FROM ejercicioocho795
WHERE SUM(amount) > 250
ORDER BY SUM(amount) DESC;

