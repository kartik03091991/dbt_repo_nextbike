WITH filtered_bike_data AS (
    SELECT
        b.station_name,
        AVG(b.station_bikes) as avg_available_bikes,
        AVG(b.station_bikes - b.bike_racks ) as avg_rack_shortage
    FROM
        `nextbike-404713.nextbike.Live3` b
    JOIN
        `nextbike-404713.nextbike.Weather_Data` w ON LOWER(b.city_name) = LOWER(w.City_Name)
    WHERE
        w.temp > 5 AND w.prcp = 0
    GROUP BY
        b.station_name

)

SELECT
    station_name,
    avg_available_bikes,
    avg_rack_shortage
FROM
    filtered_bike_data
WHERE 
    avg_rack_shortage > 5
ORDER BY avg_rack_shortage DESC

