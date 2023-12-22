-- How many unique customer orders were made?
select * from customer_orders;

SELECT 
	COUNT(DISTINCT order_id) as num_unique_customers
FROM customer_orders;