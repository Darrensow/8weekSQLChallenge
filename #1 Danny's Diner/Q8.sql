-- 8. What is the total items and amount spent for each member before they became a member?

SELECT 
	s.customer_id,
    COUNT(s.product_id),
	SUM(me.price) AS 'Total Spent'
FROM sales s
	INNER JOIN members m
		ON s.customer_id = m.customer_id
	INNER JOIN menu me
		ON s.product_id = me.product_id
WHERE s.order_date < m.join_date
GROUP BY s.customer_id
ORDER BY customer_Id;