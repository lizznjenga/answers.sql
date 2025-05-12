CREATE TABLE customers (
    customerNumber INT PRIMARY KEY,
    customerName VARCHAR(50),
    country VARCHAR(50),
    creditLimit DECIMAL(10, 2)
);

CREATE TABLE payments (
    paymentID INT AUTO_INCREMENT PRIMARY KEY,
    customerNumber INT,
    checkNumber VARCHAR(25),
    paymentDate DATE,
    amount DECIMAL(10, 2)
);

CREATE TABLE orderdetails (
    orderNumber INT,
    productCode VARCHAR(15),
    quantityOrdered INT,
    priceEach DECIMAL(10, 2)
);

INSERT INTO customers VALUES
(101, 'Alice Corp', 'USA', 50000),
(102, 'Beta Ltd', 'Canada', 60000),
(103, 'Gamma LLC', 'USA', 55000);

INSERT INTO payments (customerNumber, checkNumber, paymentDate, amount) VALUES
(101, 'CHK001', '2023-11-01', 1200.00),
(101, 'CHK002', '2023-11-02', 1500.00),
(102, 'CHK003', '2023-11-01', 1800.00),
(103, 'CHK004', '2023-11-03', 1600.00),
(101, 'CHK001', '2023-11-01', 800.00);

INSERT INTO orderdetails VALUES
(1, 'S10_1678', 30, 100.00),
(2, 'S10_1949', 50, 200.00),
(1, 'S10_1678', 10, 100.00),
(3, 'S12_1108', 20, 300.00);

SELECT customerName FROM customers;



SELECT 
    customerName, 
    country, 
    AVG(creditLimit) AS average_credit_limit
FROM 
    customers
GROUP BY 
    customerName, country;

SELECT 
    productCode, 
    quantityOrdered, 
    quantityOrdered * priceEach AS total_price
FROM 
    orderdetails
GROUP BY 
    productCode, quantityOrdered, priceEach;
    
SELECT 
    checkNumber, 
    MAX(amount) AS highest_payment
FROM 
    payments
GROUP BY 
    checkNumber;
