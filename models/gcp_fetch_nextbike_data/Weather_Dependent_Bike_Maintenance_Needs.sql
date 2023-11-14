WITH aggregated_bike_data AS (
    SELECT
        station_name,
        SUM(booked_bikes) AS total_booked_bikes,
        AVG(w.rhum) AS average_humidity,
        AVG(w.prcp) AS average_precipitation
    FROM
        `nextbike-404713.nextbike.Live3` b
    JOIN
        `nextbike-404713.nextbike.Weather_Data` w ON LOWER(b.city_name) = LOWER(w.City_Name)
    WHERE
        active = TRUE
    GROUP BY
        station_name
)

SELECT
    station_name,
    total_booked_bikes,
    average_humidity,
    average_precipitation
FROM
    aggregated_bike_data