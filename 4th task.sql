Create database Orders;
Use Orders;
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    product VARCHAR(50) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL
);


INSERT INTO Orders (order_id, customer_id, product, quantity, price) VALUES
(1, 101, 'Laptop', 2, 50000),
(2, 102, 'Phone', 1, 20000),
(3, 101, 'Tablet', 3, 15000),
(4, 103, 'Laptop', 1, 50000),
(5, 102, 'Phone', 2, 20000);



-- a) Total sales
SELECT SUM(price * quantity) AS total_sales
FROM Orders;

-- b) Number of orders
SELECT COUNT(order_id) AS total_orders
FROM Orders;

-- c) Average order value
SELECT AVG(price * quantity) AS avg_order_value
FROM Orders;

-- 4. Grouping Queries

-- a) Total sales per customer
SELECT customer_id, SUM(price * quantity) AS total_spent
FROM Orders
GROUP BY customer_id;

-- b) Orders per product
SELECT product, COUNT(*) AS orders_count
FROM Orders
GROUP BY product;

-- 5. Group Filtering (HAVING)

-- Customers who spent more than ₹60,000
SELECT customer_id, SUM(price * quantity) AS total_spent
FROM Orders
GROUP BY customer_id
HAVING total_spent > 60000;

-- 6. Combined Example
-- Average quantity and total sales per product with sales above ₹50,000
SELECT product,
       AVG(quantity) AS avg_qty,
       SUM(price * quantity) AS total_sales
FROM Orders
GROUP BY product
HAVING total_sales > 50000;