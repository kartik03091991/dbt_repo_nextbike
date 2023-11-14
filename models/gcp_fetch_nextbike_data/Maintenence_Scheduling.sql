WITH filtered_bike_data AS (
    SELECT
        DISTINCT b.city_name,
        b.city_booked_bikes,
        w.rhum
    FROM
        `nextbike-404713.nextbike.Live3` b
    JOIN
        `nextbike-404713.nextbike.Weather_Data` w ON LOWER(b.city_name) = LOWER(w.City_Name)
    WHERE
        w.rhum > 80
)

SELECT
    city_name,
    SUM(city_booked_bikes) as total_booked,
    AVG(rhum) as average_humidity
FROM
    filtered_bike_data
GROUP BY
    city_name
ORDER BY average_humidity DESC