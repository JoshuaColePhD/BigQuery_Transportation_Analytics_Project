-- Business Question 2:
-- Where does traffic come from?
-- Dimension: pickup borough
-- Metric: trip volume (and share of total)
-- Grain: one row per borough

SELECT
  z.borough AS pickup_borough,
  COUNT(*) AS trips,
  COUNT(*) / SUM(COUNT(*)) OVER () AS pct_of_total_trips
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2018` t
LEFT JOIN `bigquery-public-data.new_york_taxi_trips.taxi_zone_geom` z
  ON CAST(t.pickup_location_id AS STRING) = z.zone_id
GROUP BY pickup_borough
ORDER BY trips DESC;