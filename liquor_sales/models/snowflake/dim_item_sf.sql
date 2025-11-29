SELECT DISTINCT
    item_number,
    item_description,
    category,
    vendor_number,
    pack,
    bottle_volume_ml
FROM {{ source('iowa_liquor_sales', 'sales') }}