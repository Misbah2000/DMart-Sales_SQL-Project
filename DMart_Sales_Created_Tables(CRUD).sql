drop database if exists DMart;
create database if not exists DMart;

CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_id VARCHAR(50),
    customer_id INT,
    product_id INT,
    quantity INT,
    total_amount DECIMAL(15,2),
    sale_date DATE,
     FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
     FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    city VARCHAR(100),
    state VARCHAR(100)
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE invoices (
    invoice_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    invoice_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE invoice_items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_id INT,
    product_id INT,
    quantity INT,
    total_amount DECIMAL(15,2),
    FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_id INT,
    payment_mode VARCHAR(50),   -- Cash, UPI, Card
    payment_status VARCHAR(50), -- Paid, Pending, Failed
    FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id)
);

-- CRUD 
-- 1 Create/Insert
-- add  a sales
INSERT INTO sales (invoice_id, customer_id, product_id, quantity, total_amount, sale_date)
VALUES ('INV1001', 1, 1, 3, 255.00, '2024-07-15');

-- Add a customer
INSERT INTO customers (customer_name, city, state)
VALUES ('Amit Sharma', 'Mumbai', 'Maharashtra');

-- Add a product
INSERT INTO products (product_name, category, price)
VALUES ('Shampoo 500ml', 'Personal Care', 250.00);

-- Create invoice
INSERT INTO invoices (customer_id, invoice_date)
VALUES (1, '2024-08-20');

-- Add items to invoice
INSERT INTO invoice_items (invoice_id, product_id, quantity, total_amount)
VALUES (1, 1, 2, 500.00);

-- Add payment
INSERT INTO payments (invoice_id, payment_mode, payment_status)
VALUES (1, 'UPI', 'Paid');

-- Read/Select
SELECT * FROM sales;
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM invoices;
SELECT * FROM invoice_items;
SELECT * FROM payments;

SELECT customer_name, city, state
FROM customers
WHERE city = 'Mumbai';

SELECT product_name, price
FROM products
WHERE category = 'Personal Care';

-- Update
-- Update product price
UPDATE products
SET price = 90.00
WHERE product_id = 1;

-- Update customer city
UPDATE customers
SET city = 'Pune'
WHERE customer_id = 1;

UPDATE payments
SET payment_status = 'Paid'
WHERE payment_id = 301;

UPDATE invoices
SET invoice_date = '2025-08-21'
WHERE invoice_id = 401;


-- Delete
-- Delete a customer (only if no sales linked)
DELETE FROM customers
 WHERE customer_id = 2;

DELETE FROM sales
WHERE product_id = 3 AND sale_id = 101;




