-- 7. Which item was purchased just before the customer became a member?

WITH ranks AS(
	(SELECT 
		customer_id,
		order_date, 
		product_id,
		DENSE_RANK() OVER(
			PARTITION BY cte.customer_id
			ORDER BY order_date DESC
		) AS ranking
	FROM 
		(SELECT 
			s.customer_id,
			s.order_date,
			s.product_id,
			m.join_date
		FROM sales s
		INNER JOIN members m
			ON s.customer_id = m.customer_id
		WHERE 
		s.order_date < m.join_date) AS cte)
)

-- SELECT * FROM ranks; 


SELECT 
	r.customer_id,
    m.product_name
FROM ranks r
INNER JOIN menu m
	ON r.product_id = m.product_id
WHERE
	ranking = 1
ORDER BY customer_id;