WITH CombinedData AS (
  SELECT
    b.*,
    w.weather_description
  FROM
    `nextbike-404713.nextbike.Live3` b
  JOIN
    `nextbike-404713.nextbike.Weather_Data` w ON b.city_name = w.City_Name
)
SELECT
    CASE
    WHEN prcp <= 0.1 THEN 'Sunny'
    WHEN prcp > 0.1 AND prcp <= 1.0 THEN 'Light Rain'
    WHEN prcp > 1.0 AND prcp <= 2.0 THEN 'Moderate Rain'
    WHEN prcp > 2.0 AND prcp <= 3.0 THEN 'Heavy Rain'
    WHEN prcp > 3.0 AND prcp <= 4.0 THEN 'Storm'
    WHEN prcp > 4.0 AND prcp <= 5.0 THEN 'Snowy'
    ELSE 'Unknown'
  END AS weather_description ,
  AVG(booked_bikes) AS avg_booked_bikes,
  CASE
    WHEN AVG(booked_bikes) > 50 THEN 'High Demand - Increase Price'
    WHEN AVG(booked_bikes) <= 20 THEN 'Low Demand - Decrease Price'
    ELSE 'Normal Demand'
  END AS pricing_strategy
FROM
  CombinedData
GROUP BY
  weather_description