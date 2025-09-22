CREATE TEMPORARY TABLE region_customer_orders AS
SELECT region, customer_id, COUNT(order_id) AS order_count
FROM orders
GROUP BY region, customer_id;

CREATE TEMPORARY TABLE max_orders_per_region AS
SELECT region, MAX(order_count) AS max_order_count
FROM region_customer_orders
GROUP BY region;

SELECT rco.region, rco.customer_id, rco.order_count
FROM region_customer_orders rco
JOIN max_orders_per_region mor
    ON rco.region = mor.region
    AND rco.order_count = mor.max_order_count;

DROP TEMPORARY TABLE region_customer_orders;
DROP TEMPORARY TABLE max_orders_per_region;