-- What was the maximum number of pizzas delivered in a single order?

select * from runner_orders;
select * from customer_orders;

SELECT 
	c.order_id,
	COUNT(c.pizza_id) AS pizzas_ordered
FROM customer_orders c
INNER JOIN runner_orders r
	USING (order_id)
WHERE r.pickup_time IS NOT NULL
GROUP by c.order_id
ORDER BY pizzas_ordered DESC
LIMIT 1;