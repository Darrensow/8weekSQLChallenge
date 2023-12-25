-- What was the volume of orders for each day of the week?

select * from customer_orders;

SELECT 
	DAYOFWEEK(order_time) AS day_of_week_int,
	DAYNAME(order_time) AS day_of_week,
    COUNT(order_id) AS num_orders
FROM customer_orders
GROUP BY day_of_week_int, day_of_week
ORDER BY day_of_week_int;

-- From https://stackoverflow.com/a/1126982/23133764
SELECT 
	DAYNAME(order_time) AS day_of_week,
    COUNT(order_id) AS num_orders
FROM customer_orders
GROUP BY day_of_week
ORDER BY FIELD(day_of_week, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');


-- https://stackoverflow.com/a/17797544/23133764 (doesn't work that well) kiv
SELECT 
	DAYNAME(order_time) AS day_of_week,
    COUNT(order_id) AS num_orders
FROM customer_orders
GROUP BY day_of_week
ORDER BY (
    CASE DAYOFWEEK(day_of_week)
    WHEN 1 THEN 7 ELSE DAYOFWEEK(day_of_week)
    END
);