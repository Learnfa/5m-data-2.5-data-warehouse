SELECT DISTINCT
    county_number,
    county
FROM {{ source('iowa_liquor_sales', 'sales') }}
