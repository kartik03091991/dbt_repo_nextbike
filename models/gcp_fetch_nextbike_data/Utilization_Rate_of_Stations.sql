-- my_materialized_view.sql

WITH raw_data AS (
    SELECT
        station_uid,
        station_name,
        CAST(station_booked_bikes AS FLOAT64) / NULLIF(station_bikes, 0) AS utilization_rate
    FROM
        `nextbike-404713.nextbike.Live`
)

SELECT *
FROM raw_data
LIMIT 1000;
