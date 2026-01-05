-- Business Question 1 (supporting):
-- Weekly traffic trend to smooth daily volatility
-- Metric: weekly trip volume
-- Grain: one row per week

SELECT
  EXTRACT(YEAR FROM pickup_datetime) AS year,
  EXTRACT(WEEK FROM pickup_datetime) AS week,
  COUNT(*) AS trips
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2018`
GROUP BY year, week
ORDER BY year, week;