SELECT DISTINCT
    category,
    category_name
FROM {{ source('iowa_liquor_sales', 'sales') }}