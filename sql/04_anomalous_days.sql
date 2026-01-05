-- Business Question 4:
-- Are there notable trends or anomalies in traffic?
-- Method: flag days far above/below the average daily trip volume
-- Grain: one row per anomalous day

WITH daily AS (
  SELECT
    DATE(pickup_datetime) AS trip_date,
    COUNT(*) AS trips
  FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2018`
  GROUP BY trip_date
),
stats AS (
  SELECT
    AVG(trips) AS avg_trips
  FROM daily
)
SELECT
  d.trip_date,
  d.trips,
  s.avg_trips,
  d.trips / s.avg_trips AS pct_of_average
FROM daily d
CROSS JOIN stats s
WHERE d.trips < 0.6 * s.avg_trips
   OR d.trips > 1.4 * s.avg_trips
ORDER BY d.trip_date;