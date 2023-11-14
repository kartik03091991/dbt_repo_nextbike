WITH aggregated_bike_data AS (
    SELECT
        b.station_name,
        AVG(b.available_bikes) AS avg_available_bikes,
        AVG(w.wspd) AS avg_wind_speed
    FROM
        `nextbike-404713.nextbike.Live3` b
    JOIN
        `nextbike-404713.nextbike.Weather_Data` w ON LOWER(b.city_name) = LOWER(w.City_Name)
    GROUP BY
        b.station_name
)

SELECT
    station_name,
    avg_available_bikes,
    avg_wind_speed
FROM
    aggregated_bike_data
ORDER BY
    avg_wind_speed DESC