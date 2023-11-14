WITH aggregated_bike_data AS (
    SELECT
        bike_type,
        SUM(CASE WHEN active THEN 1 ELSE 0 END) AS total_rentals,
        AVG(w.wspd) AS avg_wind_speed,
        AVG(w.prcp) AS avg_precipitation
    FROM
        `nextbike-404713.nextbike.Live3` b
    JOIN
        `nextbike-404713.nextbike.Weather_Data` w ON LOWER(b.city_name) = LOWER(w.City_Name)
    GROUP BY
        bike_type
)

SELECT
    bike_type,
    total_rentals,
    avg_wind_speed,
    avg_precipitation
FROM
    aggregated_bike_data