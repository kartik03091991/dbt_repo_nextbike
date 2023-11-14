WITH aggregated_bike_data AS (
    SELECT
        station_name,
        SUM(special_racks) as total_special_racks,
        SUM(free_special_racks) as total_free_special_racks
    FROM
         `nextbike-404713.nextbike.Live3`
    GROUP BY
        station_name
)

SELECT
    station_name,
    total_special_racks,
    total_free_special_racks
FROM
    aggregated_bike_data