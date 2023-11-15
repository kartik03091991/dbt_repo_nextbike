WITH weather_data AS (
    SELECT
        City_Name,
        temp AS temperature
    FROM `nextbike-404713.nextbike.Weather_Data`
),
 
distinct_next_bike_data AS (
    SELECT
        DISTINCT (station_number),
        city_name,
        station_name,
        num_places,
        city_booked_bikes,
        city_set_point_bikes,
        city_available_bikes,
        station_booked_bikes,
        station_bikes,
        bikes_available_to_rent,
        bike_racks,
        free_racks,
        special_racks,
        free_special_racks,
        country_code,
        country_name
    FROM `nextbike-404713.nextbike.Live3`
)
 
SELECT
    dnb.*,
    wd.temperature
FROM distinct_next_bike_data dnb
LEFT JOIN weather_data wd
ON LOWER(dnb.city_name) = LOWER(wd.City_Name)