-- --------------- EJERCICIOS PARA PRACTICAR --------------------

-- EJERCICIO 1
USE classicmodels;

-- EJERCICIO 2
SELECT lastName
FROM employees;

-- EJERCICIO 3
SELECT lastName, firstName, jobTitle
FROM employees;

-- EJERCICIO 4
SELECT *
FROM employees;

-- EJERCICIO 5
SELECT lastName, firstName, jobTitle
FROM employees
WHERE jobTitle  = 'Sales Rep';

-- EJERCICIO 6
SELECT lastName, firstName, jobTitle, officeCode 
FROM employees
WHERE jobTitle = 'Sales Rep'
	AND officeCode = 1;
    
-- EJERCICIO 7
SELECT lastName, firstName, jobTitle, officeCode
FROM employees
WHERE jobTitle = 'Sales Rep'
	OR officeCode = 1;
    
-- EJERCICIO 8
SELECT lastName, firstName, officeCode 
FROM employees
WHERE officeCode IN (1, 2, 3);

-- EJERCICIO 9
SELECT lastName, firstName, jobTitle
FROM employees
WHERE jobTitle != 'Sales Rep';

-- EJERCICIO 10
SELECT lastName, firstName, officeCode
FROM employees
WHERE officeCode > 5;

-- EJERCICIO 11
SELECT lastName, firstName, officeCode
FROM employees
WHERE officeCode < 4;

-- EJERCICIO 12
SELECT customerName, country, state
FROM customers
WHERE country = 'USA' 
	AND state = 'CA';
    
-- EJERCICIO 13
SELECT customerName, country, state, creditLimit
FROM customers
WHERE country = 'USA' 
	AND state = 'CA'
    AND creditLimit > 100000;
    
-- EJERCICIO 14
SELECT customerName, country 
FROM customers
WHERE country IN ('USA', 'FRANCE');

-- EJERCICIO 15
SELECT customerName, country, creditLimit
FROM customers
WHERE country IN ('USA', 'France')
	AND creditLimit > 100000;

-- EJERCICIO 16
SELECT officeCode, city, phone, country
FROM offices
WHERE country IN ('USA', 'France');

-- EJERCICIO 17
SELECT officeCode, city, phone, country
FROM offices
WHERE country NOT IN ('USA', 'France');

-- EJERCICIO 18
SELECT 	orderNumber, customerNumber, status, shippedDate
FROM orders
WHERE orderNumber IN (10165, 10287, 10310);

-- EJERCICIO 19
SELECT contactLastName, customerName
FROM customers
ORDER BY contactLastName;

-- EJERCICIO 20
SELECT contactLastName, customerName
FROM customers
ORDER BY contactLastName DESC;

-- EJERCICIO 21
SELECT contactLastName, customerName
FROM customers
ORDER BY contactLastName DESC,
	customerName;

-- EJERCICIO 22
SELECT contactLastName, customerName, creditLimit
FROM customers
ORDER BY creditLimit DESC
LIMIT 5;
 
-- EJERCICIO 23
SELECT customerNumber, customerName, creditLimit
FROM customers
WHERE creditLimit > 0
ORDER BY creditLimit 
LIMIT 5;









