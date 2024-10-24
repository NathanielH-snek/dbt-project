SELECT 
    stg_products.category as category,
    SUM(stg_sales.quantity) as total_sales,
    SUM(stg_sales.total_price) as total_revenue,
    AVG(stg_sales.total_price) as avg_price
FROM {{ ref('stg_products') }} as stg_products
INNER JOIN {{ ref('stg_sales') }} as stg_sales
ON stg_products.product_id = stg_sales.product_id
GROUP BY category