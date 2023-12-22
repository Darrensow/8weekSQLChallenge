-- Preprocessing
use pizza_runner;

select * from customer_orders;

-- https://stackoverflow.com/a/11448324/23133764
SET SQL_SAFE_UPDATES = 0;

UPDATE customer_orders
SET exclusions = NULL
WHERE 
	exclusions = 'null' OR
    exclusions = '';
    
UPDATE customer_orders
SET extras = NULL
WHERE 
    extras = '' OR
    extras = 'null';
    
   
select * from runner_orders;

UPDATE runner_orders
SET cancellation = NULL
WHERE 
	cancellation = '' OR
    cancellation = 'null';
    
UPDATE runner_orders
SET pickup_time = NULL
WHERE pickup_time = 'null' OR pickup_time = '';    

UPDATE runner_orders
SET distance = NULL
WHERE distance = 'null' OR distance = '';    

UPDATE runner_orders
SET duration = NULL
WHERE duration = 'null' OR duration = '';

UPDATE runner_orders
SET distance = REPLACE(distance, 'km', '')
WHERE distance LIKE '%km' OR distance LIKE '% km';

UPDATE runner_orders
SET duration = 
	CASE 
	WHEN duration LIKE '% minutes' THEN REPLACE(duration, ' minutes', '')
    WHEN duration LIKE '% mins' THEN REPLACE(duration, ' mins', '')
    WHEN duration LIKE '%mins' THEN REPLACE(duration, 'mins', '')
    WHEN duration LIKE '%minute' THEN REPLACE(duration, 'minute', '')
    WHEN duration LIKE '%minutes' THEN REPLACE(duration, 'minutes', '')
    ELSE duration
	END;
	
select * from runner_orders;