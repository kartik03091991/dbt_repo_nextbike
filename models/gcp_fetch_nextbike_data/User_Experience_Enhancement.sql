WITH filtered_bike_data AS (
    SELECT
        b.city_name,
        b.station_name,
        b.booked_bikes,
        w.rhum
    FROM
        `nextbike-404713.nextbike.Live3` b
    JOIN
        `nextbike-404713.nextbike.Weather_Data` w ON LOWER(b.city_name) = LOWER(w.City_Name)

)

SELECT
    city_name,
    station_name,
    AVG(booked_bikes) as total_booked,
    AVG(rhum) as average_humidity
FROM
    filtered_bike_data
GROUP BY
    city_name, station_name