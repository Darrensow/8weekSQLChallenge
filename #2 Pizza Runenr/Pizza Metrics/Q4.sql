-- How many of each type of pizza was delivered?
USE pizza_runner;

select * from runner_orders;
select * from customer_orders;
select * from pizza_names;

SELECT 
	pn.pizza_name,
    COUNT(co.order_id)
FROM pizza_names pn
INNER JOIN customer_orders co
	ON pn.pizza_id = co.pizza_id
INNER JOIN runner_orders ro
	ON ro.order_id = co.order_id
WHERE ro.pickup_time IS NOT NULL
GROUP BY pn.pizza_name;