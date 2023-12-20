/* --------------------
   Case Study Questions
   --------------------*/

-- Example Query:
SELECT
  	product_id,
    product_name,
    price
FROM dannys_diner.menu
ORDER BY price DESC
LIMIT 5;

-- 1. What is the total amount each customer spent at the restaurant?
SELECT 
	s.customer_id,
	SUM(price) as 'Total Spent'
FROM sales s
INNER JOIN menu m 
	ON s.product_id = m.product_id
GROUP BY s.customer_id;

-- 2. How many days has each customer visited the restaurant?
SELECT 
	customer_id,
    COUNT(DISTINCT order_date)
FROM sales
GROUP BY customer_id;
    
-- 3. What was the first item from the menu purchased by each customer?
WITH cte AS (
	SELECT 
		*,
		dense_rank() OVER(PARTITION BY customer_id ORDER BY order_date) as first_item_ordered
	FROM 
		sales
)

SELECT 
	customer_id,
    m.product_name
FROM cte 
INNER JOIN menu m
	ON cte.product_id = m.product_id
WHERE first_item_ordered = 1
GROUP BY customer_id, product_name;
 
-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?
SELECT 
	m.product_name, 
    COUNT(s.product_id) as times_ordered
FROM sales s
INNER JOIN menu m
	ON s.product_id = m.product_id
GROUP BY m.product_name
ORDER BY times_ordered DESC
LIMIT 1;

-- 5. Which item was the most popular for each customer?
WITH cte AS (
	SELECT
		customer_id,
		product_id,
		COUNT(product_id) AS times_ordered,
		DENSE_RANK() OVER(
			PARTITION BY customer_id
			ORDER BY COUNT(customer_id) DESC
		) AS most_popular
	FROM sales
	GROUP BY customer_id, product_id
)

SELECT
	c.customer_id,
    m.product_name
FROM cte c
INNER JOIN menu m
	ON c.product_id = m.product_id
WHERE c.most_popular = 1
ORDER BY customer_id;


