CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(255) NOT NULL,
  price DECIMAL(10,2) NOT NULL
);

CREATE TABLE order_items (
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  PRIMARY KEY (order_id, product_id),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO orders (order_id, customer_id, order_date, status, total_amount) VALUES
(201, 1, '2025-02-01', 'completed', 3500000),
(202, 1, '2025-02-02', 'completed', 4200000),
(203, 1, '2025-02-03', 'completed', 3800000);

INSERT INTO products (product_id, product_name, price) VALUES
(1, 'Chuột Logitech G102', 350000),
(2, 'Bàn phím cơ Akko 3068', 1290000),
(3, 'Tai nghe Sony WH-CH520', 890000),
(4, 'Màn hình LG 24MP400', 2350000),
(5, 'SSD Kingston NV2 500GB', 990000);

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(101, 1, 2),
(101, 2, 1),
(102, 2, 2),
(103, 4, 1),
(104, 5, 3),
(105, 3, 2),
(106, 4, 2),
(107, 2, 3),
(108, 5, 4),
(109, 4, 2);

SELECT p.product_id, p.product_name, SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sold DESC;

SELECT p.product_id, p.product_name, SUM(oi.quantity * p.price) AS revenue
FROM products p
JOIN order_items oi ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY revenue DESC;

SELECT p.product_id, p.product_name, SUM(oi.quantity * p.price) AS revenue
FROM products p
JOIN order_items oi ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
HAVING SUM(oi.quantity * p.price) > 5000000
ORDER BY revenue DESC;






