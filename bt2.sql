ALTER TABLE orders
ADD COLUMN total_amount DECIMAL(10,2) NOT NULL DEFAULT 0;
INSERT INTO orders (order_id, customer_id, order_date, status, total_amount) VALUES
(106, 2, '2025-01-10', 'completed',  560000),
(107, 2, '2025-01-12', 'completed', 1780000),
(108, 3, '2025-01-13', 'pending',    920000),
(109, 3, '2025-01-14', 'completed', 3050000),
(110, 4, '2025-01-15', 'completed',  450000),
(111, 4, '2025-01-16', 'cancelled', 1200000),
(112, 5, '2025-01-17', 'completed',  780000),
(113, 5, '2025-01-18', 'completed', 2220000),
(114, 1, '2025-01-19', 'completed',  980000),
(115, 1, '2025-01-20', 'completed', 4100000);

UPDATE orders SET total_amount = 1450000 WHERE order_id = 101;
UPDATE orders SET total_amount =  820000 WHERE order_id = 102;
UPDATE orders SET total_amount = 2100000 WHERE order_id = 103;
UPDATE orders SET total_amount =  350000 WHERE order_id = 104;
UPDATE orders SET total_amount = 1650000 WHERE order_id = 105;

SELECT c.customer_id, c.full_name, c.city, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.full_name, c.city
ORDER BY total_spent DESC;

SELECT c.customer_id, c.full_name, c.city, MAX(o.total_amount) AS max_order_amount
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.full_name, c.city
ORDER BY max_order_amount DESC;

SELECT c.customer_id, c.full_name, c.city, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.full_name, c.city
ORDER BY total_spent DESC;
