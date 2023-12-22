-- How many successful orders were delivered by each runner?

-- #TODO: Revise the answer after cleaning the dataset

select * from runner_orders;

SELECT 
	COUNT(DISTINCT order_id) AS 'Successful orders'
FROM runner_orders
WHERE 
	pickup_time != 'null' AND
    distance != 'null' AND
    duration != 'null';