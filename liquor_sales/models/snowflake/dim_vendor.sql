SELECT DISTINCT
    vendor_number,
    vendor_name
FROM {{ source('iowa_liquor_sales', 'sales') }}