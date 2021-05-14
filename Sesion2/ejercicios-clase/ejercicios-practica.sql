-- ---------------------EJERCICIOS PARA PRACTICAR---------------------------------------------------------

USE classicmodels;

-- EJERCICIO 1
SELECT employeeNumber, lastName, firstName 
FROM employees
WHERE firstName LIKE 'A%';

-- EJERCICIO 2
SELECT employeeNumber, lastName, firstName 
FROM employees
WHERE lastName LIKE '%on';

-- EJERCICIO 3
SELECT employeeNumber, lastName, firstName 
FROM employees
WHERE firstName LIKE '%on%';

-- EJERCICIO 4
SELECT employeeNumber, lastName, firstName 
FROM employees
WHERE firstName LIKE 'G_____';

-- EJERCICIO 5
SELECT employeeNumber, lastName, firstName 
FROM employees
WHERE firstName NOT LIKE 'B%';

-- EJERCICIO 6
SELECT productCode, productName
FROM products
WHERE productCode LIKE '%_20%';

-- EJERCICIO 7
SELECT orderNumber, SUM(priceEach) AS Total
FROM orderdetails
GROUP BY orderNumber;

-- EJERCICIO 8
SELECT YEAR(orderDate) AS Anio, COUNT(*)
FROM orders
GROUP BY Anio;

-- EJERCICIO 9
SELECT lastName, firstName
FROM employees
WHERE officeCode IN
	(SELECT officeCode
    FROM offices
    WHERE country = 'USA');
    
-- EJERCICIO 10
SELECT customerNumber, checkNumber, amount
FROM payments
WHERE amount = (SELECT MAX(amount) FROM payments);

-- EJERCICIO 11
SELECT customerNumber, checkNumber, amount
FROM payments
WHERE amount > (SELECT AVG(amount) FROM payments);

-- EJERCICIO 12
SELECT customerName
FROM customers
WHERE customerNumber NOT IN 
			(SELECT customerNumber
            FROM orders);

-- EJERCICIO 13
SELECT MAX(quantityOrdered), MIN(quantityOrdered), AVG(quantityOrdered)
FROM orderdetails;

-- EJERCICIO 14
SELECT status, count(*) AS OrdenesPorStatus
FROM orders
GROUP BY status;


