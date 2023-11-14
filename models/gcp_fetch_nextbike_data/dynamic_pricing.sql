WITH CombinedData AS (
  SELECT
    b.*,
    CASE
    WHEN w.prcp <= 0.1 THEN 'Sunny'
    WHEN w.prcp > 0.1 AND w.prcp <= 1.0 THEN 'Light Rain'
    WHEN w.prcp > 1.0 AND w.prcp <= 2.0 THEN 'Moderate Rain'
    WHEN w.prcp > 2.0 AND w.prcp <= 3.0 THEN 'Heavy Rain'
    WHEN w.prcp > 3.0 AND w.prcp <= 4.0 THEN 'Storm'
    WHEN w.prcp > 4.0 AND w.prcp <= 5.0 THEN 'Snowy'
    ELSE 'Unknown'
  END AS weather_description
  FROM
    `nextbike-404713.nextbike.Live3` b
  JOIN
    `nextbike-404713.nextbike.Weather_Data` w ON LOWER(b.city_name) = LOWER(w.City_Name)
)
SELECT
  weather_description ,
  AVG(booked_bikes) AS avg_booked_bikes,
  CASE
    WHEN AVG(booked_bikes) >= 5 THEN 'High Demand - Increase Price'
    WHEN AVG(booked_bikes) < 5 THEN 'Low Demand - Decrease Price'
    ELSE 'Normal Demand'
  END AS pricing_strategy
FROM
  CombinedData
GROUP BY
  weather_description