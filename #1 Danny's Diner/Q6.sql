-- 6. Which item was purchased first by the customer after they became a member?

with cte2 AS (SELECT 
	*,
    RANK() OVER(PARTITION BY customer_id ORDER BY order_date) as order_sequence
FROM
	(SELECT
		s.customer_id,
		s.order_date,
		s.product_id,
		m.join_date
	FROM sales s
	LEFT JOIN members m
	ON s.customer_id = m.customer_id
	WHERE
		s.order_date >= m.join_date AND
		m.join_date IS NOT NULL
	ORDER BY s.order_date) as cte)

SELECT 
	t.customer_id, 
    m.product_name
FROM cte2 t
INNER JOIN menu m
	ON t.product_id = m.product_id
WHERE order_sequence = 1
ORDER BY customer_id;