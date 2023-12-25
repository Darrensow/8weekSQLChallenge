-- How many pizzas were delivered that had both exclusions and extras?

SELECT 
	COUNT(c.exclusions AND c.extras) AS exclusion_and_extra
FROM customer_orders c 
INNER JOIN runner_orders r
	USING (order_id)
WHERE cancellation IS NULL;