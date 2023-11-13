WITH filtered_bike_data AS (
    SELECT
        b.station_name,
        b.available_bikes,
        b.bike_racks,
        w.prcp
    FROM
        `nextbike-404713.nextbike.Live3` b
    JOIN
        `nextbike-404713.nextbike.Weather_Data` w ON b.city_name = w.City_name
)

SELECT *
FROM filtered_bike_data