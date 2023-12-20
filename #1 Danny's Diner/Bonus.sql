DROP TABLE bonus_sales;
CREATE TABLE bonus_sales (
	  customer_id VARCHAR(1),
	  order_date DATE,
	  product_name VARCHAR(64),
      price INTEGER,
      member VARCHAR(1)
);

INSERT INTO bonus_sales
	(customer_id, order_date, product_name, price, member)
VALUES
  ('A', '2021-01-01', 'curry', 15, 'N'),
  ('A', '2021-01-01', 'sushi', 10, 'N'),
  ('A', '2021-01-07', 'curry', 15, 'Y'),
  ('A', '2021-01-10', 'ramen', 12, 'Y'),
  ('A', '2021-01-11', 'ramen', 12, 'Y'),
  ('A', '2021-01-11', 'ramen', 12, 'Y'),
  ('B', '2021-01-01', 'curry', 15, 'N'),
  ('B', '2021-01-02', 'curry', 15, 'N'),
  ('B', '2021-01-04', 'sushi', 10, 'N'),
  ('B', '2021-01-11', 'sushi', 10, 'Y'),
  ('B', '2021-01-16', 'ramen', 12, 'Y'),
  ('B', '2021-02-01', 'ramen', 12, 'Y'),
  ('C', '2021-01-01', 'ramen', 12, 'N'),
  ('C', '2021-01-01', 'ramen', 12, 'N'),
  ('C', '2021-01-07', 'ramen', 12, 'N');
  
select * from bonus_sales;


SELECT 
	*,
    CASE
		WHEN member = 'N' THEN NULL
        ELSE 
			DENSE_RANK() OVER(
				PARTITION BY customer_id, member
				ORDER BY order_date
			)
		END AS ranking
FROM bonus_sales
