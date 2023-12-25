-- For each customer, how many delivered pizzas had at least 1 change and how many had no changes?

select * from customer_orders;

-- view all orders that were not cancelled
SELECT 
	*
FROM customer_orders c
INNER JOIN runner_orders r
	USING (order_id)
WHERE 
	r.cancellation IS NULL
ORDER BY c.customer_id;

-- testing my logic on COUNT() function operating on cols with null values
SELECT COUNT(cte.exclusions OR extras) FROM 
(SELECT 
	*
FROM customer_orders c
INNER JOIN runner_orders r
	USING (order_id)
WHERE 
	r.cancellation IS NULL
ORDER BY c.customer_id) as cte;

SELECT COUNT(*) AS counts FROM 
(SELECT 
	*
FROM customer_orders c
INNER JOIN runner_orders r
	USING (order_id)
WHERE 
	r.cancellation IS NULL
ORDER BY c.customer_id) as cte
WHERE cte.exclusions IS NOT NULL;

-- final answer
SELECT 
	c.customer_id,
    COUNT(c.exclusions OR c.extras) AS at_least_1_change,
    COUNT(*) - COUNT(c.exclusions OR c.extras) AS no_changes -- subtract at least one changes from the total orders (*)
FROM customer_orders c
INNER JOIN runner_orders r
	USING (order_id)
WHERE 
	r.cancellation IS NULL 
GROUP BY c.customer_id;