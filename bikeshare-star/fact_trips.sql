/*
SELECT
    trip_id,
    subscriber_type,
    bike_id,
    bike_type,
    start_time,
    CAST(start_station_id AS INT64) AS start_station_id,
    start_station_name,
    SAFE_CAST(end_station_id AS INT64) AS end_station_id,
    end_station_name,
    duration_minutes
FROM {{ source('austin_bikeshare', 'bikeshare_trips') }}
WHERE SAFE_CAST(end_station_id AS INT64) IS NOT NULL
*/

-- fix missing station err
WITH source_trips AS (
    SELECT *
    FROM {{ source('austin_bikeshare', 'bikeshare_trips') }}
),

valid_stations AS (
    SELECT station_id FROM {{ ref('dim_station') }}
)

SELECT
    trip_id,
    subscriber_type,
    bike_id,
    bike_type,
    start_time,
    CAST(start_station_id AS INT64) AS start_station_id,
    start_station_name,
    CAST(end_station_id AS INT64) AS end_station_id,
    end_station_name,
    duration_minutes
FROM source_trips
WHERE CAST(start_station_id AS INT64) IN (SELECT station_id FROM valid_stations)
  AND CAST(end_station_id AS INT64) IN (SELECT station_id FROM valid_stations)
