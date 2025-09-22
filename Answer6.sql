SELECT prod.product_id, prod.product_name
FROM products prod
LEFT JOIN orders o ON prod.product_id = o.product_id
WHERE o.order_id IS NULL;
