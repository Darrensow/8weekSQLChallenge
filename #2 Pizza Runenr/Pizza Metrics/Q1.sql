-- 1. How many pizzas were ordered?

SELECT * from customer_orders;
SELECT
	COUNT(pizza_id) AS total_pizzas_ordered
FROM customer_orders;