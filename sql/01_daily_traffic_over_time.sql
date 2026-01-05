-- Business Question 1:
-- How does traffic change over time?
-- Metric: daily trip volume
-- Grain: one row per day

SELECT
  DATE(pickup_datetime) AS trip_date,
  COUNT(*) AS trips
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2018`
GROUP BY trip_date
ORDER BY trip_date;