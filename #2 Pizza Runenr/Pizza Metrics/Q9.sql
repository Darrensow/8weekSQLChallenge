-- What was the total volume of pizzas ordered for each hour of the day?

select * from customer_orders ORDER BY order_time;

CREATE VIEW delivered_orders AS
SELECT * FROM customer_orders
JOIN runner_orders
USING (order_id)
WHERE distance IS NOT NULL;

select * from delivered_orders order by order_time;

SELECT
	EXTRACT(HOUR FROM order_time) AS hour_of_day,
    COUNT(order_id) AS number_of_orders
FROM customer_orders
GROUP BY hour_of_day
ORDER BY hour_of_day;