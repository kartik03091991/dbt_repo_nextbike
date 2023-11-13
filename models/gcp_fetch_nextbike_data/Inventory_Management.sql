WITH filtered_bike_data AS (
    SELECT
        b.station_name,
        b.available_bikes,
        b.bike_racks,
        w.prcp
    FROM
        `nextbike-404713.nextbike.Live3` b
    JOIN
        `nextbike-404713.nextbike.Weather_Data` w ON LOWER(b.city_name) = LOWER(w.City_Name)
    WHERE
        b.available_bikes < b.set_point_bikes AND w.prcp = 0
)

SELECT *
FROM filtered_bike_data;
