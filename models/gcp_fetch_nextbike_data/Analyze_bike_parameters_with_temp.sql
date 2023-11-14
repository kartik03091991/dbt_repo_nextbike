WITH weather_data AS (
    SELECT
        City_Name,
        temp AS temperature
    FROM `nextbike-404713.nextbike.Weather_Data`
),
 
next_bike_data AS (
    SELECT
        city_name,
        num_places,
        refresh_rate,
        city_booked_bikes,
        city_set_point_bikes,
        city_available_bikes,
        country_code,
        country_name
    FROM `nextbike-404713.nextbike.Live3`
)
 
SELECT
    nb.*,
    wd.temperature
FROM next_bike_data nb
LEFT JOIN weather_data wd
ON LOWER(nb.city_name) = LOWER(wd.City_Name)