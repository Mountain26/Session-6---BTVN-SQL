CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  full_name VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  status ENUM('pending','completed','cancelled') NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, full_name, city) VALUES
(1, 'Nguyễn Văn A', 'Hà Nội'),
(2, 'Trần Thị B', 'Hải Phòng'),
(3, 'Lê Quốc C', 'Đà Nẵng'),
(4, 'Phạm Minh D', 'TP.HCM'),
(5, 'Vũ Thu E', 'Cần Thơ');

INSERT INTO orders (order_id, customer_id, order_date, status) VALUES
(101, 1, '2025-01-05', 'completed'),
(102, 1, '2025-01-07', 'pending'),
(103, 2, '2025-01-06', 'completed'),
(104, 3, '2025-01-08', 'cancelled'),
(105, 3, '2025-01-09', 'completed');

SELECT o.order_id, o.order_date, o.status, c.customer_id, c.full_name, c.city
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
ORDER BY o.order_date, o.order_id;

SELECT c.customer_id, c.full_name, c.city,
COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.full_name, c.city
ORDER BY total_orders DESC, c.customer_id;

SELECT c.customer_id, c.full_name, c.city, 
COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.full_name, c.city
HAVING COUNT(o.order_id) >= 1
ORDER BY total_orders DESC, c.customer_id;