SELECT
    TO_CHAR(DATE_TRUNC('month', order_date), 'YYYY-MM') as month,
    COUNT(order_id) as total_orders,
    SUM(total_price) AS total_revenue
FROM {{ ref('stg_sales') }}
GROUP BY month
ORDER BY month DESC