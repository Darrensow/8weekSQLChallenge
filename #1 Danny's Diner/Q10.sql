-- 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items,
-- not just sushi - how many points do customer A and B have at the end of January?

select * from menu;
select * from sales;
select * from members;

WITH cte AS (
	SELECT 
		mem.customer_id, 
		mem.join_date, 
		s.order_date,
		s.product_id, 
		DATE_ADD(join_date, INTERVAL 1 WEEK) AS last_promo_day,
		m.price
	FROM members mem
		INNER JOIN sales s
			ON mem.customer_id = s.customer_id
		INNER JOIN menu m
			ON s.product_id = m.product_id
	WHERE MONTH(s.order_date) = 1
)

SELECT 
	customer_id,
    SUM(
		CASE 
		WHEN order_date BETWEEN join_date AND last_promo_day - 1 THEN price * 10 * 2
		WHEN product_id = 1 THEN price * 10 * 2
		ELSE price * 10 END 
	) AS points
FROM cte
GROUP BY customer_id;
