
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
    EXTRACT(DATE FROM start_time) as trip_date,
    EXTRACT(HOUR FROM start_time) as start_hour,
    EXTRACT(DAYOFWEEK FROM start_time) as day_of_week,
    duration_minutes
FROM {{ source('austin_bikeshare', 'bikeshare_trips') }}
