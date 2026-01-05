-- Business Question 2:
-- Where does traffic come from?
-- Dimension: fare size (bucketed)
-- Metric: trip volume (and share of total)
-- Grain: one row per fare bucket

SELECT
  CASE
    WHEN total_amount < 10 THEN 'Under $10'
    WHEN total_amount < 25 THEN '$10–$25'
    WHEN total_amount < 50 THEN '$25–$50'
    ELSE '$50+'
  END AS fare_bucket,
  COUNT(*) AS trips,
  COUNT(*) / SUM(COUNT(*)) OVER () AS pct_of_total_trips
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2018`
GROUP BY fare_bucket
ORDER BY trips DESC;