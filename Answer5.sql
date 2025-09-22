SELECT category_id, AVG(price) AS avg_price
FROM products
GROUP BY category_id
HAVING AVG(price) > (
    SELECT AVG(price)
    FROM products
);
