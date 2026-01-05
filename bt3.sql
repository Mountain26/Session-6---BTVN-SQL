INSERT INTO orders (order_id, customer_id, order_date, status, total_amount) VALUES
(116, 2, '2025-01-20', 'completed', 3500000),
(117, 3, '2025-01-20', 'completed', 2800000);

SELECT o.order_date, COUNT(o.order_id) AS total_orders, SUM(o.total_amount) AS total_revenue
FROM orders o
WHERE o.status = 'completed'
GROUP BY o.order_date
HAVING SUM(o.total_amount) > 10000000
ORDER BY o.order_date;
