-- This is a dbt model that aggregates data from bike_data and weather_data

WITH filtered_bike_data AS (
    SELECT
        b.city_name,
        b.station_name,
        AVG(b.station_bikes) as avg_available_bikes,
        AVG(b.station_bikes - b.bike_racks) as avg_rack_shortage,
        AVG(w.temp) as avg_temperature,
        AVG(w.prcp) as avg_precipitation,
        AVG(w.rhum) as avg_humidity
    FROM
        `nextbike-404713.nextbike.Live3` b
    JOIN
        `nextbike-404713.nextbike.Weather_Data` w ON LOWER(b.city_name) = LOWER(w.City_Name)
    WHERE
        w.temp > 5 AND w.prcp = 0
    GROUP BY
        b.city_name, b.station_name
)

SELECT
    city_name,
    station_name,
    avg_available_bikes,
    avg_rack_shortage,
    avg_temperature,
    avg_precipitation,
    avg_humidity
FROM
    filtered_bike_data
WHERE 
    avg_rack_shortage > 5
ORDER BY
    avg_rack_shortage DESC
