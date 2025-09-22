CREATE TEMPORARY TABLE product_sales AS
SELECT 
    p.product_id,
    p.category_id, 
    p.product_name, 
    SUM(s.sales_amount) AS total_sales
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_id, p.category_id, p.product_name;

CREATE TEMPORARY TABLE max_sales_per_category AS
SELECT 
    category_id, 
    MAX(total_sales) AS max_sales
FROM product_sales
GROUP BY category_id;

SELECT ps.category_id, ps.product_name, ps.total_sales
FROM product_sales ps
JOIN max_sales_per_category mspc
    ON ps.category_id = mspc.category_id
    AND ps.total_sales = mspc.max_sales;

DROP TEMPORARY TABLE product_sales;
DROP TEMPORARY TABLE max_sales_per_category;