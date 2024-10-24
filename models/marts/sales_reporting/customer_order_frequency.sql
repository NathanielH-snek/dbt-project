SELECT
    customer_id,
    COUNT(order_id) as total_orders,
    MIN(order_date) as first_order,
    MAX(order_date) as last_order,
    AVG(order_date - prior_date)
FROM (
    SELECT
        customer_id,
        order_id,
        order_date,
        LAG(order_date, 1) OVER (PARTITION BY customer_id ORDER BY order_date) as prior_date
    FROM {{ ref ('stg_sales') }}
)
GROUP BY customer_id   