-- 9.  If each $1 spent equates to 10 points and sushi has a 2x points multiplier 
-- how many points would each customer have?

SELECT 
	customer_id,
    SUM(points) AS total_points
FROM 
	(SELECT 
		s.customer_id,
		CASE
			WHEN m.product_id = 1 THEN m.price * 10 * 2
			ELSE m.price * 10 END AS points
	FROM sales s 
		INNER JOIN menu m
			ON s.product_id = m.product_id) AS cte
GROUP BY customer_id