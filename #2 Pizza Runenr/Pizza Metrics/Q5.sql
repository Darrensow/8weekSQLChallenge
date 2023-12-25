-- How many Vegetarian and Meatlovers were ordered by each customer?

select * from customer_orders;
select * from pizza_names;

select * from customer_orders INNER JOIN pizza_names using (pizza_id);

SELECT 
	c.customer_id,
    p.pizza_name, 
    COUNT(p.pizza_name)
FROM customer_orders c
INNER JOIN pizza_names p
	USING (pizza_id)
INNER JOIN runner_orders r
	USING (order_id)
WHERE r.pickup_time IS NOT NULL -- filter out cancelled pizzas
GROUP BY c.customer_id, p.pizza_name
ORDER BY c.customer_id, p.pizza_name;

